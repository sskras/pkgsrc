# $NetBSD: Makefile,v 1.84 2024/04/15 21:55:23 wiz Exp $

DISTNAME=	putty-0.81
CATEGORIES=	security
MASTER_SITES=	http://the.earth.li/~sgtatham/putty/${PKGVERSION_NOREV}/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.chiark.greenend.org.uk/~sgtatham/putty/
COMMENT=	Free implementation of Telnet and SSH for Win32 and Unix platforms
LICENSE=	mit

USE_CMAKE=	yes
USE_TOOLS+=	perl pkg-config

# error: 'for' loop initial declarations are only allowed in C99 mode
FORCE_C_STD=	c99

#INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

.include "options.mk"

.if ${OPSYS:M*BSD} || ${OPSYS} == "DragonFly" || ${OPSYS} == "Darwin"
CFLAGS+=	-DOMIT_UTMP
.endif

# Unix98 ptys were added some time ago in NetBSD -current,
# so use it if we have the device, otherwise use the old style.
.if !exists(/dev/ptmx)
CFLAGS+=	-DBSD_PTYS
.endif

LDFLAGS.SunOS+=	-lsocket -lnsl
CFLAGS.SunOS+=	-DBSD_COMP
CFLAGS.Darwin+=	-DHAVE_FUTIMES -DHAVE_NO_SETRESUID
CFLAGS.NetBSD+=	-DHAVE_FUTIMES -DHAVE_NO_SETRESUID
CFLAGS.Linux+=	-DHAVE_FUTIMES -DHAVE_NO_SETRESUID
LDFLAGS.Linux+=	-ldl

.include "../../x11/gtk3/buildlink3.mk"
.if ${PKG_BUILD_OPTIONS.gtk3:Mquartz}
BUILDLINK_TRANSFORM+=	rm:-lX11 rm:-lXext
CFLAGS+=		-DOSX_GTK
.endif
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
