# $NetBSD: Makefile,v 1.57 2024/05/29 16:31:35 adam Exp $
#

DISTNAME=	gammu-1.41.0
PKGREVISION=	15
CATEGORIES=	comms
MASTER_SITES=	https://dl.cihar.com/gammu/releases/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wammu.eu/gammu/
COMMENT=	Command line utility and library to work with mobile phones
LICENSE=	gnu-gpl-v2

# cmake tests for it; unclear for what it would be used
#TOOL_DEPENDS+=	doxygen-[0-9]*:../../devel/doxygen
# for gammu-config
DEPENDS+=		dialog-[0-9]*:../../misc/dialog

USE_CMAKE=	yes
CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=	-DINSTALL_MAN_DIR:STRING=${PKGMANDIR}
# make sure some optional dependencies are not found:
CMAKE_ARGS+=	-DWITH_MySQL:BOOL=OFF
CMAKE_ARGS+=	-DWITH_Postgres:BOOL=OFF
CMAKE_ARGS+=	-DWITH_LibDBI:BOOL=OFF
CMAKE_ARGS+=	-DWITH_Glib:BOOL=OFF
# avoid installing bash completion scripts
CMAKE_ARGS+=	-DBASH_BIN:FILEPATH=
#CMAKE_ARGS+=	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON

# silence warning
CMAKE_ARGS+=	-Wno-dev
CMAKE_ARGS+=	-DINSTALL_DOC=ON

USE_LANGUAGES=	c c++
USE_TOOLS+=	bash:run msgfmt
REPLACE_BASH=	utils/gammu-config utils/jadmaker

CFLAGS.SunOS+=	-Du_int8_t=uint8_t -Du_int32_t=uint32_t

# needed because of https://bugs.cihar.com/view.php?id=908
BUILDLINK_TRANSFORM+=	rm:-Werror

SUBST_CLASSES+=			cmakelists
SUBST_STAGE.cmakelists=		pre-configure
SUBST_MESSAGE.cmakelists=	Fixing CMakeLists.txt
SUBST_FILES.cmakelists=		CMakeLists.txt
SUBST_SED.cmakelists=		-e 's/LIB_SUFFIX "64"/LIB_SUFFIX ""/'

.include "../../databases/unixodbc/buildlink3.mk"
.include "../../devel/libusb1/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
