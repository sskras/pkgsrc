# $NetBSD: Makefile,v 1.49 2024/05/29 16:32:51 adam Exp $

# XXX: meta-pkgs/mate/Makefile.common includes pyversion.mk which sets the
# python version too early and clashes with PYTHON_VERSIONS_INCOMPATIBLE
# from libpeas bl3, so we include it early to ensure a valid version is
# chosen.  This is not ideal, please fix it properly at some point.
PKGREVISION= 8
.include "../../devel/libpeas/buildlink3.mk"
.include "../../meta-pkgs/mate/Makefile.common"

DISTNAME=	eom-${VERSION:R}.1
CATEGORIES=	graphics

COMMENT=	Eye of MATE: an image viewing and cataloging program

PKGCONFIG_OVERRIDE+=	data/eom.pc.in

BUILDLINK_TRANSFORM.SunOS+=	rm:-lutil

.include "options.mk"

.include "../../devel/glib2/schemas.mk"

.include "../../x11/mate-desktop/buildlink3.mk"
.include "../../databases/shared-mime-info/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
