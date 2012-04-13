# Usage: test_dep DEP
function test_dep {
    script="$basepath/depends/check-$dep.sh"
    if [ -x $script ]; then
        "$script" 1> /dev/null
        return $?
    fi
    echo "Dependency script for $dep not found, assuming it's not installed."
    return 1
}

# Usage: test_deps DEP1 DEP2 ...
function test_deps {
    for dep in $*; do
        test_dep $dep || return 1
    done
    return 0
}

# Usage: test_deps_install DEP1 DEP2 ... (tests dependencies and installs them if they aren't available)
function test_deps_install {
    for dep in $*; do
        test_dep $dep || {
            script2="$basepath/scripts/$dep.sh"
            if [ -x $script2 ]; then
                sh -c "source $basepath/common.sh; set -e; basepath=$basepath; source $script2" || { echo "Couldn't install dependency $dep, aborting."; return 1; }
            else
                echo "Dependency $dep required but not found. Please install it."
                return 1
            fi
        }
    done
    return 0
}

# Usage: download_and_extract URL DIRECTORY
function download_and_extract {
    cd $basepath/build
    test_deps wget
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
        "tbz2")
            test_deps tar
            tar xjf $name
            ;;
        "zip")
            test_deps unzip
            unzip $name
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
    cd $basepath/build
    test_deps git

    if [ -d "psp-ports" ]; then
        # update psp-ports

        cd "psp-ports"

        if [ ! -d ".git" ]; then
            echo "Please delete 'build/psp-ports' and try again"
            return 1
        fi

        git pull
        cd $1 || { return 1; }
    else
        # clone psp-ports

        git clone "https://github.com/pspdev/psp-ports.git" psp-ports
        cd psp-ports/$1 || { return 1; } 
    fi
}

# Usage: run_configure OPT1 OPT2 ...
function run_configure {
    LDFLAGS="$LDFLAGS -L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser" \
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
