# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo flag-o-matic

CRATES="
ansi_term-0.11.0
atty-0.2.14
autocfg-1.0.0
backtrace-0.3.45
backtrace-sys-0.1.33
bitflags-1.2.1
block-0.1.6
bytesize-1.0.0
cassowary-0.3.0
cc-1.0.50
cfg-if-0.1.10
clap-2.33.0
clipboard-0.5.0
clipboard-win-2.2.0
colorsys-0.5.3
either-1.5.3
enum-iterator-0.5.0
enum-iterator-derive-0.5.0
enum-unitary-0.4.1
failure-0.1.7
failure_derive-0.1.7
hermit-abi-0.1.8
itertools-0.8.2
libc-0.2.67
log-0.4.8
malloc_buf-0.0.6
num-traits-0.2.11
numtoa-0.1.0
objc-0.2.7
objc-foundation-0.1.1
objc_id-0.1.1
proc-macro2-1.0.9
quote-1.0.3
redox_syscall-0.1.56
redox_termios-0.1.1
rustc-demangle-0.1.16
strsim-0.8.0
syn-1.0.16
synstructure-0.12.3
termion-1.5.5
textwrap-0.11.0
tui-0.8.0
unicode-segmentation-1.6.0
unicode-width-0.1.7
unicode-xid-0.2.0
vec_map-0.8.1
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
x11-clipboard-0.3.3
xcb-0.8.2
"

DESCRIPTION="Linux Kernel Manager and Activity Monitor"
HOMEPAGE="https://github.com/orhun/kmon"
SRC_URI="https://github.com/orhun/kmon/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$(cargo_crate_uris ${CRATES}) ${SRC_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="x11-libs/libxcb"
RDEPEND="${DEPEND}
sys-apps/kmod
sys-apps/util-linux"
BDEPEND=""

src_compile() {
	if is-flagq "-flto*"; then
		append-flags -ffat-lto-objects
	fi
	cargo_src_compile
}

src_install() {
debug-print-function ${FUNCNAME} "$@"

	cargo install --path ${CARGO_INSTALL_PATH} \
		--root="${ED}/usr" $(usex debug --debug "") "$@" \
		|| die "cargo install failed"
	rm -f "${ED}/usr/.crates.toml"
	rm -f "${ED}/usr/.crates2.json"

	doman "${S}/man/kmon.8"
}
