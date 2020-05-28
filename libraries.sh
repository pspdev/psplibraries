#!/bin/bash
# libraries.sh by Wouter Wijsman (wwijsman@live.nl)

cd "$(dirname "$0")"
WORKDIR="${PWD}"

build_package() {
    # Make sure ${1} is set
    if [ -z "${1}" ]; then
        echo "No argument specified for build_package function"
        return
    fi

    # Find the PSPBUILD which provides what we're looking for
    PSPBUILD=""
    for pspbuild in $(find -type f -name PSPBUILD); do
        #Check if the current PSPBUILD provides what we need
        provides="$(bash -c "./parse_pspbuild.sh "${pspbuild}" provides")"
        if [[ $provides =~ (^|[[:space:]])$1($|[[:space:]]) ]]; then
            PSPBUILD="${pspbuild}"
            break
        fi
    done

    # Make sure the PSPBUILD exists and is a file
    if [ -z "${PSPBUILD}" ]; then
        echo "No PSPBUILD which provides ${1} was found"
        exit 1
    fi

    echo "Checking dependencies for ${1}..."
    for dependency in $(bash -c "./parse_pspbuild.sh ${PSPBUILD} depends"); do
        build_package "${dependency}"
    done

    echo "Building ${1}..."
    cd "$(dirname ${PSPBUILD})"
    psp-makepkg -i --noconfirm
    cd "${WORKDIR}"
}

# Build all packages
for pspbuild in $(find -type f -name PSPBUILD); do
    pkgname="$(bash -c "./parse_pspbuild.sh ${pspbuild} pkgname")"
    build_package "${pkgname}"
done
