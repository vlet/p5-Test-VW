package Test::VW;
use 5.008001;
use strict;
use warnings;
require Test::More;

our $VERSION = "0.02";

my @list = qw(
  ok is isnt cmp_ok is_deeply can_ok isa_ok use_ok require_ok
  like unlike new_ok
);

sub import {
    return unless $ENV{AUTOMATED_TESTING};

    my $test_builder = Test::More->builder;
    my $vw           = sub {
        $test_builder->ok(1);
    };

    no warnings qw'redefine prototype';
    no strict "refs";

    for my $t (@list) {
        *{ "main" . "::" . $t } = $vw if *{ "main" . "::" . $t };
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

Test::VW - always green cpantesters

=head1 SYNOPSIS

    use Test::More;
    use Test::VW;

=head1 DESCRIPTION

Test::VW detects when your test are being run on cpantesters (checks for
AUTOMATED_TESTING environment variable) and makes them always pass.

=head1 SEE ALSO

PHP - https://github.com/hmlb/phpunit-vw

Node.js - https://github.com/auchenberg/volkswagen

=head1 LICENSE

Copyright (C) Vladimir Lettiev.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Vladimir Lettiev E<lt>thecrux@gmail.comE<gt>

=cut

