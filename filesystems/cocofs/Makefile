# $NetBSD: Makefile,v 1.2 2024/04/22 14:44:53 thorpej Exp $
#

COCOFS_VERS=	1.0.1

GITHUB_PROJECT=	cocofs
GITHUB_TAG=	v${COCOFS_VERS}

DISTNAME=	${GITHUB_PROJECT}-${GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${COCOFS_VERS}
CATEGORIES=	filesystems
MASTER_SITES=	${MASTER_SITE_GITHUB:=thorpej/}

MAINTAINER=	thorpej@NetBSD.org
HOMEPAGE=	https://github.com/thorpej/cocofs
COMMENT=	Tool for interacting with TRS-80 Color Computer disk images
LICENSE=	2-clause-bsd

INSTALLATION_DIRS+=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cocofs ${DESTDIR}${PREFIX}/bin

.include "../../mk/bsd.pkg.mk"
