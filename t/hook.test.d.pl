use lib 't/lib';
use strict;
use warnings;

use CGI;

use CGI::Snapp::HookTestD;

# ------------------------------------------------

sub test_1
{
	# Set debug so CGI::Snapp itself outputs log messages.

	my($app)         = CGI::Snapp::HookTestD -> new(maxlevel => 'debug', send_output => 0);
	my($mode_source) = 'rm';
	my($run_mode)    = 'start_sub';
	my(%run_modes)   = $app -> run_modes;

	$app -> query(CGI -> new({$mode_source => $run_mode}) );

	my($output) = $app -> run;

} # End of test_1.

# ------------------------------------------------

test_1;
