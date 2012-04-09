use lib 't/lib';
use strict;
use warnings;

use CGI::Snapp::Header;

use Test::More tests => 16;

# ------------------------------------------------
# Set debug so CGI::Snapp itself outputs log messages.

my($app) = CGI::Snapp::Header -> new(maxlevel => 'debug', send_output => 0);

isa_ok($app, 'CGI::Snapp::Header');

isa_ok($app -> query, 'CGI::Simple');
isa_ok($app -> cgiapp_get_query, 'CGI::Simple');

# Test default headers.

my($output) = $app -> run;

ok(length($output) > 0, "Output from $0 is not empty");
ok($output =~ m|Content-Type: text/html|, "'Content-Type: text/html' present in default header");

# Test redirect headers.

$app -> header_type('redirect');
$app -> header_props(-uri => 'http://savage.net.au/');

is_deeply({$app -> header_props}, {-uri => 'http://savage.net.au/'}, 'Set/get header props');

$output = $app -> run;

ok(length($output) > 0, "Output from $0 is not empty");
ok($output =~ m~Status: 302 (?:Found|Moved)~, "'Status: 302 Found' present in redirect header");
ok($output =~ m|http://savage.net.au/|,       "'http://savage.net.au/' present in redirect header");

# Test no headers.

$app -> header_type('none');

$output = $app -> run;

ok(length($output) > 0, "Output from $0 is not empty");
ok($output =~ /^I am module CGI::Snapp::Header$/, "No headers present after header_type('none')");

# Test cookie.

my($q)      = $app -> query;
my($cookie) = $q -> cookie
(
 -domain  => 'perl.org',
 -expires => '-1y',
 -name    => 'cooky_name',
 -path    => '/cooky_path',
 -value   => 'cooky_value',
);

$app -> header_type('header');
$app -> header_props(-cookie => $cookie);

$output = $app -> run;

ok(length($output) > 0, "Output from $0 is not empty");
ok($output =~ m|Content-Type: text/html|, "'Content-Type: text/html' present in default header");
ok($output =~ m|cooky_name=cooky_value;|, "'cooky_name=cooky_value;' present in default header");
ok($output =~ m|domain=perl.org;|,        "'domain=perl.org;' present in default header");
ok($output =~ m|path=/cooky_path;|,       "'path=/cooky_path;' present in default header");
