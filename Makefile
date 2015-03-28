# Copyright (c) 2002-2015, Ross Smith II. MIT licensed.

VER?=$(strip $(shell sed -rne 's/^\s*\#define\s+PACKAGE_VERSION\s+"([^"]*)".*/\1/p' ver_defaults.h))
APP?=$(strip $(shell sed -rne 's/^\s*\#define\s+PACKAGE\s+"([^"]*)".*/\1/p' ver_defaults.h))

#######################################################################

REPO?=$(notdir $(PWD))

CURL?=curl
CURL_OPTS?=--netrc --insecure --silent --show-error 
RELEASE_URL?=https://api.github.com/repos/rasa/$(REPO)/releases
TAG?=v$(VER)

RELEASED:=.$(TAG).released

#######################################################################

ifneq ("$(wildcard msbuild.mk)", "")
ifneq ("$(shell which MSBuild.exe 2>/dev/null)", "")
CMAKER?=msbuild.mk
endif
endif

ifneq ("$(wildcard vcbuild.mk)", "")
ifneq ("$(shell which VCBuild.exe 2>/dev/null)", "")
CMAKER?=vcbuild.mk
endif
endif

CMAKER?=nmake.mk

#######################################################################

ifneq ("$(wildcard local.mk)", "")
include local.mk
endif

#######################################################################

.PHONY:	help
help:
	@echo "make all       # build shared*.lib"
	@echo "make tag       # create tag $(TAG) on Github (implies zip)"
	@echo "make release   # create release $(TAG) on Github (implies tag)"
	@echo
	@echo "make clean     # remove Release/shared*.lib and related build files"
	@echo "make distclean # same as 'make clean'"
	@echo "make tidy      # same as 'make clean'"
	@echo "make help      # display this help text"

#######################################################################

include $(CMAKER)

#######################################################################

.PHONY:	upx
upx:	all

#######################################################################

.PHONY:	sign
sign:	all

#######################################################################

.PHONY:	hashes
hashes:	all

#######################################################################

.PHONY:	zip
zip:	all

.PHONY:	dist
dist:	zip

#######################################################################

TAGGED:=.$(TAG).tagged

$(TAGGED):	all
	if ! git tag | grep -q -P "\b$(TAG)\b"; then
		git tag -a $(TAG) -m "Version $(VER)" ;\
	fi
	git push origin --tags
	touch $@
	@-echo Tag $(TAG) created on Github

.PHONY:	tag
tag:	$(TAGGED)

#######################################################################

$(RELEASED):	$(TAGGED)
	$(CURL) $(CURL_OPTS) \
		--request POST \
		--data "{\"tag_name\": \"$(TAG)\",\"name\": \"$(TAG)\", \"body\": \"Release $(TAG)\"}" \
		--write-out "%{http_code}" \
		--output /tmp/$(RELEASED).tmp \
		--include \
		"$(RELEASE_URL)" | grep ^2 || (cat /tmp/$(RELEASED).tmp ; echo ; exit 1)
	touch $@
	@-echo Release $(TAG) created on Github

.PHONY:	release
release: $(RELEASED)

#######################################################################

.PHONY:	sig
sig:	all

#######################################################################

.PHONY:	sum
sum:	all

#######################################################################

.PHONY:	upload
upload:	all

#######################################################################

.PHONY:	scan
scan:	all

#######################################################################

.PHONY:	publish
publish:	all

#######################################################################

.PHONY:	tidy
tidy:	clean

#######################################################################

.PHONY:	distclean
distclean:	tidy

#######################################################################

.PHONY: debug
debug:
	@echo CMAKER=$(CMAKER)
	@echo CURL=$(CURL)
	@echo CURL_OPTS=$(CURL_OPTS)
	@echo RELEASED=$(RELEASED)
	@echo RELEASE_URL=$(RELEASE_URL)
	@echo REPO=$(REPO)
	@echo TAG=$(TAG)
	@echo TAGGED=$(TAGGED)
	@echo VER=$(VER)
