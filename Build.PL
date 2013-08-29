use strict;
use warnings;

use Module::Build;

Module::Build -> new
(
	module_name    => 'CGI::Snapp',
	license        => 'artistic_2',
	dist_abstract  => 'An almost back-compat fork of CGI::Application',
	dist_author    => 'Ron Savage <ron@savage.net.au>',
	build_requires =>
	{
		'Test::Deep' => 0.110,
		'Test::More' => 0.94,
#		'Test::Pod'  => 1.45, # Make it optional. See t/pod.t
	},
	configure_requires =>
	{
		'Module::Build' => 0,
	},
	requires =>
	{
		'Capture::Tiny'         => 0.22,
		'Carp'                  => 1.20,
		'CGI'                   => 3.63,
		'CGI::PSGI'             => 0.15,
		'CGI::Simple'           => 1.113,
		'Class::ISA'            => 0.36,
		'Data::Dumper::Concise' => 2.020,
		'File::Spec'            => 3.40,
		'Hash::FieldHash'       => 0.14,
		'IO::Pipe'              => 1.14,
		'Log::Handler'          => 0.78,
		'parent'                => 0.225,
		'Proc::Fork'            => 0.802,
		'strict'                => 1.03,
		'Try::Tiny'             => 0.16,
		'vars'                  => 1.01,
		'warnings'              => 1.03,
	},
) -> create_build_script();
