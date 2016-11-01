# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} pypy )

inherit distutils-r1 git-r3

EGIT_REPO_URI="git://code.not-your-server.de/django-pypiwik.git"

DESCRIPTION="Django helper application around pypiwik"
HOMEPAGE="https://ercpe.de/projects/django-pypiwik"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/django[${PYTHON_USEDEP}]
			dev-python/pypiwik[${PYTHON_USEDEP}]"
