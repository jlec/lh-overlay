# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-r1 vcs-snapshot

DESCRIPTION="Script to check LDAP syncrepl replication"
HOMEPAGE="http://git.zionetrix.net/git/check_syncrepl_extended"
SRC_URI="https://gentoo.j-schmitz.net/overlays/last-hope/${CATEGORY}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/python-ldap[${PYTHON_USEDEP}]"

src_install() {
	python_foreach_impl python_doscript ${PN/nagios-}
}