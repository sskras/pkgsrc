# $NetBSD: Makefile,v 1.48 2024/05/29 16:34:55 adam Exp $

DISTNAME=		rekonq-2.4.2
PKGREVISION=		43
CATEGORIES=		www kde
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=rekonq/2.0/}
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		markd@NetBSD.org
HOMEPAGE=		https://rekonq.kde.org/
COMMENT=		web browser for KDE based on WebKit
LICENSE=		gnu-gpl-v2

TOOL_DEPENDS+=	automoc4>=0.9.87:../../devel/automoc4

USE_TOOLS+=		msgfmt
TOOLS_BROKEN+=		perl
USE_LANGUAGES=		c c++

CMAKE_ARGS+=		-DCMAKE_DISABLE_FIND_PACKAGE_Soprano=TRUE
CMAKE_ARGS+=		-DCMAKE_DISABLE_FIND_PACKAGE_NepomukCore=TRUE

.include "../../meta-pkgs/kde4/kde4.mk"
.include "../../security/qca2/buildlink3.mk"
.include "../../security/qoauth/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/libkactivities4/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
