# Usage: test_deps DEP1 DEP2 ...
function test_deps {
    for dep in $*; do
        script="$basepath/depends/check-$dep.sh"
        if [ -x $script ]; then
            "$script" 1> /dev/null
            if [ $? -ne 0 ]; then
                script2="$basepath/scripts/$dep.sh"
                if [ -x $script2 ]; then
                    "$script2" || { echo "Couldn't install dependency $dep, aborting."; return 1; }
                else
                    echo "Dependency $dep required but not found. Please install it."
                    return 1
                fi
            fi
        else
            echo "Dependency script for $dep not found. Fix your script!"
            return 1
        fi
    done
    return 0
}

# Usage: download_and_extract URL DIRECTORY
function download_and_extract {
    cd $basepath/build
    wget --continue --no-check-certificate $1
    name=`echo $1|sed -e "s/.*\///"`
    ext=`echo $name|sed -e "s/.*\.//"`
    rm -Rf $2 || { return 1; }
    case $ext in
        "tar")
            test_deps tar
            tar xf $name
            ;;
        "gz")
            test_deps tar
            tar xzf $name
            ;;
        "bz2")
            test_deps tar
            tar xjf $name
            ;;
        *)
            echo "Archive extension $ext unsupported."
            return 1
    esac
    cd $2 || { return 1; }
    return 0
}

# Usage: get_pspports DIR
function get_pspports {
    test_deps wget tar
    wget --continue --no-check-certificate https://github.com/pspdev/psp-ports/tarball/master -O psp-ports.tar.gz || { return 1; }
    rm -Rf psp-ports
    mkdir psp-ports
    tar --strip-components=1 --directory=psp-ports -xvzf psp-ports.tar.gz || { return 1; }
    cd psp-ports/$1 || { return 1; }
}

# Usage: run_configure OPT1 OPT2 ...
function run_configure {
    LDFLAGS="$LDFLAGS -L$(psp-config --pspsdk-path)/lib -lc -lpspuser" \
    LIBS="$LIBS -lc -lpspuser" \
    ./configure --host=psp --prefix=$(psp-config --psp-prefix) $* || { return 1; }
    return 0
}

function run_make {
    test_deps make || { return 1; }
    make $* || { return 1; }
    make install || { return 1; }
    return 0
}

function run_autogen_build {
    sh autogen.sh || { return 1; }
    if [ -n "$(grep aclocal autogen.sh)" ]; then test_deps automake || { return 1; }; fi
    if [ -n "$(grep automake autogen.sh)" ]; then test_deps automake || { return 1; }; fi
    if [ -n "$(grep autoconf autogen.sh)" ]; then test_deps autoconf || { return 1; }; fi
    if [ -n "$(grep libtoolize autogen.sh)" ]; then test_deps libtool || { return 1; }; fi
    run_configure $* || { return 1; }
    run_make -j 4 || { return 1; }
    return 0
}

function apply_patch {
    patch -p1 < $basepath/patches/$1.patch
}

