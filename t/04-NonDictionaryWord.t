use Test::More qw(no_plan);
use strict;
BEGIN { use_ok('Lemmatizer') };

my $lem = new Lemmatizer;

my @cases = (
    {
        origin         => "Агрымбой",
        first_form     => "АГРЫМБА",
        part_of_speech => "С",
    },
    {
        origin         => "456ghj567",
        first_form     => "456GHJ567",
        part_of_speech => "С",
    },
);

subtest "test for non-dictionary words" => sub {
    foreach my $c (@cases) {
        my $res = $lem->Lemmatize($c->{origin}, LEMM_PART_OF_SPEECH);
        isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
        isnt($res->{first_form}, undef, "given word certainly has first form");
        is($res->{first_form}, $c->{first_form});
        isnt($res->{part_of_speech}, undef, "we requested part of speech");
        is($res->{part_of_speech}, $c->{part_of_speech});
    }
};
