
AC_PREREQ([2.69])
AC_INIT([unexicon-system],[1.2],[http://github.com/bbidulock/unexicon-system],[unexicon-system])
AC_REVISION([1.2])

AC_CONFIG_SRCDIR([configure.ac])
AC_CONFIG_HEADERS([autoconf.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([scripts])

DATE='2016-07-09'
AC_SUBST([DATE])

# Initialize Automake
AM_INIT_AUTOMAKE([gnits 1.14 dist-xz no-dist-gzip std-options -Wall color-tests silent-rules tar-pax])
AM_MAINTAINER_MODE

# Checks for programs.
AC_PROG_AWK
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

#systemdsystemunitdir="`pkg-config systemd --variable=systemdsystemunitdir 2>/dev/null`"
#test -n "$systemdsystemunitdir" && systemdsystemunitdir="${DESTDIR}$systemdsystemunitdir"
test -n "$systemdsystemunitdir" || systemdsystemunitdir='${libdir}/systemd/system'
AC_SUBST([systemdsystemunitdir])

#systemdsystemconfdir="`pkg-config systemd --variable=systemdsystemconfdir 2>/dev/null`"
#test -n "$systemdsystemconfdir" && systemdsystemconfdir="${DESTDIR}$systemdsystemconfdir"
test -n "$systemdsystemconfdir" || systemdsystemconfdir='${sysconfdir}/systemd/system'
AC_SUBST([systemdsystemconfdir])

#systemdutildir="`pkg-config systemd --variable=systemdutildir 2>/dev/null`"
#test -n "$systemdutildir" && systemdutildir="${DESTDIR}$systemdutildir"
test -n "$systemdutildir" || systemdutildir='${libdir}/systemd'
AC_SUBST([systemdutildir])

#udevdir="`pkg-config udev --variable=udevdir 2>/dev/null`"
#test -n "$udevdir" && udevdir="${DESTDIR}$udevdir"
test -n "$udevdir" || udevdir='${libdir}/udev'
udevrulesdir='${udevdir}/rules.d'
AC_SUBST([udevdir])
AC_SUBST([udevrulesdir])

#udevconfdir="`pkg-config udev --variable=udevconfdir 2>/dev/null`"
#test -n "$udevconfdir" && udevconfdir="${DESTDIR}$udevconfdir"
test -n "$udevconfdir" || udevconfdir='${sysconfdir}/udev'
udevconfrulesdir='${udevconfdir}/rules.d'
AC_SUBST([udevconfdir])
AC_SUBST([udevconfrulesdir])

fermdir='${sysconfdir}/ferm'
AC_SUBST([fermdir])

avahiservicedir='${sysconfdir}/avahi/services'
AC_SUBST([avahiservicedir])

pppdir='${sysconfdir}/ppp'
pppippreupdir="$pppdir/ip-pre-up.d"
pppipupdir="$pppdir/ip-up.d"
pppipdowndir="$pppdir/ip-down.d"
AC_SUBST([pppdir])
AC_SUBST([pppippreupdir])
AC_SUBST([pppipupdir])
AC_SUBST([pppipdowndir])

dhcpcdhooksdir='${libdir}/dhcpcd/dhcpcd-hooks'
AC_SUBST([dhcpcdhooksdir])

nmdispatcherdir='${sysconfdir}/NetworkManager/dispatcher.d'
AC_SUBST([nmdispatcherdir])

modprobedir='${sysconfdir}/modprobe.d'
AC_SUBST([modprobedir])

modulesloaddir='${sysconfdir}/modules-load.d'
AC_SUBST([modulesloaddir])

ifplugdconfdir='${sysconfdir}/ifplugd'
AC_SUBST([ifplugdconfdir])

avahiconfdir='${sysconfdir}/avahi'
AC_SUBST([avahiconfdir])

lldpdconfdir='${sysconfdir}/lldpd.d'
AC_SUBST([lldpdconfdir])

snmpdconfdir='${sysconfdir}/snmp'
AC_SUBST([snmpdconfdir])

sysctldir='${sysconfdir}/sysctl.d'
AC_SUBST([sysctldir])

sshdir='${sysconfdir}/ssh'
AC_SUBST([sshdir])

test "x$prefix" = xNONE && prefix="$ac_default_prefix"

sharedir="$datadir"
eval "sharedir=\"$sharedir\""
eval "sharedir=\"$sharedir\""
eval "sharedir=\"$sharedir\""
AC_SUBST([sharedir])

AC_CONFIG_FILES([Makefile])

AC_OUTPUT

# vim: set ft=config:
