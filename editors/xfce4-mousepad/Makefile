# $NetBSD: Makefile,v 1.80 2024/05/29 16:32:25 adam Exp $

PKGREVISION= 3
.include "../../meta-pkgs/xfce4/Makefile.common"

VERSION=	0.6.2
DISTNAME=	mousepad-${VERSION}
PKGNAME=	xfce4-mousepad-${VERSION}
CATEGORIES=	editors
MASTER_SITES=	https://archive.xfce.org/src/apps/mousepad/${VERSION:R}/

HOMEPAGE=	http://users.xfce.org/~benny/xfce/apps.html
COMMENT=	Xfce text editor

CONFIGURE_ARGS+=	--enable-gtksourceview4

.include "options.mk"

.include "../../devel/gettext-tools/msgfmt-desktop.mk"
.include "../../devel/glib2/schemas.mk"
# Only really required if CSDs are enabled (now disabled by default).
.include "../../graphics/adwaita-icon-theme/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/gtksourceview4/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
