# $NetBSD: Makefile,v 1.111 2024/05/29 16:31:31 adam Exp $

COMMENT=		Multi-protocol GTK instant messaging client
PKGREVISION=		9

.include		"../../chat/libpurple/Makefile.common"

USE_TOOLS+=		msgfmt intltool

CONFIGURE_ARGS+=	--enable-gtkui
CONFIGURE_ARGS+=	--disable-gevolution

BUILD_DIRS=		pidgin
INSTALLATION_DIRS=	share/applications

# includes "Arguments to configure" as string
CHECK_WRKREF_SKIP=	bin/pidgin

.include "options.mk"

pre-build:
#	XXX Find a cleaner way.
	${TEST} -r ${WRKSRC}/libpurple/libpurple.la || \
	  ln -s ${BUILDLINK_DIR}/lib/libpurple.la ${WRKSRC}/libpurple/.

INSTALL_DIRS=		pidgin doc

# was an option, but is not as of 2.10.12
.include "../../multimedia/gstreamer1/buildlink3.mk"
.include "../../multimedia/gst-plugins1-base/buildlink3.mk"
.include "../../chat/farstream/buildlink3.mk"

.include "../../chat/libpurple/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libidn/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
