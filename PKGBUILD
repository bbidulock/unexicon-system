# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=unexicon-system
pkgver=1.2.52
pkgrel=1
pkgdesc="System configuration for Unexicon Live" 
arch=('any')
license=('AGPL3')
url="http://www.unexicon.com/"
depends=(dhcpcd ntp ypbind-mt autofs quagga iptables ebtables arptables ferm ppp accel-ppp avahi
	 lldpd net-snmp openssh xdm-unexicon-theme wpa_supplicant ifplugd openssh rsync sssd-nosmb
	 tlp ypserv)

makedepends=(git)
optdepends=('networkmanager: network manager support')
replaces=(networkmanager-dispatchers dhcpcd-hook-ntp dhcpcd-hook-nis)
backup=(etc/ipinfodb.key)
install=$pkgname.install
changelog=$pkgname.changelog
backup=('etc/accel-ppp-unexicon.conf'
	'etc/dhcpcd-unexicon.conf'
	'etc/dnsmasq-unexicon.conf'
	'etc/ferm-unexicon.conf'
	'etc/bluetooth/unexicon-main.conf'
	'etc/modprobe.d/blacklist-mei_me.conf'
	'etc/avahi/avahi-daemon-unexicon.conf'
	'etc/wpa_supplicant/wpa_supplicant.conf'
	'etc/wpa_supplicant/wpa_supplicant-wlan0.conf'
	'etc/wpa_supplicant/wpa_supplicant-wlan1.conf')
source=("$pkgname::git+https://github.com/bbidulock/unexicon-system.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -e 's,[-_],.,g;s,\.g.*,,'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package () {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
