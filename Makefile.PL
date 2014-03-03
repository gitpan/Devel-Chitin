
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Programmatic interface to the Perl debugging API",
  "AUTHOR" => "Anthony Brummett <brummett\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Devel::Chitin::CommonParent" => 0,
    "Exporter" => 0,
    "File::Basename" => 0,
    "IO::Pipe" => 0,
    "Test::Builder" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Devel-Chitin",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Devel::Chitin",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Digest::MD5" => 0,
    "IO::File" => 0,
    "List::Util" => 0,
    "PadWalker" => 0,
    "Scalar::Util" => 0,
    "base" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.01",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



