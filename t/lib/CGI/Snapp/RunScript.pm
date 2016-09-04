package CGI::Snapp::RunScript;

use strict;
use warnings;

use Capture::Tiny 'capture';

use Carp;

use IO::Pipe;

use Proc::Fork;

our $VERSION = '2.00';

# --------------------------------------------------

sub new
{
	my($class) = @_;

	return bless {}, $class;

}	# End of new.

# -----------------------------------------------

sub run_script
{
	my($self, $script)	= @_;
	my($cmd)			= "$^X $script";

	my(@stack);

	{
		no warnings; # Stops insecure PATH & dependency warnings...

		open PIPE, "-|", $cmd || croak "Pipe died while testing script $script. \n";

		while (my $line = <PIPE>)
		{
			push @stack, $line;
		}

		close(PIPE) || croak "Pipe died while closing it. \n";
	}

	return [@stack];

} # End of run_script;

# --------------------------------------------------

1;
