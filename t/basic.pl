use strict;
use warnings;

use CGI;
use CGI::Snapp;

use Test::More tests => 4;

# ------------------------------------------------
# Set debug so CGI::Snapp itself outputs log messages.

my($app) = CGI::Snapp -> new(maxlevel => 'debug', QUERY => CGI -> new, send_output => 0);

isa_ok($app, 'CGI::Snapp');

my($modes) = {finish => 'finisher', starter => 'starter'};

$app -> query -> param(rm => 'start');
$app -> run_modes($modes);

is_deeply({$app -> run_modes}, {%$modes, start => 'dump_html'}, 'Set/get run modes');
 
my($output) = $app -> run;

ok(length($output) > 0, "Output from $0 is not empty");
ok($app -> get_current_runmode eq 'start', "Current run mode is 'start'");
