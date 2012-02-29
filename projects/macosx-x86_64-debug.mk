#
#   build.mk -- Build It Makefile to build Embedthis Appweb for macosx on x86_64
#

CC        := /usr/bin/cc
CFLAGS    := -fPIC -Wall -g -Wshorten-64-to-32
DFLAGS    := -DPIC -DCPU=X86_64
IFLAGS    := -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc
LDFLAGS   := -Wl,-rpath,@executable_path/../lib -Wl,-rpath,@executable_path/ -Wl,-rpath,@loader_path/ -L/Users/mob/git/appweb/macosx-x86_64-debug/lib -g -ldl
LIBS      := -lpthread -lm

all: \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/bin/manager \
        macosx-x86_64-debug/bin/makerom \
        macosx-x86_64-debug/lib/libpcre.dylib \
        macosx-x86_64-debug/lib/libhttp.dylib \
        macosx-x86_64-debug/bin/http \
        macosx-x86_64-debug/lib/libsqlite3.dylib \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/lib/mod_esp.dylib \
        macosx-x86_64-debug/bin/esp \
        macosx-x86_64-debug/lib/esp.conf \
        macosx-x86_64-debug/lib/esp-www \
        macosx-x86_64-debug/lib/mod_cgi.dylib \
        macosx-x86_64-debug/lib/mod_php.dylib \
        macosx-x86_64-debug/bin/auth \
        macosx-x86_64-debug/bin/cgiProgram \
        macosx-x86_64-debug/bin/setConfig \
        macosx-x86_64-debug/bin/appweb \
        macosx-x86_64-debug/bin/testAppweb \
        src/test/cgi-bin/testScript \
        src/test/web/caching/cache.cgi \
        src/test/web/basic/basic.cgi \
        src/test/cgi-bin/cgiProgram

clean:
	rm -f macosx-x86_64-debug/lib/libmpr.dylib
	rm -f macosx-x86_64-debug/lib/libmprssl.dylib
	rm -f macosx-x86_64-debug/bin/manager
	rm -f macosx-x86_64-debug/bin/makerom
	rm -f macosx-x86_64-debug/lib/libpcre.dylib
	rm -f macosx-x86_64-debug/lib/libhttp.dylib
	rm -f macosx-x86_64-debug/bin/http
	rm -f macosx-x86_64-debug/lib/libsqlite3.dylib
	rm -f macosx-x86_64-debug/lib/libappweb.dylib
	rm -f macosx-x86_64-debug/lib/mod_esp.dylib
	rm -f macosx-x86_64-debug/bin/esp
	rm -f macosx-x86_64-debug/lib/esp.conf
	rm -f macosx-x86_64-debug/lib/esp-www
	rm -f macosx-x86_64-debug/lib/mod_cgi.dylib
	rm -f macosx-x86_64-debug/lib/mod_ejs.dylib
	rm -f macosx-x86_64-debug/lib/mod_php.dylib
	rm -f macosx-x86_64-debug/lib/mod_ssl.dylib
	rm -f macosx-x86_64-debug/bin/auth
	rm -f macosx-x86_64-debug/bin/cgiProgram
	rm -f macosx-x86_64-debug/bin/setConfig
	rm -f macosx-x86_64-debug/bin/appweb
	rm -f macosx-x86_64-debug/bin/testAppweb
	rm -f macosx-x86_64-debug/obj/mprLib.o
	rm -f macosx-x86_64-debug/obj/mprSsl.o
	rm -f macosx-x86_64-debug/obj/manager.o
	rm -f macosx-x86_64-debug/obj/makerom.o
	rm -f macosx-x86_64-debug/obj/pcre.o
	rm -f macosx-x86_64-debug/obj/httpLib.o
	rm -f macosx-x86_64-debug/obj/http.o
	rm -f macosx-x86_64-debug/obj/sqlite3.o
	rm -f macosx-x86_64-debug/obj/config.o
	rm -f macosx-x86_64-debug/obj/convenience.o
	rm -f macosx-x86_64-debug/obj/dirHandler.o
	rm -f macosx-x86_64-debug/obj/fileHandler.o
	rm -f macosx-x86_64-debug/obj/log.o
	rm -f macosx-x86_64-debug/obj/server.o
	rm -f macosx-x86_64-debug/obj/edi.o
	rm -f macosx-x86_64-debug/obj/espAbbrev.o
	rm -f macosx-x86_64-debug/obj/espFramework.o
	rm -f macosx-x86_64-debug/obj/espHandler.o
	rm -f macosx-x86_64-debug/obj/espHtml.o
	rm -f macosx-x86_64-debug/obj/espSession.o
	rm -f macosx-x86_64-debug/obj/espTemplate.o
	rm -f macosx-x86_64-debug/obj/mdb.o
	rm -f macosx-x86_64-debug/obj/sdb.o
	rm -f macosx-x86_64-debug/obj/esp.o
	rm -f macosx-x86_64-debug/obj/cgiHandler.o
	rm -f macosx-x86_64-debug/obj/ejsHandler.o
	rm -f macosx-x86_64-debug/obj/phpHandler.o
	rm -f macosx-x86_64-debug/obj/sslModule.o
	rm -f macosx-x86_64-debug/obj/auth.o
	rm -f macosx-x86_64-debug/obj/cgiProgram.o
	rm -f macosx-x86_64-debug/obj/setConfig.o
	rm -f macosx-x86_64-debug/obj/appweb.o
	rm -f macosx-x86_64-debug/obj/testAppweb.o
	rm -f macosx-x86_64-debug/obj/testHttp.o

macosx-x86_64-debug/obj/mprLib.o: \
        src/deps/mpr/mprLib.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/mpr/mpr.h
	$(CC) -c -o macosx-x86_64-debug/obj/mprLib.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/mpr/mprLib.c

macosx-x86_64-debug/lib/libmpr.dylib:  \
        macosx-x86_64-debug/obj/mprLib.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/libmpr.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/libmpr.dylib macosx-x86_64-debug/obj/mprLib.o $(LIBS)

macosx-x86_64-debug/obj/manager.o: \
        src/deps/mpr/manager.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/mpr/mpr.h
	$(CC) -c -o macosx-x86_64-debug/obj/manager.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/mpr/manager.c

macosx-x86_64-debug/bin/manager:  \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/obj/manager.o
	$(CC) -o macosx-x86_64-debug/bin/manager -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/manager.o $(LIBS) -lmpr

macosx-x86_64-debug/obj/makerom.o: \
        src/deps/mpr/makerom.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/mpr/mpr.h
	$(CC) -c -o macosx-x86_64-debug/obj/makerom.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/mpr/makerom.c

macosx-x86_64-debug/bin/makerom:  \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/obj/makerom.o
	$(CC) -o macosx-x86_64-debug/bin/makerom -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/makerom.o $(LIBS) -lmpr

macosx-x86_64-debug/obj/pcre.o: \
        src/deps/pcre/pcre.c \
        macosx-x86_64-debug/inc/bit.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        src/deps/pcre/pcre.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        macosx-x86_64-debug/inc/buildConfig.h
	$(CC) -c -o macosx-x86_64-debug/obj/pcre.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/pcre/pcre.c

macosx-x86_64-debug/lib/libpcre.dylib:  \
        macosx-x86_64-debug/obj/pcre.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/libpcre.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/libpcre.dylib macosx-x86_64-debug/obj/pcre.o $(LIBS)

macosx-x86_64-debug/obj/httpLib.o: \
        src/deps/http/httpLib.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/http/http.h \
        src/deps/pcre/pcre.h
	$(CC) -c -o macosx-x86_64-debug/obj/httpLib.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/http/httpLib.c

macosx-x86_64-debug/lib/libhttp.dylib:  \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/lib/libpcre.dylib \
        macosx-x86_64-debug/obj/httpLib.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/libhttp.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/libhttp.dylib macosx-x86_64-debug/obj/httpLib.o $(LIBS) -lmpr -lpcre

macosx-x86_64-debug/obj/http.o: \
        src/deps/http/http.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/http/http.h
	$(CC) -c -o macosx-x86_64-debug/obj/http.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/http/http.c

macosx-x86_64-debug/bin/http:  \
        macosx-x86_64-debug/lib/libhttp.dylib \
        macosx-x86_64-debug/obj/http.o
	$(CC) -o macosx-x86_64-debug/bin/http -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/http.o $(LIBS) -lhttp -lmpr -lpcre

macosx-x86_64-debug/obj/sqlite3.o: \
        src/deps/sqlite/sqlite3.c \
        macosx-x86_64-debug/inc/bit.h \
        macosx-x86_64-debug/inc/buildConfig.h \
        src/deps/sqlite/sqlite3.h
	$(CC) -c -o macosx-x86_64-debug/obj/sqlite3.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/deps/sqlite/sqlite3.c

macosx-x86_64-debug/lib/libsqlite3.dylib:  \
        macosx-x86_64-debug/obj/sqlite3.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/libsqlite3.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/libsqlite3.dylib macosx-x86_64-debug/obj/sqlite3.o $(LIBS)

macosx-x86_64-debug/obj/config.o: \
        src/config.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h \
        src/deps/pcre/pcre.h
	$(CC) -c -o macosx-x86_64-debug/obj/config.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/config.c

macosx-x86_64-debug/obj/convenience.o: \
        src/convenience.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/convenience.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/convenience.c

macosx-x86_64-debug/obj/dirHandler.o: \
        src/dirHandler.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/dirHandler.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/dirHandler.c

macosx-x86_64-debug/obj/fileHandler.o: \
        src/fileHandler.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/fileHandler.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/fileHandler.c

macosx-x86_64-debug/obj/log.o: \
        src/log.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/log.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/log.c

macosx-x86_64-debug/obj/server.o: \
        src/server.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/server.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/server.c

macosx-x86_64-debug/lib/libappweb.dylib:  \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/lib/libhttp.dylib \
        macosx-x86_64-debug/lib/libpcre.dylib \
        macosx-x86_64-debug/obj/config.o \
        macosx-x86_64-debug/obj/convenience.o \
        macosx-x86_64-debug/obj/dirHandler.o \
        macosx-x86_64-debug/obj/fileHandler.o \
        macosx-x86_64-debug/obj/log.o \
        macosx-x86_64-debug/obj/server.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/libappweb.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/libappweb.dylib macosx-x86_64-debug/obj/config.o macosx-x86_64-debug/obj/convenience.o macosx-x86_64-debug/obj/dirHandler.o macosx-x86_64-debug/obj/fileHandler.o macosx-x86_64-debug/obj/log.o macosx-x86_64-debug/obj/server.o $(LIBS) -lmpr -lhttp -lpcre -lpcre

macosx-x86_64-debug/obj/edi.o: \
        src/esp/edi.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/edi.h \
        src/deps/pcre/pcre.h
	$(CC) -c -o macosx-x86_64-debug/obj/edi.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/edi.c

macosx-x86_64-debug/obj/espAbbrev.o: \
        src/esp/espAbbrev.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/esp.h
	$(CC) -c -o macosx-x86_64-debug/obj/espAbbrev.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/espAbbrev.c

macosx-x86_64-debug/obj/espFramework.o: \
        src/esp/espFramework.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/esp.h
	$(CC) -c -o macosx-x86_64-debug/obj/espFramework.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/espFramework.c

macosx-x86_64-debug/obj/espHandler.o: \
        src/esp/espHandler.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h \
        src/esp/esp.h \
        src/esp/edi.h
	$(CC) -c -o macosx-x86_64-debug/obj/espHandler.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/espHandler.c

macosx-x86_64-debug/obj/espHtml.o: \
        src/esp/espHtml.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/esp.h \
        src/esp/edi.h
	$(CC) -c -o macosx-x86_64-debug/obj/espHtml.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/espHtml.c

macosx-x86_64-debug/obj/espSession.o: \
        src/esp/espSession.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/esp.h
	$(CC) -c -o macosx-x86_64-debug/obj/espSession.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/espSession.c

macosx-x86_64-debug/obj/espTemplate.o: \
        src/esp/espTemplate.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/esp.h
	$(CC) -c -o macosx-x86_64-debug/obj/espTemplate.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/espTemplate.c

macosx-x86_64-debug/obj/mdb.o: \
        src/esp/mdb.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h \
        src/esp/edi.h \
        src/esp/mdb.h \
        src/deps/pcre/pcre.h
	$(CC) -c -o macosx-x86_64-debug/obj/mdb.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/mdb.c

macosx-x86_64-debug/obj/sdb.o: \
        src/esp/sdb.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h \
        src/esp/edi.h
	$(CC) -c -o macosx-x86_64-debug/obj/sdb.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/sdb.c

macosx-x86_64-debug/lib/mod_esp.dylib:  \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/obj/edi.o \
        macosx-x86_64-debug/obj/espAbbrev.o \
        macosx-x86_64-debug/obj/espFramework.o \
        macosx-x86_64-debug/obj/espHandler.o \
        macosx-x86_64-debug/obj/espHtml.o \
        macosx-x86_64-debug/obj/espSession.o \
        macosx-x86_64-debug/obj/espTemplate.o \
        macosx-x86_64-debug/obj/mdb.o \
        macosx-x86_64-debug/obj/sdb.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/mod_esp.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/mod_esp.dylib macosx-x86_64-debug/obj/edi.o macosx-x86_64-debug/obj/espAbbrev.o macosx-x86_64-debug/obj/espFramework.o macosx-x86_64-debug/obj/espHandler.o macosx-x86_64-debug/obj/espHtml.o macosx-x86_64-debug/obj/espSession.o macosx-x86_64-debug/obj/espTemplate.o macosx-x86_64-debug/obj/mdb.o macosx-x86_64-debug/obj/sdb.o $(LIBS) -lappweb -lmpr -lhttp -lpcre

macosx-x86_64-debug/obj/esp.o: \
        src/esp/esp.c \
        macosx-x86_64-debug/inc/bit.h \
        src/esp/esp.h
	$(CC) -c -o macosx-x86_64-debug/obj/esp.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/esp/esp.c

macosx-x86_64-debug/bin/esp:  \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/obj/edi.o \
        macosx-x86_64-debug/obj/esp.o \
        macosx-x86_64-debug/obj/espAbbrev.o \
        macosx-x86_64-debug/obj/espFramework.o \
        macosx-x86_64-debug/obj/espHandler.o \
        macosx-x86_64-debug/obj/espHtml.o \
        macosx-x86_64-debug/obj/espSession.o \
        macosx-x86_64-debug/obj/espTemplate.o \
        macosx-x86_64-debug/obj/mdb.o \
        macosx-x86_64-debug/obj/sdb.o
	$(CC) -o macosx-x86_64-debug/bin/esp -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/edi.o macosx-x86_64-debug/obj/esp.o macosx-x86_64-debug/obj/espAbbrev.o macosx-x86_64-debug/obj/espFramework.o macosx-x86_64-debug/obj/espHandler.o macosx-x86_64-debug/obj/espHtml.o macosx-x86_64-debug/obj/espSession.o macosx-x86_64-debug/obj/espTemplate.o macosx-x86_64-debug/obj/mdb.o macosx-x86_64-debug/obj/sdb.o $(LIBS) -lappweb -lmpr -lhttp -lpcre

/Users/mob/git/appweb/macosx-x86_64-debug/lib/esp.conf:  \
        

	rm -f /Users/mob/git/appweb/macosx-x86_64-debug/lib/esp.conf

	cp /Users/mob/git/appweb/src/esp/esp.conf /Users/mob/git/appweb/macosx-x86_64-debug/lib/esp.conf

/Users/mob/git/appweb/macosx-x86_64-debug/lib/esp-www:  \
        

	rm -f /Users/mob/git/appweb/macosx-x86_64-debug/lib/esp-www

	cp /Users/mob/git/appweb/src/esp/www /Users/mob/git/appweb/macosx-x86_64-debug/lib/esp-www

macosx-x86_64-debug/obj/cgiHandler.o: \
        src/modules/cgiHandler.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/cgiHandler.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/modules/cgiHandler.c

macosx-x86_64-debug/lib/mod_cgi.dylib:  \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/obj/cgiHandler.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/mod_cgi.dylib -arch x86_64 $(LDFLAGS) -install_name @rpath/mod_cgi.dylib macosx-x86_64-debug/obj/cgiHandler.o $(LIBS) -lappweb -lmpr -lhttp -lpcre

macosx-x86_64-debug/obj/phpHandler.o: \
        src/modules/phpHandler.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/phpHandler.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc -I../packages-macosx-x86_64/php/php-5.3.8 -I../packages-macosx-x86_64/php/php-5.3.8/main -I../packages-macosx-x86_64/php/php-5.3.8/Zend -I../packages-macosx-x86_64/php/php-5.3.8/TSRM src/modules/phpHandler.c

macosx-x86_64-debug/lib/mod_php.dylib:  \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/obj/phpHandler.o
	$(CC) -dynamiclib -o macosx-x86_64-debug/lib/mod_php.dylib -arch x86_64 $(LDFLAGS) -L/Users/mob/git/packages-macosx-x86_64/php/php-5.3.8/.libs -install_name @rpath/mod_php.dylib macosx-x86_64-debug/obj/phpHandler.o $(LIBS) -lphp5 -lappweb -lmpr -lhttp -lpcre

macosx-x86_64-debug/obj/auth.o: \
        src/utils/auth.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/http/http.h
	$(CC) -c -o macosx-x86_64-debug/obj/auth.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/utils/auth.c

macosx-x86_64-debug/bin/auth:  \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/obj/auth.o
	$(CC) -o macosx-x86_64-debug/bin/auth -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/auth.o $(LIBS) -lmpr

macosx-x86_64-debug/obj/cgiProgram.o: \
        src/utils/cgiProgram.c \
        macosx-x86_64-debug/inc/bit.h
	$(CC) -c -o macosx-x86_64-debug/obj/cgiProgram.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/utils/cgiProgram.c

macosx-x86_64-debug/bin/cgiProgram:  \
        macosx-x86_64-debug/obj/cgiProgram.o
	$(CC) -o macosx-x86_64-debug/bin/cgiProgram -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/cgiProgram.o $(LIBS)

macosx-x86_64-debug/obj/setConfig.o: \
        src/utils/setConfig.c \
        macosx-x86_64-debug/inc/bit.h \
        src/deps/mpr/mpr.h
	$(CC) -c -o macosx-x86_64-debug/obj/setConfig.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/utils/setConfig.c

macosx-x86_64-debug/bin/setConfig:  \
        macosx-x86_64-debug/lib/libmpr.dylib \
        macosx-x86_64-debug/obj/setConfig.o
	$(CC) -o macosx-x86_64-debug/bin/setConfig -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/setConfig.o $(LIBS) -lmpr

macosx-x86_64-debug/obj/appweb.o: \
        src/server/appweb.c \
        macosx-x86_64-debug/inc/bit.h \
        src/appweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/appweb.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/server/appweb.c

macosx-x86_64-debug/bin/appweb:  \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/obj/appweb.o
	$(CC) -o macosx-x86_64-debug/bin/appweb -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/appweb.o $(LIBS) -lappweb -lmpr -lhttp -lpcre

macosx-x86_64-debug/obj/testAppweb.o: \
        src/test/testAppweb.c \
        macosx-x86_64-debug/inc/bit.h \
        src/test/testAppweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/testAppweb.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/test -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/test/testAppweb.c

macosx-x86_64-debug/obj/testHttp.o: \
        src/test/testHttp.c \
        macosx-x86_64-debug/inc/bit.h \
        src/test/testAppweb.h
	$(CC) -c -o macosx-x86_64-debug/obj/testHttp.o -arch x86_64 $(CFLAGS) $(DFLAGS) -Isrc/test -Isrc/deps/mpr -Isrc/deps/pcre -Isrc/deps/http -Isrc/deps/sqlite -Isrc -Isrc/esp -Isrc -Imacosx-x86_64-debug/inc src/test/testHttp.c

macosx-x86_64-debug/bin/testAppweb:  \
        macosx-x86_64-debug/lib/libappweb.dylib \
        macosx-x86_64-debug/obj/testAppweb.o \
        macosx-x86_64-debug/obj/testHttp.o
	$(CC) -o macosx-x86_64-debug/bin/testAppweb -arch x86_64 $(LDFLAGS) -Lmacosx-x86_64-debug/lib macosx-x86_64-debug/obj/testAppweb.o macosx-x86_64-debug/obj/testHttp.o $(LIBS) -lappweb -lmpr -lhttp -lpcre

