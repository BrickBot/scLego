ESTEREL_DISTRIB =# Esterel installation directory

PERL            = perl

SHELL=/bin/sh

install:
	@if [ -z "$(ESTEREL_DISTRIB)" ] ;	\
	then					\
	    echo "*** Macro ESTEREL_DISTRIB unset"; \
	    exit 1;				\
	fi;					\
	if [ -z "$(PERL)" ] ;			\
	then					\
	    echo "*** Macro PERL unset";		\
	    exit 1;				\
	fi;					\
	for script in scLego ocLego sscLego ;	\
	do					\
	   /bin/rm -f $(ESTEREL_DISTRIB)/bin/$$script; \
	   sed -e 's|ESTEREL=.*|ESTEREL=$(ESTEREL_DISTRIB)|' \
	       -e 's|PERL=.*|PERL=$(PERL)|' \
	       scLego > $(ESTEREL_DISTRIB)/bin/$$script; \
	   chmod a+x $(ESTEREL_DISTRIB)/bin/$$script; \
        done;					\
	cp -f scLego.1 $(ESTEREL_DISTRIB)/man/man1/scLego.1; \
	/bin/rm -rf $(ESTEREL_DISTRIB)/lib/Lego; \
	cp -r Lego $(ESTEREL_DISTRIB)/lib
