use strict;
use warnings;

use Test::More;

# ------------------------------------------------

BEGIN{ use_ok('CGI::Snapp'); }

my($count) = 1; # Counting the use_ok above.
my($app)   = CGI::Snapp -> new(maxlevel => 'debug'); # Not new(send_output => 0)!

# Check defaults for various things. Note: run() has not been called.

is($app -> error_mode,          '',       'Get default error mode');  $count++;
is($app -> get_current_runmode, undef,    'Get default run mode');    $count++;
is($app -> header_type,         'header', 'Get default header type'); $count++;
is($app -> _run_mode_source,    'rm',     'Get default mode source'); $count++;
is($app -> send_output,         1,        'Get default send_output'); $count++;
is($app -> start_mode,          'start',  'Get default start mode');  $count++;

done_testing($count);
