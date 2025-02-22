# $NetBSD: Makefile,v 1.316 2024/06/07 19:41:31 ryoon Exp $

DISTNAME=	thunderbird-${TB_VER}.source
PKGNAME=	thunderbird-${TB_VER}
TB_VER=		115.11.1
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_MOZILLA:=thunderbird/releases/${TB_VER}/source/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.thunderbird.net/en-US/
COMMENT=	Organize, secure and customize your mail
LICENSE=	mpl-1.1

# As of 2023-08 on netbsd-10 amd64, this package required 22G of space
# in WRKDIR (noted because it is egregiously and unexpectedly large,
# overflowing even a biggish tmpfs).

USE_TOOLS+=	unzip pax
WRKSRC=		${WRKDIR}/${DISTNAME:S/.source//}
MOZILLA_DIR=	# empty
PLIST_SRC+=	${PLIST_SRC_DFLT}

DEPENDS+=	libotr-[0-9]*:../../chat/libotr

ALL_ENV+=	MOZ_APP_NAME=${MOZILLA_NAME}

CONFIG_GUESS_OVERRIDE+=	comm/ldap/sdks/c-sdk/config/autoconf/config.guess
CONFIG_SUB_OVERRIDE+=	comm/ldap/sdks/c-sdk/config/autoconf/config.sub

CONFIGURE_ARGS+=	--enable-application=comm/mail
# Disable WebRTC support for Thunderbird unconditionally.
CONFIGURE_ARGS+=	--disable-webrtc
CONFIGURE_ARGS+=	--with-app-name=${MOZILLA_NAME}

NOT_PAX_MPROTECT_SAFE+=	lib/${MOZILLA_NAME}/${MOZILLA_NAME}
NOT_PAX_MPROTECT_SAFE+=	lib/${MOZILLA_NAME}/${MOZILLA_NAME}-bin

LDFLAGS+=		${COMPILER_RPATH_FLAG}${PREFIX}/lib/${MOZILLA_NAME}

# Workaround for https://bugs.llvm.org/show_bug.cgi?id=46366
BUILDLINK_TRANSFORM.NetBSD+=	rm:-fexperimental-new-pass-manager

.include "../../mk/bsd.prefs.mk"

CHECK_WRKREF_SKIP+=	lib/${MOZILLA_NAME}/chrome/toolkit/content/global/buildconfig.html
CHECK_WRKREF_SKIP+=	lib/${MOZILLA_NAME}/chrome/messenger/content/messenger/buildconfig.html

#
# Generate list of subst entries for various .cargo-checksum.json files.  These
# are all handled together in one big substitution to simplify things rather
# than one substitution entry per file, but are kept separate below to ease
# updating and verification.
#

CKSUM_CRATES+=	third_party/rust/libc

# patch-third__party_rust_libc_src_unix_bsd_netbsdlike_netbsd_mod.rs
CKSUMS+=	107a4aa396b8383c66e0ace2f941450b4b69146558cdc4d9fbe33eeab51760f1
CKSUMS+=	3aa5bbc6bec675641c8cb02342022256435ea4f958bfa3832344dba6847ba5ea

#CKSUM_CRATES+=	third_party/rust/getrandom

# patch-third__party_rust_getrandom_src_lib.rs
#CKSUMS+=	0e52f6bde42d7bb05c297ce1c25b9879d61b28caba98f6226a152bff538db6c2
#CKSUMS+=	394425b4ba03c21c494e64d993678f7014575b1e3d590b9ee452b5c2d83ec4ac

SUBST_CLASSES+=		cksum
SUBST_STAGE.cksum=	pre-configure
.for crate in ${CKSUM_CRATES}
SUBST_FILES.cksum+=	${crate}/.cargo-checksum.json
.endfor
.for from to in ${CKSUMS}
SUBST_SED.cksum+=	-e 's,${from},${to},g'
.endfor

SUBST_CLASSES+=		netbsdtag
SUBST_STAGE.netbsdtag=	pre-configure
SUBST_FILES.netbsdtag=	comm/third_party/rnp/src/librekey/key_store_pgp.cpp
SUBST_SED.netbsdtag=	-e 's/__NetBSD__/__NEVER__/'

post-extract:
	${CP} ${FILESDIR}/cubeb_sun.c ${WRKSRC}/media/libcubeb/src/cubeb_sun.c

pre-configure:
	cd ${WRKSRC} && mkdir -p ${OBJDIR}
	cd ${WRKSRC}${MOZILLA_DIR} && autoconf-2.13 old-configure.in > old-configure
	cd ${WRKSRC}${MOZILLA_DIR}/js/src && autoconf-2.13 old-configure.in > old-configure
	touch ${WRKSRC}/.mozconfig

do-build:
# XXX for some reason it doesn't work unless -j is explicitly specified
	${_ULIMIT_CMD} cd ${WRKSRC}/${OBJDIR} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} -j${_MAKE_JOBS_N:U1}

MOZILLA=	thunderbird
MOZILLA_NAME=	${PKGBASE}
post-build:
	${SED} -e 's|@MOZILLA@|${MOZILLA}|g'				\
	  -e 's|@MOZILLA_NAME@|${MOZILLA_NAME}|g'			\
	  -e 's|@MOZILLA_ICON@|${MOZILLA_NAME}.png|g'			\
	  < ${FILESDIR}/desktop.in					\
	  > ${WRKDIR}/desktop

INSTALLATION_DIRS+=	lib/${MOZILLA_NAME}/extensions
INSTALLATION_DIRS+=	share/applications share/pixmaps
post-install:
	${ECHO} '#! /bin/sh' > ${DESTDIR}${PREFIX}/bin/${MOZILLA_NAME}
	${ECHO} '${PREFIX}/lib/${MOZILLA_NAME}/${MOZILLA_NAME} "$$@"' >> \
		${DESTDIR}${PREFIX}/bin/${MOZILLA_NAME}
	${CHMOD} 755 ${DESTDIR}${PREFIX}/bin/${MOZILLA_NAME}
	${INSTALL_DATA} ${WRKDIR}/desktop				\
	  ${DESTDIR}${PREFIX}/share/applications/${MOZILLA_NAME}.desktop
	${INSTALL_DATA} ${WRKSRC}/${OBJDIR}/dist/${MOZILLA_NAME}/chrome/icons/default/default48.png	\
	  ${DESTDIR}${PREFIX}/share/pixmaps/${MOZILLA_NAME}.png

.include "mozilla-common.mk"
.include "options.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
