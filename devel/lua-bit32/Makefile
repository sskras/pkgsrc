# $NetBSD: Makefile,v 1.5 2024/04/17 10:38:34 wiz Exp $

# Keep versioning in sync with the luarocks rockspec.
DISTNAME=	lua-compat53-0.9
PKGNAME=	${LUA_PKGPREFIX}-bit32-5.3.5
CATEGORIES=	devel lua
MASTER_SITES=	${MASTER_SITE_GITHUB:=keplerproject/}
GITHUB_PROJECT=	lua-compat-5.3
GITHUB_TAG=	v${DISTNAME:S/^lua-compat53-//1}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://luarocks.org/modules/siffiejoe/bit32
COMMENT=	Lua 5.2 bit manipulation library
LICENSE=	mit

CONFLICTS+=	lua[0-9]*-bitlib-[0-9]*
SUPERSEDES+=	lua[0-9]*-bitlib-[0-9]*

INSTALLATION_DIRS+=	${LUA_CDIR}

pre-build:
	${CP} -f ${FILESDIR}/Makefile ${WRKSRC}/Makefile

do-install:
	${INSTALL_LIB} ${WRKSRC}/bit32.so \
		${DESTDIR}${PREFIX}/${LUA_CDIR}/bit32.so

do-test:
	cd ${WRKSRC}/tests && LUA_CPATH=${WRKSRC}/?.so \
	    ${LUA_INTERPRETER} test-bit32.lua

.include "../../lang/lua/module.mk"
.include "../../mk/bsd.pkg.mk"
