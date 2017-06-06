#!/bin/bash

NUMCORES=`nproc`
retval=1
args=$*
pretty=~/bin/prettyfier

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
if [ -f build.ninja ]; then
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
fi

exit $retval
