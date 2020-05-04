# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.0

EAPI=7

CRATES="
autocfg-1.0.0
cargo-lock-4.0.1
fixedbitset-0.2.0
gumdrop-0.7.0
gumdrop_derive-0.7.0
idna-0.2.0
indexmap-1.3.2
matches-0.1.8
percent-encoding-2.1.0
petgraph-0.5.0
proc-macro2-1.0.12
quote-1.0.4
semver-0.9.0
semver-parser-0.7.0
serde-1.0.106
serde_derive-1.0.106
smallvec-1.4.0
syn-1.0.18
toml-0.5.6
unicode-bidi-0.3.4
unicode-normalization-0.1.12
unicode-xid-0.2.0
url-2.1.1
"

inherit cargo

DESCRIPTION="Self-contained Cargo.lock parser with optional dependency graph analysis"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/rustsec/cargo-lock"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=""
RDEPEND=""

PATCHES="${FILESDIR}/disable-self-V2.patch"

src_prepare() {
	cp "${FILESDIR}/${P}-Cargo.lock" Cargo.lock
	default
}