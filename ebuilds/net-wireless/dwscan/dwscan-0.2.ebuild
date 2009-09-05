# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/gajim/gajim-0.11.4.ebuild,v 1.6 2008/01/24 20:23:28 angelos Exp $

inherit multilib python eutils

DESCRIPTION="Dwscan displays access point information in a useful manner."
HOMEPAGE="http://dag.wieers.com/home-made/dwscan/"
SRC_URI="http://dag.wieers.com/home-made/dwscan/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=net-wireless/python-wifi-0.3"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS ChangeLog COPYING README TODO WISHLIST
}
