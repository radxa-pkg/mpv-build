PROJECT ?= mpv
PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
LIBDIR ?= $(PREFIX)/lib
MANDIR ?= $(PREFIX)/share/man

#
# Test
#
.PHONY: test
test:

#
# Clean
#
.PHONY: distclean
distclean: clean

.PHONY: clean
clean: clean-doc clean-deb
	./clean

.PHONY: clean-doc
clean-doc:
	rm -rf $(DOCS)

.PHONY: clean-deb
clean-deb:
	rm -rf debian/.debhelper debian/mpv debian/aicrf-test debian/debhelper-build-stamp debian/files debian/*.debhelper.log debian/*.*.debhelper debian/*.substvars mpv*-build-deps*

#
# Release
#
.PHONY: dch
dch: debian/changelog
	EDITOR=true gbp dch --debian-branch=main --multimaint-merge --commit --release --dch-opt=--upstream

.PHONY: download
download:
	./update

.PHONY: deb
deb: debian download
	debuild --no-lintian --no-sign -b -aarm64 -Pcross

.PHONY: release
release:
	gh workflow run .github/workflows/new_version.yml
