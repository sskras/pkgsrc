# $NetBSD: Makefile,v 1.71 2024/05/29 16:32:43 adam Exp $

VERSION=	1.5.1
DISTNAME=	solarus-${VERSION}-src
PKGNAME=	${DISTNAME:S/-src//1}
PKGREVISION=	47
CATEGORIES=	games
MASTER_SITES=	http://www.solarus-games.org/downloads/solarus/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.solarus-games.org/solarus/
COMMENT=	Open-source Zelda-like 2D game engine licensed under GPL
LICENSE=	gnu-gpl-v3

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

WRKSRC=		${WRKDIR}/solarus-${VERSION}
USE_CMAKE=	yes
USE_LANGUAGES=	c c++

LDFLAGS.SunOS+=	-lsocket -lnsl

USE_CXX_FEATURES+=	c++11

.include "options.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../devel/physfs/buildlink3.mk"
.include "../../audio/libmodplug/buildlink3.mk"
.include "../../multimedia/libogg/buildlink3.mk"
.include "../../audio/libvorbis/buildlink3.mk"
.include "../../audio/openal-soft/buildlink3.mk"
BUILDLINK_API_DEPENDS.SDL2_ttf+=	SDL2_ttf>=2.0.12
.include "../../fonts/SDL2_ttf/buildlink3.mk"
BUILDLINK_API_DEPENDS.SDL2_image+=	SDL2_image>=2.0.0
.include "../../graphics/SDL2_image/buildlink3.mk"
BUILDLINK_API_DEPENDS.SDL2+=	SDL2>=2.0.1
.include "../../devel/SDL2/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
