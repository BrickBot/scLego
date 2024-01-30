scLego : Esterel back-end for Lego C
====================================
Esterel is a programming language dedicated to control-dominated reactive systems, such as control circuits, embedded systems, human-machine interface, or communication protocols.

It belongs to the family of synchronous languages, which also includes Lustre, Signal, and SyncCharts. Esterel has been developed since 1983 at CMA (Applied Mathematics Center, Ecole des Mines de Paris), and INRIA in Sophia-Antipolis.	

The language is presented in the Esterel Primer (PDF).

## References
* Description from [About Esterel](https://web.archive.org/web/20071219203108/https://www-sop.inria.fr/esterel.org/Html/About/AboutEsterel.htm)
* [Original Website](https://web.imt-atlantique.fr/x-info/lego/) — Frame-based website: Select the "with Esterel" link from the sidebar on the left
  + [Usage Instructions](https://web.imt-atlantique.fr/x-info/lego/scLego.html)
* [Installation and Makefile information for Esterel and BrickOS](https://web.archive.org/web/20080609035841/http://www.informatik.uni-kiel.de/%7Eesterel/)
* Esterel Virtual Machine (EVM) project
  + [Project Plan](https://www1.cs.columbia.edu/~sedwards/classes/2002/w4995-02/vasee-lit.pdf)
  + [Final Report](https://www1.cs.columbia.edu/~sedwards/classes/2002/w4995-02/vasee-final.pdf)
* Potential alternate compiler – [CEC: The Columbia Esterel Compiler](https://www1.cs.columbia.edu/~sedwards/cec/) (open source)


## Prerequisites
* Esterel compiler:  As this provides an Esterel back-end for Lego C with BrickOS-Bibo, installation of a working Esterel compiler is necessary
  + Esterel compiler downloads are included with the archived scLego release posted in this repository as the initial release
    - See also [Esterel Tools, including Esterel v5.92 compiler, on the original project website](https://web.imt-atlantique.fr/x-info/lego/esterel-tools/)
  + [Esterel.org Downloads from old Esterel website](http://www-sop.inria.fr/esterel.org/filesv5_92/Html/Downloads/Soft/SoftwareDownloads.htm) (download links on new Esterel website are currently broken)
    - [Esterel v5.92 compiler distribution files for Windows NT, Red Hat Linux, and Sun Solaris](https://www-sop.inria.fr/esterel.org/filesv5_92/Html/Downloads/Soft/Ev592Downloads.htm)
  + [Purported Debian packages](https://www.df7cb.de/debian/esterel/)
    - Per Esterl.org, the note on this website that Esterel 5.2.1a is newer than 5_92 is _incorrect_ (c.f. [Release Notes for Esterel v5_92](http://www-sop.inria.fr/esterel.org/filesv5_92/Html/Downloads/Soft/ReleaseNotesV592.htm))
  

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
