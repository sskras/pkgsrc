# $NetBSD: Makefile,v 1.73 2024/04/07 07:35:31 wiz Exp $

PKGREVISION= 2
.include "../../meta-pkgs/xfce4/Makefile.common"

DISTNAME=	xfce4-notes-plugin-1.11.0
CATEGORIES=	sysutils
MASTER_SITES=	https://archive.xfce.org/src/panel-plugins/xfce4-notes-plugin/1.11/

HOMEPAGE=	https://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin
COMMENT=	Xfce notes plugin

BUILD_DEFS+=		PKG_SYSCONFBASE

LDFLAGS.DragonFly=	-lm -lX11
LDFLAGS.SunOS+=		-lm -lX11

PKG_SYSCONFSUBDIR=	xdg

CONF_FILES=	${XFCE4_EGBASE}/autostart/xfce4-notes-autostart.desktop \
		${PKG_SYSCONFDIR}/autostart/xfce4-notes-autostart.desktop

MAKE_DIRS+=	${XFCE4_EGBASE}/autostart \
		${PKG_SYSCONFDIR}/autostart

.include "../../devel/xfce4-conf/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../x11/libxfce4util/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
