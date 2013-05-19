# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit git-2 multilib prefix python-single-r1

DESCRIPTION="Tools to handle squashed portage"
HOMEPAGE="http://www.j-schmitz.net/projects/squashed-portage/"
SRC_URI=""
EGIT_REPO_URI="https://repos.j-schmitz.net/git/pub/squashed-portage.git"

SLOT="0"
KEYWORDS=""
LICENSE="GPL-3"
IUSE=""

RDEPEND="
	dev-python/progressbar[${PYTHON_USEDEP}]
	sys-fs/squashfs-tools:0
	virtual/python-argparse[${PYTHON_USEDEP}]"
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
