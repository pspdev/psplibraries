# Returns the number of processor cores available
# Usage: num_cpus
function num_cpus
{
    # This *should* be available on literally everything, including OSX
    getconf _NPROCESSORS_ONLN
}

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
                bash -c "source $basepath/common.sh; set -e; basepath=$basepath; source $script2" || { echo "Couldn't install dependency $dep, aborting."; return 1; }
            else
                echo "Dependency $dep required but not found. Please install it."
                return 1
            fi
        }
    done
    return 0
}

# Usage: extract <archive>
function auto_extract
{
    path=$1
    name=`echo $path|sed -e "s/.*\///"`
    ext=`echo $name|sed -e "s/.*\.//"`
    
    echo "Extracting $name..."
    
    case $ext in
        "tar") tar --no-same-owner -xf $path ;;
        "gz"|"tgz") tar --no-same-owner -xzf $path ;;
        "bz2"|"tbz2") tar --no-same-owner -xjf $path ;;
        "zip") unzip $path ;;
        *) echo "I don't know how to extract $ext archives!"; return 1 ;;
    esac
    
    return $?
}

# Usage: download_and_extract URL DIRECTORY
function download_and_extract
{
    url=$1
    name=`echo $url|sed -e "s/.*\///"`
    outdir=$2
    
    # If there are already an extracted directory, delete it, otherwise
    # reapplying patches gets messy. I tried.
    [ -d $outdir ] && echo "Deleting old version of $outdir" && rm -rf $outdir
    
    # First, if the archive already exists, attempt to extract it. Failing
    # that, attempt to continue an interrupted download. If that also fails,
    # remove the presumably corrupted file.
    [ -f $name ] && auto_extract $name || { wget --continue --no-check-certificate $url -O $name || rm -f $name; }
    
    # If the file does not exist at this point, it means it was either never
    # downloaded, or it was deleted for being corrupted. Just go ahead and
    # download it.
    # Using wget --continue here would make buggy servers flip out for nothing.
    [ -f $name ] || wget --no-check-certificate $url -O $name && auto_extract $name
    
    # Switch to the newly created directory
    cd $outdir || return 1
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

# Usage: get_pspport repository branch(defaults to master)
function get_pspport {
    cd $basepath/build
    test_deps git

    repository=$1
    branch=${2:-"master"}

    if [ -d "$repository" ]; then
        # update
        cd $repository

        if [ ! -d ".git" ]; then
            echo "Please delete 'build/$repository' and try again"
            return 1
        fi
        # cleanup
        git reset --hard
        git clean -fd
        git fetch
        git checkout $branch -- || return 1;
        git pull || { echo "Please delete 'build/$repository' and try again"; return 1; }
    else
        # clone
        git clone "https://github.com/pspdev/$repository.git" $repository
        cd $repository || return 1;
        git checkout $branch
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
