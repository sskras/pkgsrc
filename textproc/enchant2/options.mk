# $NetBSD: options.mk,v 1.2 2024/04/30 06:30:24 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.enchant2
PKG_SUPPORTED_OPTIONS=	aspell enchant-zemberek hunspell
# Code also supports the following:
# hspell - Hebrew spelling
# uspell - Yiddish spelling
# voikko - Finnish spelling
PKG_SUGGESTED_OPTIONS=	hunspell

.include "../../mk/bsd.options.mk"

PLIST_VARS+=            aspell
.if !empty(PKG_OPTIONS:Maspell)
CONFIGURE_ARGS+=	--with-aspell
.include "../../textproc/aspell/buildlink3.mk"
PLIST.aspell=		yes
.else
CONFIGURE_ARGS+=	--without-aspell
.endif

PLIST_VARS+=            zemberek
.if !empty(PKG_OPTIONS:Menchant-zemberek)
CONFIGURE_ARGS+=	--with-zemberek
.include "../../sysutils/dbus-glib/buildlink3.mk"
PLIST.zemberek=		yes
.else
CONFIGURE_ARGS+=	--without-zemberek
.endif

PLIST_VARS+=            hunspell
.if !empty(PKG_OPTIONS:Mhunspell)
CONFIGURE_ARGS+=	--with-hunspell
.include "../../textproc/hunspell/buildlink3.mk"
DEPENDS+=		hunspell-en_US-[0-9]*:../../textproc/hunspell-en_US
PLIST.hunspell=		yes
.else
CONFIGURE_ARGS+=	--without-hunspell
.endif
