use strict;
use warnings;

use CGI::Snapp;

use Test::More tests => 4;

# ------------------------------------------------
# See also CGI::Snapp::Dispatch's t/psgi.args.t.
# Set debug so CGI::Snapp itself outputs log messages.

my($app) = CGI::Snapp -> psgi_app(maxlevel => 'debug');

isa_ok($app, 'CODE');

my($psgi_env) = {};
my($output)   = $app -> ($psgi_env);

ok($$output[0] == 200,      'Status is 200');
ok(length($$output[2]) > 0, 'Output is not empty');
ok(join('', @{$$output[2]}) =~ /Run mode: start.+Query parameters.+Query environment/s, 'Retrieved output of dump_html()');
