use strict;
use warnings;

use Test::More;

# ------------------------------------------------

BEGIN{ use_ok('CGI::Snapp'); }

my($count) = 1; # Counting the use_ok above.

isa_ok(CGI::Snapp -> new(send_output => 0), 'CGI::Snapp'); $count++;

done_testing($count);
