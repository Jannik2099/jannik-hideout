# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Clevis is a pluggable framework for automated decryption"
HOMEPAGE="https://github.com/latchset/clevis"
SRC_URI="https://github.com/latchset/clevis/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+tpm"

DEPEND="
	dev-libs/jose
	dev-libs/openssl:0=
	dev-libs/libpwquality
	dev-libs/luksmeta
	tpm? ( app-crypt/tpm2-tools )
"
RDEPEND="
	${DEPEND}
	app-misc/jq"
BDEPEND="
	app-text/asciidoc
"

PATCHES=(
"${FILESDIR}/clevis-fix-systemddir.patch"
)
