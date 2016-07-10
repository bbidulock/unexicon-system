<!--| unexicon-system -- read me first file.  2015-08-30 |-->

### unexicon-system

Package unexicon-system-1.2 was released under GPLv3 license 2016-07-09.

This is a set of configuration files, dispatchers and hook scripts that
are use to mount the "Unexicon Live" platform.

### Release

This is the unexicon-system-1.2 package, released 2016-07-09.  This
release, and the latest version, can be obtained from the GitHub
repository at [](https://github.com/bbidulock/unexicon-system), using
a command such as:

    $> git clone https://github.com/bbidulock/unexicon-system.git

Please see the [NEWS](NEWS) file for release notes and history of user
visible changes for the current version, and the [ChangeLog](ChangeLog)
file for a more detailed history of implementation changes.  The
[TODO](TODO) file lists features not yet implemented and other
oustanding items.

Please see the [INSTALL](INSTALL) file for installation instructions.

When working from ```git(1)```, please use this file.  An abbreviated
installation procedure that works for most applications appears below.

This release is published under GPLv3.  Please see the license in
the file [COPYING](COPYING).

### Quick Start:

The quickest and easiest way to get unexicon-system up and running is to
run the following commands:

    $> git clone https://github.com/bbidulock/unexicon-system.git
    $> cd unexicon-system
    $> ./autogen.sh
    $> ./configure --prefix=/usr --sysconfdir=/etc
    $> make V=0
    $> make DESTDIR="$pkgdir" install

This will configure, compile and install unexicon-system the quickest.
For those who would like to spend the extra 15 seconds reading
the output of ./configure --help, some compile options can be
turned on and off before the build.

For general information on GNU's ./configure, see the file
[INSTALL](INSTALL).

<!--| vim: set ft=markdown tw=72 nocin nosi fo+=tcqlorn: |-->