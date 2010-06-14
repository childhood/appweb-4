#!/bin/bash
#
#   import.sh -- Import an all-in-one archive 
#
#   Usage:
#       import.sh [--diff|sync|import] [--dir dir] [--ignore xx] [--patch preserveFeature] dir
#
#   Copyright (c) Embedthis Software Inc, 2003-2010. All Rights Reserved.
#   This file is for internal use only when importing all-in-one archives.
#

IDIR=.import
PP_ARGS=
PROGRAM=${0}

log() {
    tag=$1
    shift
    [ "${TRACE}" = "1" ] && printf "%12s %s\n" "[$tag]" "$*"
}

warn() {
    tag=$1
    shift
    printf "%12s %s\n" "[$tag]" "$*"
}

usage() {
    echo "usage: ${PROGRAM} [--diff|sync|import] [--dir dir] [--ignore xx] [--patch preserveFeature] image"
    exit 2
}

#
#   Get product settings into the local environment
#
getBuildConfig() {
    if [ -f ./buildConfig.h ]
    then
        cat ./buildConfig.h | grep '#define' | sed 's/ *#define. *//' | 
            sed 's/ /=/' | sed 's/"/'\''/g' >/tmp/importConfig$$.sh ; \
        . /tmp/importConfig$$.sh ; rm -f /tmp/importConfig$$.sh
    fi
}


#
#   Build the pp command string
#
buildPatch() {
    echo -e "# Stripping features according to: \n  # " >/dev/tty

    set | grep BLD_FEATURE | egrep -v "$preserve" | while read e
    do
        echo -e '#  ' $e >/dev/tty
        feature=${e%%=*}
        value=${e##*=}
        if [ "$value" = "1" ]
        then
            echo -ne " -iD${feature}"
        else
            echo -ne " -U${feature}"
        fi
    done
    echo -ne " -UUNUSED -iDBLD_DEBUG"
    echo "" >/dev/tty
}


syncFiles() {
    local status

    log "Sync" ${ARCHIVE}

    tar tfz $ARCHIVE | while read file ; do
        target=${file##$STRIP}
        if [ "$ignore" != "" -a "${file/$ignore/}" != "${file}" ] ; then
            echo "#    ignore $file"
            continue
        fi
        if [ -d ${SRC}/${target} ] ; then
            continue
        fi
        if [ ! -f ${DIR}/${target} ] ; then
            status=1
        else
            if [ $import = 0 ] ; then 
                [ "${TRACE}" = 1 ] && echo diff ${SRC}/$file ${DIR}/${target}
                if [ $diff = 1 ] ; then
                    diff ${SRC}/$file ${DIR}/${target} 2>&1 >/dev/null
                    if [ $? != 0 ] ; then
                        echo ${DIR}/$target is MODIFIED >&2
                        diff ${SRC}/$file ${DIR}/${target} | more
                    fi
                else
                    diff ${SRC}/$file ${DIR}/${target} 2>&1 >/dev/null
                fi
            else
                false
            fi
            status=$?
        fi
        if [ $status != 0 ] ; then
            if [ $import = 0 -a ${DIR}/${target} -nt $SRC/$file ] ; then
                warn "WARNING" "${target} has been modified. Skipping"
                continue
            fi
            mkdir -p `dirname ${DIR}/${target}`
            [ -f ${DIR}/${target} ] && chmod +w "${DIR}/${target}"
            if [ "$patch" = "1" ] ; then
                eval pp $PP_ARGS $SRC/$file > "${DIR}/${target}"
            else
                log "Update" "${SRC}/$file"
                cp $SRC/$file ${DIR}/${target}
            fi
            if [ `uname` != "CYGWIN_NT-5.1" ] ; then
                chmod -w ${DIR}/$target
            fi
        fi
    done
}


#
#   Main
#
DIR=`pwd`
ignore=""
diff=0
import=0
patch=0
sync=0

while :
do
    case "$1" in 
    --diff)
        diff=1
        ;;
    --ignore)
        ignore="$2"
        shift
        ;;
    --import)
        import=1
        ;;
    --patch|-p)
        patch=1
        preserve="$2"
        shift
        ;;
    --strip)
        STRIP="$2"
        shift
        ;;
    --sync)
        sync=1
        ;;
    --verbose|-v)
        TRACE=1
        ;;
    --) usage
        ;;
    *)  break
        ;;
    esac
    shift
done


if [ "$#" -ne 1 ] ; then
    usage
    exit 2
fi

DIR=`getpath -a "."`
ARCHIVE=`getpath -a "$1"`

if [ ! -f "$ARCHIVE" ] ; then
    echo "Can't find $ARCHIVE"
fi

getBuildConfig

if [ "$patch" = "1" ] ; then
    PP_ARGS=`buildPatch`
    echo -e "  # Using pp args: $PP_ARGS\n"
fi

mkdir -p $IDIR
rm -fr $IDIR/*
tar xfz $ARCHIVE -C $IDIR
SRC=$IDIR
syncFiles
rm -fr $IDIR/*

if [ "$patch" = "1" ]
then
    echo PATCHING copyrights not supported
    exit 255
    echo -en "\n  #\n  # "
    echo -e "Patch copyrights ...\n  #"
    cat $FILE_LIST | incPatch -l copyrights
fi