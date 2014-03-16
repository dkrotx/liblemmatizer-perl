package Lemmatizer;

use 5.003;
use strict;

require Exporter;
require DynaLoader;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter
	DynaLoader);

use constant LEMM_PART_OF_SPEECH => 1;

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Lemmatizer ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
%EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

@EXPORT = qw(
	LEMM_PART_OF_SPEECH 
);

$VERSION = '0.01';

bootstrap Lemmatizer $VERSION;

# Preloaded methods go here.

1;
__END__

=head1 NAME

Lemmatizer - Perl extension for gogo_lemmatizer library.

=head1 SYNOPSIS

  use Lemmatizer;

  my $lem = new Lemmatizer;

  # simplest form of usage
  my $first_form = $lem->FirstForm("played"); # should be "PLAY"

  # more complicated usage
  my $info = $lem->Lemmatize("played", LEMM_PART_OF_SPEECH);
  printf("first form is '%s'; part of speech is '%s'\n", $info->{first_form}, $info->{part_of_speech});
  # will print "PLAY", "VERB"
  

=head1 DESCRIPTION

Lemmatizer Perl extension provides wrapper for C++ AOT library. You picking the word, and get some information about it.
This just a stub for most common cases. If you have additional cases which you feel appropriate for this extension,
e-mail me please.

=head2 EXPORT

Constants like LEMM_PART_OF_SPEECH is exported by default.


=head1 SEE ALSO

Web-site of origin creators of lemmatizer library: http://aot.ru/

=head1 AUTHOR

KISEL Jan, E<lt>jdkrot@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by KISEL Jan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
