# $NetBSD: Makefile,v 1.52 2024/04/02 14:56:47 ktnb Exp $

DISTNAME=		fish-3.7.1
CATEGORIES=		shells
MASTER_SITES=		${MASTER_SITE_GITHUB:=fish-shell/}
GITHUB_PROJECT=		fish-shell
GITHUB_RELEASE=		${PKGVERSION_NOREV}
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.fishshell.com/
COMMENT=		User friendly command line shell for UNIX-like operating systems
LICENSE=		gnu-gpl-v2

USE_LANGUAGES+=		c c++
USE_TOOLS+=		msgfmt
CMAKE_ARGS+=		-DIntl_INCLUDE_DIR=${PREFIX}/include
CMAKE_ARGS+=		-DCMAKE_INSTALL_SYSCONFDIR=${PKG_SYSCONFDIR}
CMAKE_ARGS+=		-DBUILD_DOCS=OFF

PKG_SHELL=		bin/fish

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "NetBSD" && exists(/usr/include/execinfo.h)
CPPFLAGS+=		-DHAVE_BACKTRACE
CPPFLAGS+=		-DHAVE_BACKTRACE_SYMBOLS
CXXFLAGS.NetBSD+=	-fpermissive
LDFLAGS+=		-lexecinfo
.endif

# Upstream intentionally omits open.1 on Darwin, but adds realpath.1
PLIST_VARS+=	open realpath
.if ${OPSYS} == "Darwin"
PLIST.realpath=	yes
.else
PLIST.open=	yes
.endif

EGDIR=		${PREFIX}/share/examples/fish
CONF_FILES=	${EGDIR}/config.fish ${PKG_SYSCONFDIR}/fish/config.fish
OWN_DIRS+=	${PKG_SYSCONFDIR}/fish/functions
OWN_DIRS+=	${PKG_SYSCONFDIR}/fish/conf.d
OWN_DIRS+=	${PKG_SYSCONFDIR}/fish/completions

REPLACE_PYTHON=	share/tools/create_manpage_completions.py

# Avoid C++ <version> issues.
post-extract:
	${MV} ${WRKSRC}/version ${WRKSRC}/version.txt

# wiz 20231109:
# as of fish-3.6.2, the ninja generator has problems in some environments:
# ninja: error: manifest 'build.ninja' still dirty after 100 tries, perhaps system time is not set
CMAKE_GENERATOR=	make

.include "../../mk/curses.buildlink3.mk"
.include "../../devel/cmake/build.mk"
.include "../../devel/pcre2/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/gettext-tools/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/atomic64.mk"
.include "../../mk/bsd.pkg.mk"
