# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_S="${PN}-ruby-${PV}"

inherit ruby-fakegem

DESCRIPTION="Ruby implementation of Extensible Data Notation as defined by Rich Hickey"
HOMEPAGE="https://github.com/relevance/edn-ruby"
SRC_URI="https://github.com/relevance/${PN}-ruby/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend "=dev-ruby/parslet-1.4*"

all_ruby_prepare() {
	epatch "${FILESDIR}"/${PV}-*.patch
}