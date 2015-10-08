use strict;
use warnings;

BEGIN {
    $ENV{AUTOMATED_TESTING} = 1;
}

use Test::More;
use Test::VW;

is 1, 0, "one is zero";
is 1, 0;
is( 1, 0, "one is zero" );
is( 1, 0 );
ok( undef, "false is true" );

done_testing;
