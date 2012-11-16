use lib 't/lib';
use strict;
use warnings;

use CGI::Snapp::RunScript;

use File::Spec;

use Test::More;

# -----------------------------------------------

sub test_a
{
	my($runner, $script) = @_;
	my($output) = $runner -> run_script($script);

	chomp(@$output);

	$output     = [grep{/CGI::Snapp::Overrides/} @$output];
	my($expect) =
[
'CGI::Snapp::Overrides.cgiapp_init()',
'CGI::Snapp::Overrides.setup()',
'CGI::Snapp::Overrides.cgiapp_prerun()',
'CGI::Snapp::Overrides.cgiapp_postrun()',
'CGI::Snapp::Overrides.teardown()',
];
	ok($#$output >= 0, "$script returned real data");

	is_deeply($output, $expect, "$script ran the correct overrides");

	return 2;

} # End of test_a.

# -----------------------------------------------

my($runner) = CGI::Snapp::RunScript -> new;
my($count)  = 0;

$count += test_a($runner, File::Spec -> catfile('t', 'override.a.pl') );

done_testing($count);
