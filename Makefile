# Makefile to build shared library
# Copyright (c) 2004-2006 Ross Smith II (http://smithii.com). All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify it
# under the terms of version 2 of the GNU General Public License 
# as published by the Free Software Foundation.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# $Id$

VER?=1.1
APP=shared
APP_FILES=shared.lib sharedd.lib sharedu.lib shareddu.lib changelog.txt COPYING readme.txt
SRC_FILES=$(APP_FILES) $(wildcard Makefile *.c *.cpp *.h *.hpp *.dsp *.dep *.dsw *.mak)

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

.PHONY:	all clean realclean

include nmake.mak