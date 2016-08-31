BINDIR=/usr/local/bin
UNAME_S:=$(shell uname -s)

.PHONY: install uninstall update

install:
	install -m775 -d $(BINDIR)
	@if [ "$(UNAME_S)" = "Linux" ]; then\
		install -m775 -t $(BINDIR) transfer-x; \
	fi
	@if [ "$(UNAME_S)" = "Darwin" ]; then\
		install -m775 transfer-x $(BINDIR); \
	fi

uninstall:
	rm -f $(BINDIR)/transfer-x

update:
	rm -f $(BINDIR)/transfer-x
	git pull origin master	
	install -m775 -d $(BINDIR)
	@if [ "$(UNAME_S)" = "Linux" ]; then\
                install -m775 -t $(BINDIR) transfer-x; \
        fi
	@if [ "$(UNAME_S)" = "Darwin" ]; then\
                install -m775 transfer-x $(BINDIR); \
        fi
