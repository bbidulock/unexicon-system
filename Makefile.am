
ACLOCAL_AMFLAGS = -I m4

SUBDIRS =

ChangeLog:
	( \
	  echo -e "# created with git log --stat=76 -M -C|fmt -sct -w80\n" ; \
	  git log --stat=76 -M -C|fmt -sct -w80 ; \
	)>$@

AUTHORS.in:
	( \
	  echo "\@PACKAGE\@ -- authors file.  \@DATE\@" ; \
	  echo "" ; \
	  git log|grep '^Author:'|awk '{if(!authors[$$0]){print$$0;authors[$$0]=1;}}'|tac \
	)>$@

README: README.in
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $< >$@

NEWS: NEWS.in
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $< >$@

AUTHORS: AUTHORS.in
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $< >$@

THANKS: THANKS.in
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $< >$@

TODO: TODO.in
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g' $< >$@

EXTRA_DIST = autogen.sh configure.template 00-nm \
	README.in NEWS.in THANKS.in TODO.in

DISTCLEANFILES = AUTHORS AUTHORS.in

dist_systemdsystemconf_DATA = \
	autofs.service \
	autologin@.service \
	avahi-autoipd@.service \
	pacman-init.service \
	snmpd.service \
	snmptrapd.service

dist_systemdutil_SCRIPTS = \
	unexicon-setup

dist_udevconfrules_DATA = \
	80-net-name-slot.rules \
	80-net-setup-link.rules

dist_udevrules_DATA = \
	99-xtra-systemd.rules \
	99-unexicon-ifplugd.rules

dist_ferm_DATA = \
	vars.sh \
	vars.ferm \
	unexicon.ferm

dist_avahiservice_DATA = \
	unexicon.service

dist_sysconf_DATA = \
	ipinfodb.key \
	dhcpcd-unexicon.conf \
	dnsmasq-unexicon.conf

dist_bin_SCRIPTS = \
	ipinfodb-lookup

dist_systemdsystemunit_DATA = \
	unexicon-setup.service \
	unexicon-ifplugd@.service \
	unexicon-dhcpcd.service \
	unexicon-dhcpcd@.service \
	unexicon-dnsmasq.service

dist_ifplugdconf_SCRIPTS = \
	unexicon.action

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
