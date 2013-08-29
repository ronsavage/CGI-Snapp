use strict;
use warnings;

use ExtUtils::MakeMaker;

LICENSE   => 'artistic_2',

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile
(
	($] ge '5.005') ?
	(
	 AUTHOR   => 'Ron Savage (ron@savage.net.au)',
	 ABSTRACT => 'An almost back-compat fork of CGI::Application',
	   ) : (),
	clean =>
	{
		FILES => 'blib/* Makefile MANIFEST CGI-Snapp-*'
	},
	dist =>
	{
		COMPRESS => 'gzip',
		SUFFIX   => 'gz'
	},
	DISTNAME  => 'CGI-Snapp',
	NAME      => 'CGI::Snapp',
	LICENSE   => 'artistic_2',
	PL_FILES  => {},
	PREREQ_PM =>
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
		'Test::Deep'            => 0.110,
		'Test::More'            => 0.94,
#		'Test::Pod'             => 1.45, # Make it optional. See t/pod.t
		'Try::Tiny'             => 0.16,
		'vars'                  => 1.01,
		'warnings'              => 1.03,
	},
	VERSION_FROM => 'lib/CGI/Snapp.pm',
);
