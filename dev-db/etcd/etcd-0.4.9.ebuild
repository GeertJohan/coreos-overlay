#
# Copyright (c) 2014 CoreOS, Inc.. All rights reserved.
# Distributed under the terms of the GNU General Public License v2
# $Header:$
#

EAPI=4
CROS_WORKON_PROJECT="coreos/etcd"
CROS_WORKON_LOCALNAME="etcd"
CROS_WORKON_REPO="git://github.com"
inherit coreos-doc toolchain-funcs cros-workon

if [[ "${PV}" == 9999 ]]; then
    KEYWORDS="~amd64"
else
    CROS_WORKON_COMMIT="9fa3bea5a22265151f0d5063ce38a79c5b5d0271" # v0.4.9
    KEYWORDS="amd64"
fi

DESCRIPTION="etcd"
HOMEPAGE="https://github.com/coreos/etcd"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="1"

DEPEND=">=dev-lang/go-1.2"
RDEPEND="!dev-db/etcd:0"

src_compile() {
	./build
}

src_install() {
	local libexec="libexec/${PN}/internal_versions/${SLOT}"

	exeinto "/usr/${libexec}"
	doexe "${S}/bin/${PN}"
}
