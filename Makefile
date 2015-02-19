# shared

VER?=1.3
APP=shared
APP_FILES=CHANGELOG.md LICENSE README.md $(wildcard *.lib)
SRC_FILES=$(APP_FILES) $(wildcard Makefile *.cpp *.dep *.dsp *.dsw *.h *.ico *.mak *.rc *.sln *.vcproj *.vcxproj *.vcxproj.filters)
SRC_FILES+=$(wildcard *.hpp)

APP_ZIP?=$(APP)-$(VER)-win32.zip
SRC_ZIP?=$(APP)-$(VER)-win32-src.zip
ZIP?=zip
ZIP_OPTS?=-9jquX

.PHONY:	dist
dist:	all $(APP_ZIP) $(SRC_ZIP)

$(APP_ZIP):	$(APP_FILES)
	-rm -f $(APP_ZIP)
	chmod +x $^
	${ZIP} ${ZIP_OPTS} $@ $^

$(SRC_ZIP):	$(SRC_FILES)
	-rm -f $(SRC_ZIP)
	chmod +x $^
	${ZIP} ${ZIP_OPTS} $@ $^

.PHONY:	distclean
distclean:	clean
	rm -f $(APP_ZIP) $(SRC_ZIP)

ifneq (,$(shell which MSBuild.exe 2>/dev/null))
include msbuild.mak
else
include nmake.mak
endif