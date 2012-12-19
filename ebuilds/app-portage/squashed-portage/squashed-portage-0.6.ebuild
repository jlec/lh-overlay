# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit multilib prefix

DESCRIPTION="Tools to handle squashed portage"
HOMEPAGE="http://www.j-schmitz.net/projects/squashed-portage/"
SRC_URI="http://gentoo.j-schmitz.net/portage-overlay/${CATEGORY}/${PN}/${P}.tar.bz2"

SLOT="0"
KEYWORDS="amd64 x86 arm"
LICENSE="GPL-3"
IUSE=""

RDEPEND="sys-fs/squashfs-tools:0"
DEPEND=""

RESTRICT="mirror"

src_prepare() {
	eprefixify *
	sed -e "s:GENTOOLIBDIR:$(get_libdir):g" -i get-squashed-portage || die
}

src_install() {
	dodir /var/portage
	keepdir /var/portage
	newinitd ${PN}.init ${PN}
	newconfd ${PN}.conf ${PN}
	dobin get-squashed-portage

	exeinto /usr/$(get_libdir)/${PN}/
	doexe fetch-squashed-portage.py
}
