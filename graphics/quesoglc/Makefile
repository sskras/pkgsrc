# $NetBSD: Makefile,v 1.20 2024/05/02 20:04:32 triaxx Exp $
#

DISTNAME=	quesoglc-0.7.1-free
PKGNAME=	${DISTNAME:S/-free$//}
PKGREVISION=	15
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=quesoglc/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://quesoglc.sourceforge.net/
COMMENT=	Free implementation of the OpenGL Character Renderer (GLC)
LICENSE=	gnu-lgpl-v2.1

WRKSRC=		${WRKDIR}/quesoglc-0.7.1
GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	pkg-config gmake
USE_LIBTOOL=	yes

CONFIGURE_ARGS+=	--disable-executables

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--with-apple-opengl-framework
.else
.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../graphics/glew/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../graphics/freeglut/buildlink3.mk"
.endif

.include "../../converters/fribidi/buildlink3.mk"
.include "../../fonts/fontconfig/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
