#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([unexicon-system],[1.2],[http://github.com/bbidulock/unexicon-system],[unexicon-system],[http://github.com/bbidulock/unexicon-system/issues])
AC_REVISION([1.2])

AC_CONFIG_SRCDIR([configure.ac])
AC_CONFIG_HEADERS([autoconf.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([scripts])
AC_USE_SYSTEM_EXTENSIONS
AC_CANONICAL_TARGET

DATE='2016-07-09'
AC_SUBST([DATE])

BRANCH='master'
AC_SUBST([BRANCH])

# Initialize Automake
AM_INIT_AUTOMAKE([gnits 1.14 dist-xz no-dist-gzip std-options -Wall color-tests silent-rules tar-pax])
AM_MAINTAINER_MODE
AM_SILENT_RULES([yes])
AC_PREFIX_DEFAULT([/usr])

# Checks for programs.
AC_PROG_SED
AC_PROG_AWK
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

AC_ARG_VAR([MARKDOWN],[markdown command. @<:@default=markdown@:>@])
AC_CHECK_PROGS([MARKDOWN],[markdown],[${am_missing_run}markdown],[$PATH])

AC_ARG_VAR([ASCIIDOC],[asciidoc command. @<:@default=asciidoctor@:>@])
AC_CHECK_PROGS([ASCIIDOC],[asciidoctor asciidoc],[${am_missing_run}asciidoctor],[$PATH])

AC_ARG_VAR([ASCIIDOC_BACKEND],[asciidoc backend @<:@default=NONE@:>@])
if test -z "$ASCIIDOC_BACKEND"; then
	case "$ASCIIDOC" in
		asciidoc) ASCIIDOC_BACKEND="--backend=html4" ;;
		asciidoctor) ASCIIDOC_BACKEND="--backend=html5" ;;
		*) AC_MSG_WARN([ASCIIDOC $ASCIIDOC is not supported.]) ;;
	esac
fi

AC_ARG_VAR([ASCIIMAN],[asciidoc to manpage converter. @<:@default=asciidoctor@:>@])
AC_CHECK_PROGS([ASCIIMAN],[asciidoctor a2x],[${am_missing_run}asciidoctor],[$PATH])

AC_ARG_VAR([ASCIIMAN_FORMAT],[asciidoc manpage option @<:@default=NONE@:>@])
if test -z "$ASCIIMAN_FORMAT"; then
	case "$ASCIIMAN" in
		a2x) ASCIIMAN_FORMAT="--format=manpage" ;;
		asciidoctor) ASCIIMAN_FORMAT="--backend=manpage" ;;
		*) AC_MSG_WARN([ASCIIMAN $ASCIIMAN is not supported.]) ;;
	esac
fi

AC_ARG_VAR([LINKS],[links command. @<:@default=lynx@:>@])
AC_CHECK_PROGS([LINKS],[lynx links],[${am_missing_run}lynx],[$PATH])
if test "$LINKS" = "links"; then
	LINKS="links -codepage utf-8"
fi

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

logindsnippetdir="$systemdsystemunitdir/systemd-logind.d"
AC_SUBST([logindsnippetdir])

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

sssddir='${sysconfdir}/sssd'
AC_SUBST([sssddir])

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
