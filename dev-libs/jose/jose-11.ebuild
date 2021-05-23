# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="C-language implementation of Javascript Object Signing and Encryption"
HOMEPAGE="https://github.com/latchset/jose"
SRC_URI="https://github.com/latchset/jose/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-libs/zlib
	dev-libs/jansson
	dev-libs/openssl:=
"
RDEPEND="${DEPEND}"
BDEPEND="app-text/asciidoc"
