scLego : Esterel back-end for Lego C
====================================

Original Website – https://web.imt-atlantique.fr/x-info/lego/

Usage Instructions - https://web.imt-atlantique.fr/x-info/lego/scLego.html

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
