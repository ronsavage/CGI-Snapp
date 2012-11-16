package CGI::Snapp::SubClass;

use parent 'CGI::Snapp';
use strict;
use warnings;

use Hash::FieldHash ':all';

fieldhash my %verbose => 'verbose';

our $VERSION = '1.03';

# --------------------------------------------------

sub _init
{
	my($self, $arg) = @_;
	$$arg{verbose}  ||= 0; # Caller can set.

	return $self -> SUPER::_init($arg);

} # End of _init.

# --------------------------------------------------

1;
