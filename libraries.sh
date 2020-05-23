#!/bin/bash
# libraries.sh by Wouter Wijsman (wwijsman@live.nl)

cd "$(dirname "$0")"
WORKDIR="${PWD}"

build_package() {
    PSPBUILD="${1}/PSPBUILD"
    
    # Make sure the PSPBUILD exists and is a file
    if [ ! -f "${PSPBUILD}" ]; then
        echo "No PSPBUILD file found in ${PWD}/${1}"
        return
    fi

    echo "Checking dependencies for ${1}..."
    for dependency in $(bash -c "./parse_pspbuild.sh ${PSPBUILD} depends"); do
        build_package "${dependency}"
    done

    echo "Building ${1}..."
    cd "${1}"
    psp-makepkg -i --noconfirm
    cd $WORKDIR
}

# Build all packages
for package in $(find -maxdepth 1 -type d); do
    if [ "${package}" == "./.git" ] || [ "${package}" == "." ]; then
        continue
    fi
    pkgname="$(echo "${package}"|cut -d"/" -f2)"
    build_package "${pkgname}"
done