scLego : Esterel back-end for Lego C
====================================

Original Website – https://web.imt-atlantique.fr/x-info/lego/

Usage Instructions - https://web.imt-atlantique.fr/x-info/lego/scLego.html


## Prerequisites
* Esterel compiler:  As this provides an Esterel back-end for Lego C with BrickOS-Bibo, installation of a working Esterel compiler is necessary
  - Esterel compiler downloads are included with the archived scLego release posted in this repository as the initial release
  - [Esterel.org Downloads from old Esterel website](http://www-sop.inria.fr/esterel.org/filesv5_92/Html/Downloads/Soft/SoftwareDownloads.htm) (download links on new Esterel website are currently broken)
  - [Purported Debian packages](https://www.df7cb.de/debian/esterel/)  (however, based on Esterl.org, the information on this website that Esterel 5.2.1a is newer than 5_92 is _incorrect_)
  

## Integration with BrickOS-Bibo
Esterel examples are already bundled with BrickOS-Bibo, so by installing
the Esterel compiler and this add-on for the Esterel compiler, you will
be ready to create Esterel programs for BrickOS-Bibo.


## Installation
To install scLego, type:

   `make ESTEREL_DISTRIB=<esterel repository>`

You may also set the PERL macro to the name of the Perl command on
your system if it is different from the default "perl".

Installation will copy Lego subdirectory into Esterel lib directory,
and it will creates scLego, ocLego, and sscLego scripts into the Esterel
bin directory.


## Usage
A man page, scLego.1 is also avalaible in Esterel man/man1 dir. Please
have a look at it, since it describes the recognized API from Esterel
to Lego.

Then, you can call :

   `esterel  -LLego controller.strl`

or

   `esterel  -ILego controller.strl`

or

   `esterel  -ALego controller.strl`

Option -simul is also supported if you want to simulate the controller 
using xes or csimul.  You do not have to insert code for predefined
objects such as constants, or functions that belong to Esterel/Lego
API; they will be automatically defined in the resulting .c.
