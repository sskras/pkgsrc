# $NetBSD: Makefile,v 1.31 2024/04/07 07:34:41 wiz Exp $

PKGREVISION= 5
.include "../../meta-pkgs/xfce4/Makefile.common"

VERSION=	0.7.2
DISTNAME=	xfce4-calculator-plugin-${VERSION}
CATEGORIES=	misc
MASTER_SITES=	http://archive.xfce.org/src/panel-plugins/xfce4-calculator-plugin/${VERSION:R}/

HOMEPAGE=	https://goodies.xfce.org/projects/panel-plugins/xfce4-calculator-plugin
COMMENT=	Xfce calculator plugin

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
