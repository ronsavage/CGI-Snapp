use lib 't/lib';
use strict;
use warnings;

use CGI::Snapp::Overrides;

use Test::More;

# ------------------------------------------------

sub test_a
{
	# Set debug so CGI::Snapp itself outputs log messages.

	my($app)    = CGI::Snapp::Overrides -> new(maxlevel => 'debug', send_output => 0);
	my($output) = $app -> run;

	ok($output =~ /Query parameters.+Query environment/s, 'run() produced the correct output');

	return 1;

} # End of test_a.

# ------------------------------------------------

my($count) = 0;

$count += test_a('t/overrides.a.pl');

done_testing($count);

