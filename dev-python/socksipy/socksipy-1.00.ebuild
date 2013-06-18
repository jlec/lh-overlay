# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="SOCKS proxy implementation for python"
HOMEPAGE="http://socksipy.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}/SocksiPy%20${PV}/SocksiPy.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/"

src_install() {
	python_foreach_impl python_domodule socks.py
}
