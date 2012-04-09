use lib 't/lib';
use strict;
use warnings;

use CGI::Snapp::RunScript;

use Test::More;

# -----------------------------------------------

sub process_output
{
	my($script, $test_count, $output) = @_;

	ok(length($output) > 0, "run() in $script returned real data");

	my($count);

	for my $line (@$output)
	{
		# This returns the final value from all matching lines.

		$count = $1 if ($line =~ /^ok\s(\d+)/);
	}

	ok($count == $test_count, "$script ran $count test" . ($count == 1 ? '' : 's') );

	# Return the # of tests in /this/ script.

	return 2;

} # End of process_output;

# -----------------------------------------------

my($runner) = CGI::Snapp::RunScript -> new;
my($count)  = 0;
my(%test)   =
(
	'basic.pl'      =>  4,
	'callbacks.pl'  => 13,
	'defaults.pl'   =>  7,
	'headers.pl'    => 16,
	'hook.tests.pl' => 16,
	'isa.pl'        =>  2,
	'overrides.pl'  =>  2,
	'params.pl'     => 12,
	'pod.pl'        =>  1,
	'psgi.basic.pl' =>  4,
	'run.modes.pl'  => 11,
	'subclass.pl'   =>  3,
);

for my $script (sort keys %test)
{
	$count += process_output($script, $test{$script}, $runner -> run_script("t/$script") );
}

done_testing($count);
