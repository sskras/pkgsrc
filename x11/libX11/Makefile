# $NetBSD: Makefile,v 1.76 2024/04/06 05:59:13 wiz Exp $

DISTNAME=		libX11-1.8.9
CATEGORIES=		x11 devel
MASTER_SITES=		${MASTER_SITE_XORG:=lib/}
EXTRACT_SUFX=		.tar.xz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://xorg.freedesktop.org/
COMMENT=		Base X libraries from modular Xorg X11
LICENSE=		mit

USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
USE_TOOLS+=		gmake pkg-config

CONFIGURE_ARGS+=	--disable-specs
PKGCONFIG_OVERRIDE+=	x11.pc.in

CONFIGURE_ENV+=		FILE_MAN_SUFFIX=5

# reallocarray() on NetBSD 9
CPPFLAGS.NetBSD+=	-D_OPENBSD_SOURCE

.include "../../mk/pthread.buildlink3.mk"
CPPFLAGS.OSF1+=		${PTHREAD_CFLAGS} # Required by compiler if including pthread.h
CPPFLAGS.MirBSD+=	${PTHREAD_CFLAGS}
LDFLAGS.MirBSD+=	${PTHREAD_LDFLAGS}
LDFLAGS.OpenBSD+=	${PTHREAD_LDFLAGS}

BUILDLINK_API_DEPENDS.libxcb+=	libxcb>=1.11.1

TOOL_DEPENDS+=		tradcpp-[0-9]*:../../devel/tradcpp
CONFIGURE_ENV+=		ac_cv_path_RAWCPP="${TOOLBASE}/bin/tradcpp -Uunix"

.include "../../mk/bsd.prefs.mk"

.if ${USE_CROSS_COMPILE:U:tl} == yes
CONFIGURE_ENV+=		CC_FOR_BUILD=${NATIVE_CC:Q}
CONFIGURE_ARGS.NetBSD+=	--disable-malloc0returnsnull
CONFIGURE_ARGS+=	\
	--with-keysymdefdir=${_CROSS_DESTDIR}${BUILDLINK_PREFIX.xorgproto}/include/X11

# XXX This needs to match the version of xcb-proto we get for the
# target by buildlink3.
TOOL_DEPENDS+=		xorgproto-[0-9]*:../../x11/xorgproto
.endif

X11_LIB_NAME?=		libX11
.include "../../meta-pkgs/modular-xorg/avoid-duplicate.mk"
.include "../../x11/xorgproto/buildlink3.mk"
.include "../../x11/libXau/buildlink3.mk"
.include "../../x11/libXdmcp/buildlink3.mk"
.include "../../x11/libxcb/buildlink3.mk"
.include "../../x11/xtrans/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
