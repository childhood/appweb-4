#
# 	Makefile for the Appweb server 
#
# 	Copyright (c) Embedthis Software LLC, 2003-2012. All Rights Reserved.
#

COMPILE				= 

include 			.makedep 

PRE_DIRS			+= $(BLD_OS)

#
#	Extra libraries
#
ifeq	($(BLD_OS),WIN)
	SYSLIBS			+= shell32.lib
	RES				= --resources appweb.rc
endif
ifeq	($(BLD_OS),VXWORKS)
ifeq 	($(BLD_BUILD_OS),WIN)
	MAKE_DFLAGS		+= '-DBLD_APPWEB_PATH=\"$(BLD_ABS_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE)\"'
else
	MAKE_DFLAGS		+= -DBLD_APPWEB_PATH=\"$(BLD_ABS_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE)\"
endif
endif
ifeq	($(BLD_FEATURE_AUTH_PAM),1)
	LIBS			+= pam
endif

LIBDEP				+= appweb
LIBDEP				+= mpr http
ifeq	($(BLD_FEATURE_SSL),1)
	LIBDEP			+= mprssl
endif

ifeq ($(BUILDING_TARGET),1)
	TARGETS			+= $(BLD_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE)
	ROM_FILES		+= romFiles.c
endif

#
#	Add modules that you wish to link with appweb
#
#	MODULES				+= mod_esp

compileExtra: $(TARGETS)

compileFirst: $(ROM_FILES)

ifeq ($(BLD_FEATURE_ROMFS),1)
$(ROM_FILES): *.db mime.types appweb.conf web/*.html $(BLD_OBJ_DIR)/appweb$(BLD_OBJ)
	$(call log) "[Generate]" "romFiles.c"
	echo -e ".\nappweb.conf\nmime.types\nusers.db\ngroups.db" >rom.files
	find conf -print | egrep -v 'ejs.conf|php.conf|fcgi.conf|ssl|dummy' >>rom.files
	find web -print | egrep -v 'CVS|\.svn|\.cvsignore|\.ignore|\.tmp|\.sav|\.php|\.ejs|php' >>rom.files
	$(call setlibpath) ; sort rom.files | uniq | xargs makerom --name romFiles >romFiles.c
else
romFiles.c: 
	echo . >rom.files
	$(call setlibpath) ; makerom --name romFiles . >romFiles.c
endif

#
#	Build the appweb program
#
$(BLD_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE): $(BLD_OBJ_DIR)/appweb$(BLD_OBJ) $(call lib, $(LIBDEP)) $(call vlib $(LIBDEP))
	bld --exe $(BLD_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE) --search "$(BLD_APPWEB_LIBPATHS)" \
		--libs "$(BLD_APPWEB_LIBS) $(LIBS) $(MODULES)" --syslibs "$(SYSLIBS)" $(RES) $(BLD_OBJ_DIR)/appweb$(BLD_OBJ)

run:
	$(call setlibpath) ; sudo $(BLD_BIN_DIR)/$(BLD_PRODUCT) -v

cleanExtra:
	rm -f $(TARGETS) $(BLD_OBJ_DIR)/appweb$(BLD_OBJ)
	rm -f trace.txt access.log error.log leak.log
	rm -f *.obj *.pdb
	rm -f error.log* access.log*
	rm -f web/*.mod web/*.es
	find web -name .DS_Store | xargs rm -f

size:
	@echo -e "    #\n    #	Size of $(BLD_PRODUCT)\n    #"
	size $(BLD_PRODUCT) | sed -e 's/^/    # /'

curl:
	curl --trace trace.tmp --dump-header header.tmp https://127.0.0.1:4443/index.html

val:
	(valgrind -v --tool=memcheck --suppressions=d.supp --leak-check=yes --num-callers=12 --leak-resolution=high \
		--show-reachable=yes --track-fds=yes ../out/bin/appweb -v 2>&1) | tee val.out

mem:
	echo -e "\nImage and code sizes:"
	ls -hs  $(BLD_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE)
	size $(BLD_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE)
	pid=`ps -ef | grep 'appweb.*conf' | grep -v grep | awk '{ print \$$2 }'` ; \
	echo -e "\nMemory usage for $(BLD_BIN_DIR)/$(BLD_PRODUCT)$(BLD_EXE), pid $$pid:" ; \
	cat /proc/$$pid/status | egrep 'VmSize|VmPeak|VmRSS|VmData|VmStk|VmExe'

dependExtra:
	mkdir -p logs
	find web -name .DS_Store | xargs rm -f

#
#   Local variables:
#   tab-width: 4
#   c-basic-offset: 4
#   End:
#   vim: sw=4 ts=4 noexpandtab
#
