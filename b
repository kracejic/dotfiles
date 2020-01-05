#!/bin/bash

NUMCORES=`nproc`
retval=1
args=$*
pretty=~/bin/prettyfier

if [ -f b ]; then
    $pretty bash ./b $*
    retval=$?
    exit $retval
fi

if [ -f b.py ]; then
    python3 ./b $*
    retval=$?
    exit $retval
fi


# short arguments
if [[ $# > 0 ]]; then
    case $1 in
        cv)
            shift
            args="checkVerbose $*"
            ;;
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
        g|gdb)
            shift
            args="gdb $*"
            pretty=
            ;;

    esac

fi


# execute right build system
if [ -f build/build.ninja ]; then
    cd build
    $pretty ninja -j$NUMCORES $args
    retval=$?
    cd ..
elif [ -f build/Makefile ]; then
    cd build
    $pretty make -j$NUMCORES $args
    retval=$?
    cd ..
elif [ -f build.ninja ]; then
    $pretty ninja -j$NUMCORES $args
    retval=$?
elif [ -f Makefile ]; then
    $pretty make -j$NUMCORES $args
    retval=$?
elif [ -f pom.xml ]; then
    export MAVEN_OPTS=-Dfile.encoding=ISO-8859-1
    export JAVA_TOOL_OPTIONS=-Dfile.encoding=ISO-8859-1
    $pretty mvn $args -Dmaven.test.skip=true
    retval=$?
else
    echo "could not identify build system"
    exit 1
fi

exit $retval
