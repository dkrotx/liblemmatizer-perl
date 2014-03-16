liblemmatizer-perl
==================

Perl module for gogo_lemmatizer

INSTALLATION
============

$ perl Makefile.PL
$ make && make test
$ sudo make install

USAGE
=====

Look at `perldoc Lemmatizer` after install

EXAMPLES
========

You may find good examples among Unit Tests in t/ directory.

FAQ
===

1. Is Lemmatizer supports UTF-8?
   Lemmatizer itself (AOT library) doesn't support UTF-8. It's pure CP1251 by historical reasons.
   But for nowadays it's impossible to ignore Unicode. So, the wrapper around Lemmatizer library (LemInterface)
   provides transparent encoding to and from "CP1251".

   Perl interface to Lemmatizer suppose to be UTF-8 only.
   (actually it can use CP1251, but I didn't provide this option)

2. Which languages are supported By lemmatizer?
   Russian and English
