# $NetBSD: Makefile,v 1.4 2024/04/30 06:24:47 wen Exp $

DISTNAME=	Future-IO-0.15
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/P/PE/PEVANS/}

MAINTAINER=	wen@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Future
COMMENT=	Future-returning IO methods
LICENSE=	${PERL5_LICENSE}

DEPENDS=	p5-Future>=0:../../devel/p5-Future \
		p5-Struct-Dumb>=0:../../devel/p5-Struct-Dumb

TEST_DEPENDS+=	p5-Test2-Suite-[0-9]*:../../devel/p5-Test2-Suite \
		p5-Test-Future-IO-Impl-[0-9]*:../../devel/p5-Test-Future-IO-Impl \
		p5-Test-ExpectAndCheck-[0-9]*:../../devel/p5-Test-ExpectAndCheck

USE_LANGUAGES=		#empty
PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Future/IO/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
