# $NetBSD: Makefile,v 1.17 2024/04/17 11:57:36 wiz Exp $

DISTNAME=	rabbiter-2.0.1
PKGREVISION=	2
CATEGORIES=	net ruby
MASTER_SITES=	${MASTER_SITE_RUBYGEMS}
EXTRACT_SUFX=	.gem

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://rabbit-shocker.org/en/rabbiter/
COMMENT=	Twitter client for Rabbit
LICENSE=	gnu-gpl-v2 # or later

DEPENDS+=	${RUBY_PKGPREFIX}-rabbit>=2.0.0:../../graphics/rabbit
DEPENDS+=	${RUBY_PKGPREFIX}-twitter_oauth-[0-9]*:../../security/ruby-twitter_oauth
DEPENDS+=	${RUBY_PKGPREFIX}-twitter-stream>=0.1.16:../../net/ruby-twitter-stream

USE_RUBY_SETUP=		yes
USE_RUBY_SETUP_PKG=	yes

CONFIGURE_ARGS+=	--siteruby=${PREFIX}/${RUBY_VENDORLIB_BASE} \
			--siterubyver=${PREFIX}/${RUBY_VENDORLIB} \
			--siterubyverarch=${PREFIX}/${RUBY_VENDORARCHLIB}

# let locale data to be installed with setup.rb
post-extract:
	${MKDIR} ${WRKSRC}/data
	${MV} ${WRKSRC}/locale ${WRKSRC}/data/locale

.include "../../lang/ruby/modules.mk"
.include "../../mk/bsd.pkg.mk"
