# $NetBSD: Makefile,v 1.51 2024/04/07 07:35:10 wiz Exp $
#

DISTNAME=	selectwm-0.4.1
PKGREVISION=	44
CATEGORIES=	wm
MASTER_SITES=	http://ordiluc.net/selectwm/

MAINTAINER=	tonio@NetBSD.org
HOMEPAGE=	https://ordiluc.net/selectwm/
COMMENT=	Simple GTK2 application to select window manager

USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--without-included-gettext

.include "../../x11/gtk2/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/libgetopt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
