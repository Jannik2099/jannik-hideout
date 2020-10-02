# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
addr2line-0.13.0
adler-0.2.3
aes-0.3.2
aes-ctr-0.3.0
aes-soft-0.3.3
aesni-0.6.0
ahash-0.3.8
ahash-0.4.3
aho-corasick-0.7.13
alga-0.9.3
alsa-0.2.2
alsa-sys-0.1.2
ansi_term-0.11.0
approx-0.3.2
arc-swap-0.4.7
array-macro-1.0.5
arrayref-0.3.6
arrayvec-0.5.1
atty-0.2.14
autocfg-0.1.7
autocfg-1.0.0
backtrace-0.3.50
base64-0.10.1
base64-0.11.0
base64-0.12.3
base64-0.9.3
bindgen-0.53.3
bit-set-0.5.2
bit-vec-0.6.2
bitflags-0.9.1
bitflags-1.2.1
blake2b_simd-0.5.10
block-0.1.6
block-buffer-0.7.3
block-cipher-trait-0.6.2
block-padding-0.1.5
bumpalo-3.4.0
byte-tools-0.3.1
byteorder-1.3.4
bytes-0.4.12
bytes-0.5.6
cc-1.0.58
cexpr-0.4.0
cfg-if-0.1.10
chrono-0.4.13
clang-sys-0.29.3
clap-2.33.1
clipboard-0.5.0
clipboard-win-2.2.0
cloudabi-0.0.3
const-random-0.1.8
const-random-macro-0.1.8
constant_time_eq-0.1.5
cookie-0.12.0
cookie_store-0.7.0
core-foundation-0.7.0
core-foundation-sys-0.5.1
core-foundation-sys-0.7.0
coreaudio-rs-0.9.1
coreaudio-sys-0.2.5
cpal-0.8.2
crc32fast-1.2.0
crossbeam-channel-0.4.2
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.3
crossbeam-utils-0.7.2
crypto-mac-0.7.0
ctr-0.3.2
cursive-0.15.0
cursive_core-0.1.1
darling-0.10.2
darling-0.9.0
darling_core-0.10.2
darling_core-0.9.0
darling_macro-0.10.2
darling_macro-0.9.0
dbus-0.6.5
derive_builder-0.7.2
derive_builder_core-0.5.0
digest-0.8.1
directories-2.0.2
dirs-sys-0.3.5
dotenv-0.13.0
dtoa-0.4.6
either-1.5.3
encoding_rs-0.8.23
enum-map-0.6.2
enum-map-derive-0.4.3
enumset-1.0.0
enumset_derive-0.5.0
env_logger-0.6.2
error-chain-0.12.2
failure-0.1.8
failure_derive-0.1.8
fake-simd-0.1.2
fern-0.5.9
flate2-1.0.16
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-0.3.5
futures-channel-0.3.5
futures-core-0.3.5
futures-cpupool-0.1.8
futures-executor-0.3.5
futures-io-0.3.5
futures-macro-0.3.5
futures-sink-0.3.5
futures-task-0.3.5
futures-util-0.3.5
generic-array-0.12.3
getrandom-0.1.14
gimli-0.22.0
glob-0.3.0
h2-0.1.26
h2-0.2.6
hashbrown-0.8.1
heck-0.3.1
hermit-abi-0.1.15
hmac-0.7.1
http-0.1.21
http-0.2.1
http-body-0.1.0
http-body-0.3.1
httparse-1.3.4
humantime-1.3.0
hyper-0.11.27
hyper-0.12.35
hyper-0.13.7
hyper-proxy-0.4.1
hyper-tls-0.3.2
hyper-tls-0.4.3
ident_case-1.0.1
idna-0.1.5
idna-0.2.0
indexmap-1.5.0
iovec-0.1.4
itertools-0.8.2
itoa-0.4.6
js-sys-0.3.42
kernel32-sys-0.2.2
language-tags-0.2.2
lazy_static-1.4.0
lazycell-1.2.1
lewton-0.9.4
libc-0.2.72
libdbus-sys-0.2.1
libloading-0.5.2
libm-0.2.1
libpulse-sys-0.0.0
librespot-audio-0.1.1
librespot-core-0.1.1
librespot-metadata-0.1.1
librespot-playback-0.1.1
librespot-protocol-0.1.1
linear-map-1.2.0
lock_api-0.3.4
log-0.3.9
log-0.4.11
malloc_buf-0.0.6
maplit-1.0.2
matches-0.1.8
matrixmultiply-0.2.3
maybe-uninit-2.0.0
memchr-2.3.3
memoffset-0.5.5
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.4.0
mio-0.6.22
mio-uds-0.6.8
miow-0.2.1
nalgebra-0.18.1
native-tls-0.2.4
ncspot-0.2.0
ncurses-5.99.0
net2-0.2.34
nix-0.9.0
nom-5.1.2
num-0.3.0
num-bigint-0.2.6
num-complex-0.2.4
num-complex-0.3.0
num-integer-0.1.43
num-iter-0.1.41
num-rational-0.2.4
num-rational-0.3.0
num-traits-0.2.12
num_cpus-1.13.0
numtoa-0.1.0
objc-0.2.7
objc-foundation-0.1.1
objc_id-0.1.1
object-0.20.0
ogg-0.7.0
once_cell-1.4.0
opaque-debug-0.2.3
openssl-0.10.30
openssl-probe-0.1.2
openssl-sys-0.9.58
owning_ref-0.4.1
pancurses-0.16.1
parking_lot-0.9.0
parking_lot_core-0.6.2
pbkdf2-0.3.0
pdcurses-sys-0.7.1
peeking_take_while-0.1.2
percent-encoding-1.0.1
percent-encoding-2.1.0
pin-project-0.4.22
pin-project-internal-0.4.22
pin-project-lite-0.1.7
pin-utils-0.1.0
pkg-config-0.3.18
portaudio-rs-0.3.2
portaudio-sys-0.1.1
ppv-lite86-0.2.8
proc-macro-hack-0.5.16
proc-macro-nested-0.1.6
proc-macro2-0.4.30
proc-macro2-1.0.18
protobuf-2.16.2
protobuf-codegen-2.16.2
protobuf-codegen-pure-2.16.2
publicsuffix-1.5.4
quick-error-1.2.3
quote-0.6.13
quote-1.0.7
rand-0.3.23
rand-0.4.6
rand-0.5.6
rand-0.6.5
rand-0.7.3
rand_chacha-0.1.1
rand_chacha-0.2.2
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
random-0.12.2
rawpointer-0.2.1
rdrand-0.4.0
redox_syscall-0.1.57
redox_termios-0.1.1
redox_users-0.3.4
regex-1.3.9
regex-syntax-0.6.18
relay-0.1.1
remove_dir_all-0.5.3
reqwest-0.10.6
reqwest-0.9.24
rodio-0.9.0
rspotify-0.10.0
rust-argon2-0.7.0
rustc-demangle-0.1.16
rustc-hash-1.1.0
rustc-serialize-0.3.24
rustc_version-0.2.3
ryu-1.0.5
safemem-0.3.3
schannel-0.1.19
scoped-tls-0.1.2
scopeguard-1.1.0
security-framework-0.4.4
security-framework-sys-0.4.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.114
serde_derive-1.0.114
serde_json-1.0.56
serde_urlencoded-0.5.5
serde_urlencoded-0.6.1
sha-1-0.8.2
sha2-0.8.2
shannon-0.2.0
shell-words-0.1.0
shlex-0.1.1
signal-hook-0.1.16
signal-hook-registry-1.2.0
slab-0.3.0
slab-0.4.2
smallvec-0.2.1
smallvec-0.6.13
socket2-0.3.12
stable_deref_trait-1.2.0
stdweb-0.1.3
stream-cipher-0.3.2
string-0.2.1
strsim-0.7.0
strsim-0.8.0
strsim-0.9.3
strum-0.17.1
strum_macros-0.17.1
subtle-1.0.0
syn-0.15.44
syn-1.0.34
synstructure-0.12.4
take-0.1.0
tempfile-3.1.0
term_size-0.3.2
termcolor-1.1.0
termion-1.5.5
textwrap-0.11.0
thiserror-1.0.20
thiserror-impl-1.0.20
thread_local-1.0.1
time-0.1.43
tinyvec-0.3.3
tokio-0.1.22
tokio-0.2.21
tokio-buf-0.1.1
tokio-codec-0.1.2
tokio-core-0.1.17
tokio-current-thread-0.1.7
tokio-executor-0.1.10
tokio-fs-0.1.7
tokio-io-0.1.13
tokio-proto-0.1.1
tokio-reactor-0.1.12
tokio-service-0.1.0
tokio-socks-0.2.2
tokio-sync-0.1.8
tokio-tcp-0.1.4
tokio-threadpool-0.1.18
tokio-timer-0.2.13
tokio-tls-0.3.1
tokio-udp-0.1.6
tokio-uds-0.2.7
tokio-util-0.3.1
toml-0.5.6
tower-service-0.3.0
tracing-0.1.16
tracing-core-0.1.11
try-lock-0.1.0
try-lock-0.2.3
try_from-0.3.2
typenum-1.12.0
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.13
unicode-segmentation-1.6.0
unicode-width-0.1.8
unicode-xid-0.1.0
unicode-xid-0.2.1
url-1.7.2
url-2.1.1
uuid-0.7.4
vcpkg-0.2.10
vec_map-0.8.2
vergen-3.1.0
version_check-0.9.2
void-1.0.2
want-0.0.4
want-0.2.0
want-0.3.0
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.65
wasm-bindgen-backend-0.2.65
wasm-bindgen-futures-0.4.15
wasm-bindgen-macro-0.2.65
wasm-bindgen-macro-support-0.2.65
wasm-bindgen-shared-0.2.65
web-sys-0.3.42
webbrowser-0.5.4
widestring-0.4.2
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.5.1
winreg-0.6.2
winreg-0.7.0
ws2_32-sys-0.2.1
x11-clipboard-0.3.3
xcb-0.8.2
xi-unicode-0.2.1
"
#for fix-librespot-protobuf.patch
CRATES="${CRATES}
protobuf-2.8.1
protobuf-codegen-2.8.1
protobuf-codegen-pure-2.8.1
"

inherit cargo flag-o-matic

DESCRIPTION="ncurses Spotify client"
HOMEPAGE="https://github.com/hrkfdn/ncspot"
SRC_URI="https://github.com/hrkfdn/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SRC_URI="$(cargo_crate_uris ${CRATES}) ${SRC_URI}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64"
IUSE="pulseaudio portaudio libressl dbus"

DEPEND="
	virtual/rust
	sys-libs/ncurses
	x11-libs/libxcb

	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )

	pulseaudio? ( media-sound/pulseaudio )
	portaudio? ( media-libs/portaudio )

	dbus? ( sys-apps/dbus )
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	rm Cargo.lock || die
	cd "${WORKDIR}" || die
	#patch for https://github.com/librespot-org/librespot/issues/460
	patch -p1 < "${FILESDIR}/fix-librespot-protobuf.patch"
	cd "${S}" || die
	default
}

src_configure() {
	is-flagq "-flto*" && append-flags "-ffat-lto-objects"

	local myfeatures=(
	cursive/pancurses-backend
	share_clipboard
	cursive/pancurses-backend

	$(usex pulseaudio pulseaudio_backend '')
	$(usex portaudio portaudio_backend '')
	$(usex dbus mpris '')
	)
	cargo_src_configure --no-default-features
}
