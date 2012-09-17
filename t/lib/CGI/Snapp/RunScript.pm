package CGI::Snapp::RunScript;

use strict;
use warnings;

use Capture::Tiny 'capture';

use Carp;

use IO::Pipe;

use Proc::Fork;

our $VERSION = '1.02';

# --------------------------------------------------

sub new
{
	my($class) = @_;

	return bless {}, $class;

}	# End of new.

# -----------------------------------------------

sub run_script
{
	my($self, $script) = @_;
	my($pipe) = IO::Pipe -> new;

	my(@stack);

	run_fork
	{
		parent
		{
			my($child) = @_;

			waitpid $child, 0;
			$pipe -> reader;
			push @stack, $_ while <$pipe>;
		}
		child
		{
			my($stdout, $stderr, @result) = capture{system($^X, $script)};
			$pipe -> writer;
			print $pipe $stdout;
			exit;
		}
		error
		{
			croak "Testing script $script\n";
		}
	};

	return [@stack];

} # End of run_script;

# --------------------------------------------------

1;
