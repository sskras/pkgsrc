# $NetBSD: Makefile,v 1.338 2024/05/29 16:32:49 adam Exp $

PKGREVISION= 3
.include "Makefile.common"

PKGNAME=	ImageMagick-${DISTVERSION}

MAINTAINER=	adam@NetBSD.org
COMMENT=	Package for display and non-interactive manipulation of images

CONFLICTS=	geomview<1.8.1nb2  # used to have a program named 'animate'

USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake pkg-config:run
CONFIGURE_ARGS+=	--disable-assert
CONFIGURE_ARGS+=	--with-jpeg
CONFIGURE_ARGS+=	--with-xml=yes
CONFIGURE_ARGS+=	--without-perl
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASEDIR}
# http://www.imagemagick.org/discourse-server/viewtopic.php?f=2&t=25475
CONFIGURE_ARGS.NetBSD+=	--disable-openmp
PKGCONFIG_OVERRIDE+=	MagickWand/MagickWand.pc.in
PKGCONFIG_OVERRIDE+=	MagickCore/MagickCore.pc.in
PKGCONFIG_OVERRIDE+=	MagickCore/ImageMagick.pc.in
PKGCONFIG_OVERRIDE+=	Magick++/lib/Magick++.pc.in

TEST_TARGET=		check

FORCE_C_STD=	c99

.include "options.mk"

# Avoid compiler bug on "mipsel" (cobalt?)
.if ${MACHINE_ARCH} == "mipsel"
CFLAGS+=		-O
.endif

LDFLAGS.SunOS+=		-lsendfile

PKG_SYSCONFSUBDIR=	ImageMagick-${IM_MAJOR_LIB_VER}
EGDIR=			${PREFIX}/share/examples/ImageMagick
CONF_FILES+=		${EGDIR}/colors.xml ${PKG_SYSCONFDIR}/colors.xml
CONF_FILES+=		${EGDIR}/delegates.xml ${PKG_SYSCONFDIR}/delegates.xml
CONF_FILES+=		${EGDIR}/log.xml ${PKG_SYSCONFDIR}/log.xml
CONF_FILES+=		${EGDIR}/mime.xml ${PKG_SYSCONFDIR}/mime.xml
CONF_FILES+=		${EGDIR}/thresholds.xml ${PKG_SYSCONFDIR}/thresholds.xml
CONF_FILES+=		${EGDIR}/type-dejavu.xml ${PKG_SYSCONFDIR}/type-dejavu.xml
CONF_FILES+=		${EGDIR}/type-ghostscript.xml ${PKG_SYSCONFDIR}/type-ghostscript.xml
CONF_FILES+=		${EGDIR}/type-windows.xml ${PKG_SYSCONFDIR}/type-windows.xml
CONF_FILES+=		${EGDIR}/type.xml ${PKG_SYSCONFDIR}/type.xml

SUBST_CLASSES+=		fix-cfg
SUBST_STAGE.fix-cfg=	pre-configure
SUBST_MESSAGE.fix-cfg=	Fixing configure.xml.
SUBST_FILES.fix-cfg=	config/configure.xml.in
SUBST_VARS.fix-cfg=	CONFIGURE_ARGS

SUBST_CLASSES+=		fix-etc
SUBST_STAGE.fix-etc=	pre-configure
SUBST_MESSAGE.fix-etc=	Handle configuration files.
SUBST_FILES.fix-etc=	Makefile.in
SUBST_SED.fix-etc=	-e 's,^configlibdir =.*,configlibdir = $$(DATA_DIR)/examples/ImageMagick,'

SUBST_CLASSES+=			fix-tools
SUBST_STAGE.fix-tools=		pre-install
SUBST_MESSAGE.fix-tools=	Unwrapping tools path in delegate paths.
SUBST_FILES.fix-tools=		config/delegates.xml
SUBST_SED.fix-tools=		-e 's,${TOOLS_DIR},,g'

SUBST_CLASSES+=		fix-pc
SUBST_STAGE.fix-pc=	pre-configure
SUBST_MESSAGE.fix-pc=	Unwrapping pkg-config path in installed helper tools.
SUBST_FILES.fix-pc+=	Magick++/bin/Magick++-config.in
SUBST_FILES.fix-pc+=	MagickCore/MagickCore-config.in
SUBST_FILES.fix-pc+=	MagickWand/MagickWand-config.in
SUBST_SED.fix-pc=	-e 's,@PKG_CONFIG@,pkg-config,g'

# failed to convert strong functions and variables: Invalid type identifier
CTF_FILES_SKIP+=	lib/libMagickCore-7.Q16HDRI.so.*
CTF_FILES_SKIP+=	lib/libMagickWand-7.Q16HDRI.so.*

post-install:
	${INSTALL_DATA} ${WRKSRC}/config/policy*xml ${DESTDIR}${EGDIR}

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../archivers/xz/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../graphics/libwebp/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../math/fftw/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
