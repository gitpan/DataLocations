Wednesday, April 28, 1999

This is the Data::Locations module with shared libraries compiled for 
MacPerl.  Shared libraries run only on PPC and CFM68K versions, not 
non-CFM 68K versions.

Installation.  It's best to install the files in ':blib:lib' into your 
'site_perl' folder; that, after all, is what it is meant for -

    {MACPERL}site_perl:Data:Locations.pm
    {MACPERL}site_perl:MacCFM68K:auto:Data:Locations:Locations
    {MACPERL}site_perl:MacPPC:auto:Data:Locations:Locations

Also read the original README file for this distribution, included below.

Testing.  The 't' files have been tested using both the MacPerl application 
and the MPW perl tool.  When testing before installation, use the -I switch 
(perl tool in MPW) or Edit>Preferences (MacPerl app) to add ':blib:lib' to 
your path, and make sure it precedes all others.

*****

Arved Sandstrom          mailto:Arved_37@chebucto.ns.ca

*****

                  =========================================
                    Package "Data::Locations" Version 5.0
                  =========================================


This package is available for download either from my web site at

                  http://www.engelschall.com/u/sb/download/

or from any CPAN (= "Comprehensive Perl Archive Network") mirror server:

                  http://www.perl.com/CPAN/authors/id/STBEY/


Prerequisites:
--------------

Perl version 5.004 (subversion 0) or higher, and a C compiler.


Changes:
--------

Please refer to the file "CHANGES.txt" in this distribution for a version
history of changes and the list of incompatible changes with respect to
previous versions.

*BEWARE*
that version 5.0 is NOT fully backwards compatible due to its new features!


Installation:
-------------

Please see the file "INSTALL.txt" in this distribution for installation
instructions.


What does it do:
----------------

Data::Locations - magic insertion points in your data

Did you already encounter the problem that you had to produce some
data in a particular order, but that some piece of the data was still
unavailable at the point in the sequence where it belonged and where
it should have been produced?

Did you also have to resort to cumbersome and tedious measures such
as storing the first and the last part of your data separately, then
producing the missing middle part, and finally putting it all together?

In this simple case, involving only one deferred insertion, you might
still put up with this solution.

But if there is more than one deferred insertion, requiring the handling
of many fragments of data, you will probably get annoyed and frustrated.

You might even have to struggle with limitations of the file system of
your operating system, or handling so many files might considerably slow
down your application due to excessive file input/output.

And if you don't know exactly beforehand how many deferred insertions
there will be (if this depends dynamically on the data being processed),
and/or if the pieces of data you need to insert need additional (nested)
insertions themselves, things will get really tricky, messy and troublesome.

In such a case you might wonder if there wasn't an elegant solution to
this problem.

This is where the "Data::Locations" module comes in: It handles such
insertion points automatically for you, no matter how many and how deeply
nested, purely in memory, requiring no (inherently slower) file input/output
operations.

(The underlying operating system will automatically take care if the amount
of data becomes too large to be handled fully in memory, though, by swapping
out unneeded parts.)

Moreover, it also allows you to insert the same fragment of data into
SEVERAL different places.

This increases space efficiency because the same data is stored in
memory only once, but used multiple times.

Potential infinite recursion loops are detected automatically and
refused.

In order to better understand the underlying concept, think of
"Data::Locations" as virtual files with almost random access:
You can write data to them, you can say "reserve some space here
which I will fill in later", and continue writing data.

And you can of course also read from these virtual files, at any time,
in order to see the data that a given virtual file currently contains.

When you are finished filling in all the different parts of your virtual
file, you can write out its contents in flattened form to a physical, real
file this time, or process it otherwise (purely in memory, if you wish).

You can also think of "Data::Locations" as bubbles and bubbles inside
of other bubbles. You can inflate these bubbles in any arbitrary order
you like through a straw (i.e., the bubble's object reference).

Note that this module handles your data completely transparently, which
means that you can use it equally well for text AND binary data.

You might also be interested in knowing that this module and its concept
have already been heavily used in the automatic code generation of large
software projects.


Documentation:
--------------

The documentation of this package is included in POD format (= "Plain
Old Documentation") in the file "Locations.pm" in this distribution,
the human-readable markup-language standard for Perl documentation.

By building and installing this package, this documentation will
automatically be converted into a man page and installed in your Perl
tree for further reference, where it can be accessed via the command
"man Data::Locations" (UNIX) or "perldoc Data::Locations" (UNIX and Win32).


Credits:
--------

Please refer to the file "CREDITS.txt" in this distribution for a list
of contributors.


Legal issues:
-------------

This package with all its parts is

Copyright (c) 1997, 1998, 1999 by Steffen Beyer.
All rights reserved.

This package is free software; you can redistribute it and/or
modify it under the same terms as Perl itself, i.e., under the
terms of the "Artistic License" or the "GNU General Public License".

Please refer to the files "Artistic.txt" and "GNU_GPL.txt" in
this distribution for details!


Author's note:
--------------

I would be very pleased over *ANY* kind of feedback, questions,
suggestions, donations ;-) and so on, since unfortunately none of
you lazy bums ;-) (for exceptions to this see the "CREDITS.txt"
file in this distribution!) hardly ever writes me.

This feedback is essential for me in order to know wether this
module is useful, to estimate how many people use it and for
what (essential to assess the potential impact an incompatible
change may have, for instance), where its problems and weak-
nesses lie, what should be improved, what additional features
would be useful, etc.

Even e-mail with an empty body and just a subject line such as
"I'm using Data::Locations" would help!

Thank you very much in advance!

In any case, I hope you will find this module beneficial,
share and enjoy!

Yours sincerely,
--
    Steffen Beyer <sb@engelschall.com>
    http://www.engelschall.com/u/sb/whoami/
    http://www.engelschall.com/u/sb/download/
    http://www.perl.com/CPAN/authors/id/STBEY/
    http://www.oreilly.de/catalog/perlmodger/bnp/
