# $NetBSD: Makefile,v 1.131 2024/04/07 07:33:29 wiz Exp $

DISTNAME=	easytag-2.4.3
PKGREVISION=	19
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/easytag/2.4/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://projects.gnome.org/easytag/
COMMENT=	GTK+ tag editor for MP3, Ogg Vorbis files, and others
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=		yes
USE_LANGUAGES=		c c++
USE_PKGLOCALEDIR=	yes
USE_TOOLS+=		gmake intltool pkg-config xgettext
USE_TOOLS+=		itstool

.include "options.mk"

.include "../../audio/id3lib/buildlink3.mk"
.include "../../audio/libid3tag/buildlink3.mk"
BUILDLINK_API_DEPENDS.taglib+=	taglib>=1.9.1
.include "../../audio/taglib/buildlink3.mk"
.include "../../devel/glib2/schemas.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
