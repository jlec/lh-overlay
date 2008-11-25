JAVA_PKG_IUSE="doc source"

inherit subversion java-pkg-2 java-ant-2

MY_P="${PN}-${PV//./_}"

DESCRIPTION="muCommander is a lightweight file manager featuring a Norton Commander style interface"
HOMEPAGE="http://www.mucommander.com"
ESVN_REPO_URI="https://svn.${PN}.com/${PN}/tags/release_${PV//./_}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=virtual/jdk-1.6*
		dev-java/ant-core
		dev-java/ant-junit
	!app-misc/mucommander-bin"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	subversion_src_unpack
	java-pkg_jar-from --build-only ant-core
}


src_compile() {
	cd lib/include/
	java-pkg_jar-from ant-core
	java-pkg_jar-from ant-junit

	cd "${S}"
	eant nightly
}


src_install() {
	insinto /usr/$(get_libdir)/mucommander/
	doins dist/mucommander.jar

	cat >> "${T}"/mucommander <<- EOF
	#!/bin/bash
	$(which java) -jar /usr/$(get_libdir)/mucommander/mucommander.jar
	EOF

	dobin "${T}"/mucommander
	dodoc readme.txt

	newicon res/images/about.png ${PN}.png
	make_desktop_entry ${PN} "muCommander" ${PN}
}
