# $NetBSD: Makefile,v 1.6 2024/04/20 20:32:45 pin Exp $

DISTNAME=	piratebay-0.1.9
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=tsirysndr/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://github.com/tsirysndr/piratebay/
COMMENT=	CLI tool to search for torrents on piratebay
LICENSE=	mit

.include "cargo-depends.mk"

.include "../../lang/rust/cargo.mk"
.include "../../mk/bsd.pkg.mk"
