# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{8..9})
PYTHON_REQ_USE="threads(+)"

inherit python-any-r1
inherit waf-utils
if [ "${PV}" == "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/glmark2/glmark2.git"
else
	SRC_URI="https://github.com/glmark2/glmark2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS=" ~amd64 ~arm64 ~x86"
fi

DESCRIPTION="glmark2 is an OpenGL 2.0 and ES 2.0 benchmark "
HOMEPAGE="https://github.com/glmark2/glmark2"

LICENSE="GPL-3"
SLOT="0"
IUSE="wayland gles2"

RDEPEND="
	media-libs/mesa[gles2?,wayland?]
	media-libs/libpng
"
DEPEND="
	${PYTHON_DEPS}
	${RDEPEND}
"
FLAVORS="drm-gl,x11-gl"

src_configure() {
	if use gles2; then
		FLAVORS+=",drm-glesv2,x11-glesv2"
		if use wayland; then
			FLAVORS+=",wayland-glesv2"
		fi
	fi

	if use wayland; then
		FLAVORS+=",wayland-gl"
	fi

	waf-utils_src_configure "--with-flavors=${FLAVORS}"
}
