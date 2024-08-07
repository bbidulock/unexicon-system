
ACLOCAL_AMFLAGS = -I m4

SUBDIRS =

EXTRA_DIST = INSTALL COPYING AUTHORS NEWS index.md README README.md README.md.in THANKS TODO ChangeLog RELEASE RELEASE.md RELEASE.md.in

dist_noinst_SCRIPTS = gennews.sh autogen.sh configure.sh rebuild.sh dist.sh

DISTCLEANFILES = ChangeLog AUTHORS NEWS index.md README README.md README.html README.txt RELEASE RELEASE.md RELEASE.html RELEASE.txt

dist-hook:
	$(AM_V_GEN)if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		chmod u+w $(distdir)/{ChangeLog,AUTHORS,NEWS} ; \
		( cd $(srcdir) ; \
		  echo -e "# created with git log --stat=76 -M -C -500|fmt -sct -w80\n" ; \
		  git log --stat=76 -M -C -500|fmt -sct -w80 \
		)|head -10000>$(distdir)/ChangeLog ; \
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
	chmod u+w $(distdir)/{RELEASE.md,RELEASE} ; \
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g;s:\@BRANCH\@:$(BRANCH):g' $(distdir)/README.md.in >$(distdir)/README.md ; \
	sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g;s:\@BRANCH\@:$(BRANCH):g' $(distdir)/RELEASE.md.in >$(distdir)/RELEASE.md ; \
	cat $(distdir)/README.md | fmt -sct -w80 -g72 >$(distdir)/README \
	cat $(distdir)/RELEASE.md | fmt -sct -w80 -g72 >$(distdir)/RELEASE

ChangeLog:
	$(AM_V_GEN)if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		( cd $(srcdir) ; \
		  echo -e "# created with git log --stat=76 -M -C -500|fmt -sct -w80\n" ; \
		  git log --stat=76 -M -C -500|fmt -sct -w80 \
		)|head -10000>$@ ; \
	else touch $@ ; fi

AUTHORS:
	$(AM_V_GEN)if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		( cd $(srcdir) ; \
		  echo "$(PACKAGE) -- authors file.  $(DATE)" ; \
		  echo "" ; \
		  git log|grep '^Author:'|awk '{if(!authors[$$0]){print$$0;authors[$$0]=1;}}' \
		)>$@ ; \
	else touch $@ ; fi

NEWS:
	$(AM_V_GEN)if test -x "`which git 2>/dev/null`" -a -d "$(srcdir)/.git" ; then \
		( cd $(srcdir) ; \
		  echo "$(PACKAGE) -- history of user-visible changes.  $(DATE)" ; \
		  PACKAGE="$(PACKAGE)" $(srcdir)/gennews.sh \
		)>$@ ; \
	else touch $@ ; fi

index.md: README.md
	$(AM_V_GEN)(echo -e "---\nlayout: default\n---"; cat $<) >$@

README.md: README.md.in
	$(AM_V_GEN)sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g;s:\@BRANCH\@:$(BRANCH):g' $< >$@

README: README.md
	$(AM_V_GEN)cat $< | fmt -sct -w80 -g72 >$@

README.html: README.md
	$(AM_V_GEN)$(MARKDOWN) $< >$@

README.txt: README.html
	$(AM_V_GEN)$(LINKS) -dump -width 80 -nolist $< | sed -r -e 's,^[[:space:]]*,,' >$@

RELEASE.md: RELEASE.md.in
	$(AM_V_GEN)sed -r -e 's:\@PACKAGE\@:$(PACKAGE):g;s:\@VERSION\@:$(VERSION):g;s:\@DATE\@:$(DATE):g;s:\@BRANCH\@:$(BRANCH):g' $< >$@

RELEASE: RELEASE.md
	$(AM_V_GEN)cat $< | fmt -sct -w80 -g72 >$@

RELEASE.html: RELEASE.md
	$(AM_V_GEN)$(MARKDOWN) $< >$@

RELEASE.txt: RELEASE.html
	$(AM_V_GEN)$(LINKS) -dump -width 80 -nolist $< | sed -r -e 's,^[[:space:]]*,,' >$@

NOTES.html: NOTES
	$(AM_V_GEN)$(ASCIIDOC) -o - $< >$@

TODO.html: TODO
	$(AM_V_GEN)$(ASCIIDOC) -o - $< >$@

release-files: $(DISTCLEANFILES)

release-clean:
	-test -z "$(DISTCLEANFILES)" || rm -f $(DISTCLEANFILES)

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

dist_sssd_DATA = \
	sssd.conf

dist_bluez_DATA = \
	unexicon-main.conf

dist_avahiservice_DATA = \
	unexicon.service

dist_sysconf_DATA = \
	ipinfodb.key \
	dhcpcd-unexicon.conf \
	dnsmasq-unexicon.conf \
	ferm-unexicon.conf \
	accel-ppp-unexicon.conf \
	nscd-unexicon.conf

dist_bin_SCRIPTS = \
	ipinfodb-lookup

dist_systemdsystemunit_DATA = \
	unexicon-accel-pppd.service \
	unexicon-autofs.service \
	unexicon-avahi-autoipd@.service \
	unexicon-avahi-daemon.service \
	unexicon-avahi-daemon.socket \
	unexicon-avahi-dnsconfd.service \
	unexicon-bluetooth.service \
	unexicon-dhcpcd.service \
	unexicon-dhcpcd@.service \
	unexicon-dnsmasq.service \
	unexicon-ferm.service \
	unexicon-ifplugd@.service \
	unexicon-lldpd.service \
	unexicon-nscd.service \
	unexicon-setup.service \
	unexicon-snmpd.service \
	unexicon-snmptrapd.service \
	unexicon-sshd.service \
	unexicon-sshd@.service \
	unexicon-sshd.socket \
	unexicon-wpa_supplicant@.service \
	unexicon-ypbind.service

dist_systemdsnippet_DATA = \
	noipsandbox.conf

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

dist_wpaconf_DATA = \
	wpa_supplicant.conf \
	wpa_supplicant-wlan0.conf \
	wpa_supplicant-wlan1.conf

dist_tmpfiles_DATA = \
	dhcpcd-perms.conf

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
	chmod 0711 $(DESTDIR)$(sssddir)
	chmod 0600 $(DESTDIR)$(sssddir)/sssd.conf

#	chmod 0700 $(DESTDIR)$(nmdispatcherdir)/*-*
