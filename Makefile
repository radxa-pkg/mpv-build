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
	rm -rf ffmpeg libass libplacebo mpv

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
dch: debian/changelog lib
	# EDITOR=true gbp dch --debian-branch=master --multimaint-merge --commit --release --dch-opt=--upstream

.PHONY: lib
lib: ffmpeg libass libplacebo mpv

ffmpeg:
	$(MAKE) download
libass:
	$(MAKE) download
libplacebo:
	$(MAKE) download
mpv:
	$(MAKE) download

.PHONY: download
download:
	./update

.PHONY: deb
deb: debian lib
	debuild --no-lintian --lintian-hook "lintian --fail-on error,warning --suppress-tags bad-distribution-in-changes-file -- %p_%s_*.changes" --no-sign -b

.PHONY: release
release:
	gh workflow run .github/workflows/new_version.yml
