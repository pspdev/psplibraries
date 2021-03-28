# Contribution guidelines

This repository contains a set of PSPBUILDs which allow for building different libraries for the PSP. Contributions to this repository are very welcome and helps improve the PSP toolchain.

For new PSPBUILDs or updates to existing ones to be mergable in this repository, the following criteria will need to be met:

- For new packages:
  - The following fields should be set:
    - ``pkgdesc``
    - ``license``
  - ``arch`` should be set to ``('mips')`` for PSP libraries or to ``('any')`` for scripts.
  - ``sha256sums`` should be used for integrity checks of downloaded files. Only version controlled repositories (think git, svn or mercurial) and local patches are allowed to use ``SKIP``.
  - PSPBUILDs based on versioned archive files (yourlibrary-1.2.tar.gz for instance) are preferred over those based on version controlled repositories.
  - The license of the library should be installed in ``$pkgdir/psp/share/licenses/$pkgname``.
  - For PSPBUILDs based on a version controlled repository, use the ``pkgver()`` function to set the ``pkgver`` to something which only changes if that repository is updated. See [this page](https://wiki.archlinux.org/index.php/VCS_package_guidelines) for instructions on how to do that.
  - No packages which can not be legally distributed after building are allowed.
  - ``pkgname`` should not contain capital letters or special characters other than ``-``.
  - PSPBUILDS should start with ``# Contributor: Your Name``. Adding an email at the after it like ``<youemail@example.com>`` is optional, but encouraged.
- For existing packages:
  - Either the ``pkgver`` or ``rel`` has been changed.
- For all PSPBUILDs:
  - Libraries go in ``$pkgdir/psp/lib/``.
  - Include files go in ``$pkgdir/psp/include/``.
  - Pkgconfig files go in ``$pkgdir/psp/lib/pkgconfig``.
  - License files go in ``$pkgdir/psp/share/licenses/$pkgname``.
  - Scripts which should be in the path of the user go in ``$pkgdir/bin``.
  - Other scripts go in ``$pkgdir/psp/bin`` or ``$pspdir/share/$pkgname/bin``.
  - Documentation goes in ``$pkgdir/psp/share/doc/$pkgname`` or ``$pkgdir/share/doc/$pkgname``.
