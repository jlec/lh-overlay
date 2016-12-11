# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )

inherit distutils-r1

DESCRIPTION="A mail content scanner for postfix written in python"
HOMEPAGE="http://fuglu.org/"
SRC_URI="https://github.com/gryphius/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="clamav database spamassassin test"

CDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
		!dev-python/filemagic[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/rarfile[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/ipaddress[${PYTHON_USEDEP}]' python2_7)
		$(python_gen_cond_dep 'dev-python/ipaddr[${PYTHON_USEDEP}]' python3_4)
		dev-python/pyspf[${PYTHON_USEDEP}]
		database? ( dev-python/sqlalchemy[${PYTHON_USEDEP}] )"

DEPEND="${CDEPEND}
		test? (
			dev-python/nose[${PYTHON_USEDEP}]
			dev-python/lxml[${PYTHON_USEDEP}]
			dev-python/sqlalchemy[${PYTHON_USEDEP}]
		)"

RDEPEND="${CDEPEND}
	clamav? ( app-antivirus/clamav )
	spamassassin? ( mail-filter/spamassassin )"

S="${WORKDIR}/${P}/${PN}"

python_test() {
	nosetests tests/unit/ || die "Test failed with ${EPYTHON}"
}
