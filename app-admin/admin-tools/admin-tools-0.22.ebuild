# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="A set of useful tools to make your (gentoo) admin life easier"
HOMEPAGE="https://ercpe.de/projects/admin-tools"
SRC_URI="https://mirror.not-your-server.de/overlays/last-hope/${CATEGORY}/${PN}/${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
LICENSE="all-rights-reserved"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	app-portage/eix
	app-portage/gentoolkit
	app-admin/lib_users
	app-portage/portage-utils"
DEPEND=""

RESTRICT="mirror"

src_install() {
	python_scriptinto /usr/sbin
	python_foreach_impl python_doscript adduse.py resume-list ps_mem.py
	dosbin autounmask regen-meta-flat rebuild-all update-portage
}