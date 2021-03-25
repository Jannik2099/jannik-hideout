# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="LUKSMeta is a simple library for storing metadata in the LUKSv1 header."
HOMEPAGE="https://github.com/latchset/luksmeta"
SRC_URI="https://github.com/latchset/luksmeta/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
	eautomake
}
