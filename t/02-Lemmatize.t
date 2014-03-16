use Test::More qw(no_plan);
use strict;
BEGIN { use_ok('Lemmatizer') };

my $lem = new Lemmatizer;
my $res;

# same effect as FirstForm
subtest "simple test of ::Lematize" => sub {
    $res = $lem->Lemmatize("принцу");
    isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
    isnt($res->{first_form}, undef, "given word certainly has first form");
    is($res->{first_form}, "ПРИНЦ");
};


# extended use
subtest "test part of speech" => sub {
    $res = $lem->Lemmatize("принцессе", LEMM_PART_OF_SPEECH);
    isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
    isnt($res->{first_form}, undef, "given word certainly has first form");
    is($res->{first_form}, "ПРИНЦЕССА");
    isnt($res->{part_of_speech}, undef, "we requested part of speech");
    is($res->{part_of_speech}, "С");
};

##
# Some more cases
# There are many other parts of speech thought
my @cases = (
    {
        origin         => "клавиши",
        first_form     => "КЛАВИШ",
        part_of_speech => "С",
    },
    {
        origin         => "опасному",
        first_form     => "ОПАСНЫЙ",
        part_of_speech => "П",
    },
    {
        origin         => "ему",
        first_form     => "ОН",
        part_of_speech => "МС",
    },
    {
        origin         => "просвистела",
        first_form     => "ПРОСВИСТЕТЬ",
        part_of_speech => "Г",
    },
    {
        origin         => "мечтать",
        first_form     => "МЕЧТАТЬ",
        part_of_speech => "ИНФИНИТИВ",
    },
    {
        origin         => "четыре",
        first_form     => "ЧЕТЫРЕ",
        part_of_speech => "ЧИСЛ",
    },
);

subtest "test part of speech (many cases)" => sub {
    foreach my $c (@cases) {
        $res = $lem->Lemmatize($c->{origin}, LEMM_PART_OF_SPEECH);
        isnt($res, undef, "result of Lemmatizer::Lemmatize has to be defined!");
        isnt($res->{first_form}, undef, "given word certainly has first form");
        is($res->{first_form}, $c->{first_form});
        isnt($res->{part_of_speech}, undef, "we requested part of speech");
        is($res->{part_of_speech}, $c->{part_of_speech});
    }
};
