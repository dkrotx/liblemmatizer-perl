use Test::More qw(no_plan);
use strict;
BEGIN { use_ok('Lemmatizer') };

# English language is also supported by lemmatizer.
# So, check it works in a similar manar like we checked Russian.

my $lem = new Lemmatizer;
my $res;

# same effect as FirstForm
subtest "simple test of ::Lematize (english)" => sub {
    $res = $lem->Lemmatize("heroes");
    isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
    isnt($res->{first_form}, undef, "given word certainly has first form");
    is($res->{first_form}, "HERO");
};


# extended use
subtest "test part of speech (english)" => sub {
    $res = $lem->Lemmatize("loaded", LEMM_PART_OF_SPEECH);
    isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
    isnt($res->{first_form}, undef, "given word certainly has first form");
    is($res->{first_form}, "LOAD");
    isnt($res->{part_of_speech}, undef, "we requested part of speech");
    is($res->{part_of_speech}, "VERB");
};

##
# Some more cases
# There are many other parts of speech thought
my @cases = (
    {
        origin         => "killed",
        first_form     => "KILL",
        part_of_speech => "VERB",
    },
    {
        origin         => "girls",
        first_form     => "GIRL",
        part_of_speech => "NOUN",
    },
    {
        origin         => "him",
        first_form     => "HE",
        part_of_speech => "PN",
    },
    {
        origin         => "red",
        first_form     => "RED",
        part_of_speech => "ADJECTIVE",
    },
);

subtest "test part of speech (many cases, english)" => sub {
    foreach my $c (@cases) {
        $res = $lem->Lemmatize($c->{origin}, LEMM_PART_OF_SPEECH);
        isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
        isnt($res->{first_form}, undef, "given word certainly has first form");
        is($res->{first_form}, $c->{first_form});
        isnt($res->{part_of_speech}, undef, "we requested part of speech");
        is($res->{part_of_speech}, $c->{part_of_speech});
    }
};
