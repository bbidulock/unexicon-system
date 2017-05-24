
ACLOCAL_AMFLAGS = -I m4

SUBDIRS =

EXTRA_DIST = INSTALL COPYING AUTHORS NEWS README README.md README.md.in THANKS TODO ChangeLog

dist_noinst_SCRIPTS = gennews.sh autogen.sh configure.sh rebuild.sh dist.sh

DISTCLEANFILES = ChangeLog AUTHORS NEWS README README.md README.html README.txt

dist-hook:
	if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		chmod u+w $(distdir)/{ChangeLog,AUTHORS,NEWS} ; \
		( cd $(srcdir) ; \
		  echo -e "# created with git log --stat=76 -M -C -300|fmt -sct -w80\n" ; \
		  git log --stat=76 -M -C -300|fmt -sct -w80 \
		)|head -5000>$(distdir)/ChangeLog ; \
		( cd $(srcdir) ; \
		  echo "$(PACKAGE) -- authors file.  $(DATE)" ; \
		  echo "" ; \
		  git log|grep '^Author:'|awk '{if(!authors[$$0]){print$$0;authors[$$0]=1;}}' \
		)>$(distdir)/AUTHORS ; \
		( cd $(srcdir) ; \
		  echo "$(PACKAGE) -- history of user-visible changes.  $(DATE)" ; \
		  PACKAGE="$(PACKAGE)" $(srcdir)/gennews.sh \
		)>$(distdir)/NEWS ; \
	fi ; \
	chmod u+w $(distdir)/{README.md,README} ; \
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $(distdir)/README.md.in >$(distdir)/README.md ; \
	cat $(distdir)/README.md | fmt -sct -w80 -g72 >$(distdir)/README

ChangeLog:
	if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		( cd $(srcdir) ; \
		  echo -e "# created with git log --stat=76 -M -C -300|fmt -sct -w80\n" ; \
		  git log --stat=76 -M -C -300|fmt -sct -w80 \
		)|head -5000>$@ ; \
	else touch $@ ; fi

AUTHORS:
	if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		( cd $(srcdir) ; \
		  echo "$(PACKAGE) -- authors file.  $(DATE)" ; \
		  echo "" ; \
		  git log|grep '^Author:'|awk '{if(!authors[$$0]){print$$0;authors[$$0]=1;}}' \
		)>$@ ; \
	else touch $@ ; fi

NEWS:
	if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		( cd $(srcdir) ; \
		  echo "$(PACKAGE) -- history of user-visible changes.  $(DATE)" ; \
		  PACKAGE="$(PACKAGE)" $(srcdir)/gennews.sh \
		)>$@ ; \
	else touch $@ ; fi

README.md: README.md.in
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $< >$@

README: README.md
	cat $< | fmt -sct -w80 -g72 >$@

README.html: README.md
	markdown $< >$@

README.txt: README.html
	links -dump -width 80 -codepage utf-8 $< >$@

EXTRA_DIST += 00-nm

dist_systemdsystemconf_DATA = \
	autologin@.service \
	pacman-init.service

dist_systemdutil_SCRIPTS = \
	unexicon-setup

dist_udevconfrules_DATA = \
	80-net-name-slot.rules \
	80-net-setup-link.rules

dist_udevrules_DATA = \
	99-unexicon-autoipd.rules \
	99-unexicon-dhcpcd.rules \
	99-unexicon-ifplugd.rules \
	99-unexicon-wpa_supplicant.rules \
	99-xtra-systemd.rules

dist_ferm_DATA = \
	vars.sh \
	vars.ferm \
	unexicon.ferm

dist_avahiservice_DATA = \
	unexicon.service

dist_sysconf_DATA = \
	ipinfodb.key \
	dhcpcd-unexicon.conf \
	dnsmasq-unexicon.conf \
	ferm-unexicon.conf \
	accel-ppp-unexicon.conf

dist_bin_SCRIPTS = \
	ipinfodb-lookup

dist_systemdsystemunit_DATA = \
	unexicon-accel-pppd.service \
	unexicon-autofs.service \
	unexicon-avahi-autoipd@.service \
	unexicon-avahi-daemon.service \
	unexicon-avahi-daemon.socket \
	unexicon-avahi-dnsconfd.service \
	unexicon-dhcpcd.service \
	unexicon-dhcpcd@.service \
	unexicon-dnsmasq.service \
	unexicon-ferm.service \
	unexicon-ifplugd@.service \
	unexicon-lldpd.service \
	unexicon-setup.service \
	unexicon-snmpd.service \
	unexicon-snmptrapd.service \
	unexicon-sshd.service \
	unexicon-sshd@.service \
	unexicon-sshd.socket \
	unexicon-wpa_supplication@.service \
	unexicon-ypbind.service

dist_ifplugdconf_SCRIPTS = \
	unexicon.action

dist_avahiconf_DATA = \
	avahi-daemon-unexicon.conf

dist_modulesload_DATA = \
	lpr.conf \
	oss-compat.conf

dist_lldpdconf_DATA = \
	lldpd-unexicon.conf

dist_snmpdconf_DATA = \
	snmpd.conf

dist_sysctl_DATA = \
	forwarding.conf

dist_ssh_DATA = \
	unexicon-sshd_config

00-nm.sh: 00-nm
	rm -f $@; $(LN_S) $< $@

10-ferm.sh: 10-ferm
	rm -f $@; $(LN_S) $< $@

19-zebra.sh 81-zebra.sh: 19-zebra
	rm -f $@; $(LN_S) $< $@

20-babel.sh 80-babel.sh: 20-babel
	rm -f $@; $(LN_S) $< $@

20-ospf.sh 80-ospf.sh: 20-ospf
	rm -f $@; $(LN_S) $< $@

20-ospf6.sh 80-ospf6.sh: 20-ospf6
	rm -f $@; $(LN_S) $< $@

20-rip.sh 80-rip.sh: 20-rip
	rm -f $@; $(LN_S) $< $@

20-ripng.sh 80-ripng.sh: 20-ripng
	rm -f $@; $(LN_S) $< $@

35-ntp.sh 65-ntp.sh: 35-ntp
	rm -f $@; $(LN_S) $< $@

37-nis.sh: 37-nis
	rm -f $@; $(LN_S) $< $@

39-lldp.sh 61-lldp.sh: 39-lldp
	rm -f $@; $(LN_S) $< $@

50-geoip.sh: 50-geoip
	rm -f $@; $(LN_S) $< $@

dist_dhcpcdhooks_DATA = \
	00-nm \
	10-ferm \
	19-zebra \
	20-babel \
	20-ospf \
	20-ospf6 \
	20-rip \
	20-ripng \
	35-ntp \
	37-nis \
	39-lldp \
	50-geoip

dist_nmdispatcher_SCRIPTS = \
	10-ferm \
	19-zebra \
	20-babel \
	20-ospf \
	20-ospf6 \
	20-rip \
	20-ripng \
	35-ntp \
	37-nis \
	39-lldp \
	50-geoip

dist_ppp_SCRIPTS = \
	ip-pre-up

dist_pppippreup_SCRIPTS = \
	10-ferm.sh

dist_pppipup_SCRIPTS = \
	19-zebra.sh \
	20-babel.sh \
	20-ospf.sh \
	20-ospf6.sh \
	20-rip.sh \
	20-ripng.sh \
	35-ntp.sh \
	39-lldp.sh \
	50-geoip.sh

dist_pppipdown_SCRIPTS = \
	81-zebra.sh \
	80-babel.sh \
	80-ospf.sh \
	80-ospf6.sh \
	80-rip.sh \
	80-ripng.sh \
	65-ntp.sh

dist_modprobe_DATA = \
	blacklist-mei_me.conf

AM_INSTALLCHECK_STD_OPTIONS_EXEMPT = \
	00-nm.sh \
	10-ferm \
	10-ferm.sh \
	19-zebra \
	19-zebra.sh \
	20-babel \
	20-babel.sh \
	20-ospf \
	20-ospf.sh \
	20-ospf6 \
	20-ospf6.sh \
	20-rip \
	20-rip.sh \
	20-ripng \
	20-ripng.sh \
	35-ntp \
	35-ntp.sh \
	37-nis \
	37-nis.sh \
	39-lldp \
	39-lldp.sh \
	50-geoip \
	50-geoip.sh \
	65-ntp.sh \
	80-babel.sh \
	80-ospf.sh \
	80-ospf6.sh \
	80-rip.sh \
	80-ripng.sh \
	81-zebra.sh \
	ipinfodb-lookup \
	ip-pre-up \
	unexicon-setup \
	unexicon.action

install-data-hook:
	chmod 0444 $(DESTDIR)$(dhcpcdhooksdir)/*-*

#	chmod 0700 $(DESTDIR)$(nmdispatcherdir)/*-*
