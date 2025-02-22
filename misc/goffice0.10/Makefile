# $NetBSD: Makefile,v 1.61 2024/05/29 16:33:31 adam Exp $

DISTNAME=		goffice-0.10.53
PKGNAME=		${DISTNAME:S/goffice/goffice0.10/}
PKGREVISION=		10
CATEGORIES=		misc
MASTER_SITES=		${MASTER_SITE_GNOME:=sources/goffice/0.10/}
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://www.gnome.org/
COMMENT=		Library of document-centric objects and utilities
LICENSE=		gnu-gpl-v2

USE_PKGLOCALEDIR=	yes
USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
USE_TOOLS+=		bison gmake intltool msgfmt pkg-config

PKGCONFIG_OVERRIDE+=	libgoffice.pc.in

TEST_TARGET=		check

.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
BUILDLINK_API_DEPENDS.glib2+=	glib2>=2.38.0
.include "../../devel/glib2/buildlink3.mk"
BUILDLINK_API_DEPENDS.libgsf+=	libgsf>=1.14.24
.include "../../devel/libgsf/buildlink3.mk"
BUILDLINK_API_DEPENDS.pango+=	pango>=1.24.0
.include "../../devel/pango/buildlink3.mk"
BUILDLINK_API_DEPENDS.cairo+=	cairo>=1.10.0
.include "../../graphics/cairo/buildlink3.mk"
BUILDLINK_API_DEPENDS.gdk-pibxbuf2+=	gdk-pixbuf2>=2.22.0
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
BUILDLINK_API_DEPENDS.librsvg+=	librsvg>=2.22.0
.include "../../graphics/librsvg/buildlink3.mk"
.include "../../graphics/lasem/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk3+=	gtk3+>=3.8.7
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
