prefix := /usr
localstatedir := /var
sysconfdir := /etc
bindir := $(prefix)/bin
datadir := $(prefix)/share
initrddir := $(sysconfdir)/rc.d/init.d
libexecdir := $(prefix)/libexec
mandir := $(prefix)/share/man



_default:
	@echo "No default. Try 'make install'"

install:
	# Install executables
	install -d $(DESTDIR)/$(libexecdir)/rsv
	cp -r libexec/probes $(DESTDIR)/$(libexecdir)/rsv/
	cp -r libexec/metrics $(DESTDIR)/$(libexecdir)/rsv/
	# Install configuration
	install -d $(DESTDIR)/$(sysconfdir)/rsv/meta
	cp -r etc/meta/metrics $(DESTDIR)/$(sysconfdir)/rsv/meta/
	cp -r etc/metrics $(DESTDIR)/$(sysconfdir)/rsv/
	# Create the log dirs
	install -d $(DESTDIR)/$(localstatedir)/log/rsv/metrics
	install -d $(DESTDIR)/$(localstatedir)/log/rsv/probes


.PHONY: _default install

