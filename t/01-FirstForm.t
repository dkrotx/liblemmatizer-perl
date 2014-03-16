use Test::More qw(no_plan);
use strict;
BEGIN { use_ok('Lemmatizer') };

my $lem = new Lemmatizer;
my $ff;

subtest "simple test: first form == given word" => sub {
    $ff = $lem->FirstForm("принц");
    isnt($ff, undef, "given word certainly has first form");
    is($ff, "ПРИНЦ");
};

subtest "first form != given word" => sub {
    $ff = $lem->FirstForm("принцам");
    isnt($ff, undef, "given word certainly has first form");
    is($ff, "ПРИНЦ");
};
