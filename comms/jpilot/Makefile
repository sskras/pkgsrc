# $NetBSD: Makefile,v 1.125 2024/05/20 12:59:02 gdt Exp $

DISTNAME=		jpilot-1.8.2
PKGREVISION=		22
CATEGORIES=		comms
#MASTER_SITES=		https://www.jpilot.org/ # withdrawn in favor of github

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://www.jpilot.org/
COMMENT=		Desktop organizer application for the palm pilot

CONFLICTS+=		jpilot-libplugin-[0-9]*

USE_LIBTOOL=		YES
USE_PKGLOCALEDIR=	YES
USE_TOOLS+=		gmake intltool msgfmt pkg-config
USE_LANGUAGES+=		c

GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--with-gtk-prefix="${BUILDLINK_PREFIX.gtk2}"
CONFIGURE_ARGS+=	--with-pilot-prefix="${BUILDLINK_PREFIX.pilot-link-libs}"
BUILDLINK_ABI_DEPENDS.pilot-link-libs+= pilot-link-libs>=0.12.5

LDFLAGS+=		${EXPORT_SYMBOLS_LDFLAGS}

DOCDIR=			${PREFIX}/share/doc/jpilot
INCDIR=			${PREFIX}/include/jpilot
MAN1DIR=		${PREFIX}/${PKGMANDIR}/man1
PLUGINSDIR=		${PREFIX}/lib/jpilot/plugins

.include "../../comms/pilot-link-libs/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../security/libgcrypt/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"

post-extract:
	${RM} -f ${WRKSRC}/po/Makefile.in

INSTALLATION_DIRS=	${DOCDIR} ${INCDIR} ${PLUGINSIDR}

post-install:
	cd ${WRKSRC} && ${INSTALL_DATA} libplugin.h prefs.h ${DESTDIR}${INCDIR}
	${INSTALL_DATA} ${WRKSRC}/BUGS ${DESTDIR}${DOCDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/*.1 ${DESTDIR}${MAN1DIR}
	${TOUCH} ${DESTDIR}${PLUGINSDIR}/.directory

.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
