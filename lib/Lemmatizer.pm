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
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Lemmatizer - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Lemmatizer;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Lemmatizer, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

KISEL Jan, E<lt>dkrot@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014 by KISEL Jan

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
