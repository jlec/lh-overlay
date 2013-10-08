# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

AUTOTOOLS_AUTORECONF=true

inherit autotools-utils

DESCRIPTION="A GTK+-based LDAP client"
HOMEPAGE="http://www.gq-project.org/"
SRC_URI="mirror://sourceforge/gqclient/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kerberos sasl"

RDEPEND="
	net-nds/openldap
	dev-libs/openssl
	sasl? ( dev-libs/cyrus-sasl )
	kerberos? ( virtual/krb5 )	
	x11-libs/gtk+:2
	dev-libs/libxml2
	dev-libs/glib:2
	x11-libs/pango
	gnome-base/gnome-keyring
	gnome-base/libglade:2.0
	dev-libs/libgcrypt
"
# gdk-pixbuf???
## perl?
DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=dev-util/intltool-0.35"


	#epatch "${FILESDIR}/${PV}-single-glib-import.patch"
	PATCHES=( "${FILESDIR}/${PV}-no-werror.patch" )
src_prepare() {
	sed -i -e 's/AM_ACLOCAL_INCLUDE/AC_CONFIG_MACRO_DIR/g' \
		-e 's/AS_PROG_OBJC/AC_PROG_OBJC/g' \
		-e '/.*test\/Makefile.*/d' \
		-e 's/-ldes425//g' \
		configure.in || die
	sed -i -e '/.*test.*/d' Makefile.am || die

	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		--enable-browser-dnd
		--enable-cache
		--disable-update-mimedb
		--disable-werror
		--disable-debugging
		)

autotools-utils_src_configure
}
