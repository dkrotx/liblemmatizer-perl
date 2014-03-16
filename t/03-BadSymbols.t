use Test::More qw(no_plan);
use strict;
BEGIN { use_ok('Lemmatizer') };

my $lem = new Lemmatizer;

subtest "Any UTF8 symbols are valid, though may be unknown for lemmatizer" => sub {
    my $ff = $lem->FirstForm("始识是十狮尸");
    is($ff, undef, "lemmatizer don't know Eastern languages");
};
