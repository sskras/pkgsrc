# $NetBSD: Makefile,v 1.32 2024/04/24 22:02:10 js Exp $

DISTNAME=	element-v${PKGVERSION_NOREV}
PKGNAME=	element-web-1.11.65
CATEGORIES=	chat
MASTER_SITES=	${MASTER_SITE_GITHUB:=vector-im/}
GITHUB_RELEASE=	v${PKGVERSION_NOREV}

# GPG key:
#   https://packages.riot.im/element-release-key.asc
#   712B FBEE 92DC A452 52DB  17D7 C7BE 97EF A179 B100
#   
# GPG signature:
#   https://github.com/vector-im/element-web/releases/download/v${PKGVERSION_NOREV}/element-v${PKGVERSION_NOREV}.tar.gz.asc

MAINTAINER=	js@NetBSD.org
HOMEPAGE=	https://element.io/
COMMENT=	Matrix web client
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/element-v${PKGVERSION_NOREV}
USE_LANGUAGES=	# none
USE_TOOLS+=	pax
NO_BUILD=	yes

INSTALLATION_DIRS+=	share/element-web

do-install:
	cd ${WRKSRC} && pax -rw . ${DESTDIR}${PREFIX}/share/element-web

.include "../../mk/bsd.pkg.mk"
