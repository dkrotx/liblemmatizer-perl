use 5.003;
use ExtUtils::MakeMaker;

# use c++ compiler since provide OO-iface
my $CXX="g++";
my $cflags  = `pkg-config --cflags lemmatizer`;
my $ldflags = `pkg-config --libs lemmatizer`;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Lemmatizer',
    VERSION_FROM      => 'lib/Lemmatizer.pm', # finds $VERSION
    PREREQ_PM         => {'Test'        =>  0, }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Lemmatizer.pm', # retrieve abstract from module
       AUTHOR         => 'KISEL Jan <kisel@corp.mail.ru>') : ()),
    LIBS              => [ "$ldflags" ],
    DEFINE            => '-Wno-write-strings', # e.g., '-DHAVE_SOMETHING'a
    CC                => "$CXX",
    LD                => "$CXX",
    INC               => "$cflags",

	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too

    XSOPT             => '-C++',
    TYPEMAPS          => [ 'perlobject.map' ],
    dist              => {COMPRESS => 'gzip', SUFFIX => '.gz'},
    USE_MM_LD_RUN_PATH => 1
);
