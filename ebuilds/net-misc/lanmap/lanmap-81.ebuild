# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils

DESCRIPTION="lanmap sits quietly on a network and builds a picture of what it sees"
HOMEPAGE="http://www.parseerror.com/lanmap"
SRC_URI="http://www.parseerror.com/lanmap/rev/lanmap-2006-03-07-rev81.zip"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RDEPEND="net-libs/libpcap
	 media-gfx/graphviz"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${PN}

src_unpack() {

	unpack ${A}

	epatch "${FILESDIR}"/makefile.patch

}

src_compile() {
	cd ${S}
	chmod +x configure
	econf
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	emake prefix="${D}" install
}
