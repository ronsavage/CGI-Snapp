use lib 't/lib';
use strict;
use warnings;

use CGI::Snapp::SubClass;

use Test::More;

# ------------------------------------------------

my($count) = 0;
my($app)   = CGI::Snapp::SubClass -> new(maxlevel => 'debug', send_output => 0, verbose => 1);

# Get the subclass's verbose value.

ok($app -> verbose == 1, 'Subclass has its own params to new() and methods'); $count++;

# Set/get a hash of params.

my(%old_params) = (one => 1, two => 2);

$app -> param(%old_params);

my(%new_params) = map{($_ => $app -> param($_) )} $app -> param;

is_deeply(\%old_params, \%new_params, 'Can set and get a hash of params'); $count++;

$app -> delete($_) for keys %old_params;

is_deeply([$app -> param], [], 'No params are set after mass delete'); $count++;

done_testing($count);
