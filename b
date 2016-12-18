#!/bin/bash

NUMCORES=`nproc`
retval=1
args=$*

# short arguments
if [[ $# > 0 ]]; then
    case $1 in
        c|t)
            shift
            args="check $*"
            ;;
        d)
            shift
            args="doc $*"
            ;;
        cl|cc)
            shift
            args="clean $*"
            ;;
        u)
            shift
            args="unit $*"
            ;;
        i)
            shift
            args="install $*"
            ;;
        r)
            shift
            args="run $*"
            ;;
        f)
            shift
            args="format $*"
            ;;
        p)
            shift
            args="package $*"
            ;;
    esac

fi


# execute right build system
if [ -f build.ninja ]; then
    ~/bin/prettyfier ninja -j$NUMCORES $args
    retval=$?
elif [ -f Makefile ]; then
    ~/bin/prettyfier make -j$NUMCORES $args
    retval=$?
fi

exit $retval
