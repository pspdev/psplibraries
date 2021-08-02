# PSPLibraries

This repo contains PSPBUILD files for all the libraries shipped with PSPDEV. They are automatically build and hosted as an pacman repository using Github actions. Using it requires the [psptoolchain](https://github.com/pspdev/psptoolchain) and [psp-pacman](https://github.com/pspdev/psp-pacman).

## Adding the pacman repo

Add the following lines to the file ``${PSPDEV}/etc/pacman.conf``:

```
[pspdev]
SigLevel = Optional TrustAll
Server = https://github.com/pspdev/psplibraries/releases/latest/download/
```

Then run: ``psp-pacman -Syu``

## Installing libraries from the repo

Installing libraries from this repo can be done like so:

```
psp-pacman -Sy library
```

Replace library with the library which should be installed.

An overview of libaries available can be viewed with:

```
psp-pacman -Q
```

Installing all available libraries can be done with:

```
psp-pacman -Sy $(psp-pacman -Qq)
```

## Building individual packages

Building a single package from the repository can be done by opening a terminal in the directory of the chosen library and running the following:

```
psp-makepkg -i
```

This will build and install the package.

## Contributing

Contributions to this repository are welcome. Especially fixes and new libraries always add value. Take a look at[CONTRIBUTING.md](CONTRIBUTING.md) for information on style of PSPBUILDs.

For more general information on how to write PSPBUILDs take a look at the [Arch wiki](https://wiki.archlinux.org/title/Creating_packages).

## Special thanks

A special thanks goes out to both the contributors of PSPDEV and the VITASDK. Most of the scripts in this repository are based on scripts written by them.
