# $NetBSD: Makefile,v 1.12 2024/04/28 00:34:19 wen Exp $

DISTNAME=	HTTP-Tinyish-0.19
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=HTTP/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/HTTP-Tinyish
COMMENT=	HTTP::Tiny compatible HTTP client wrappers
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-File-Which-[0-9]*:../../devel/p5-File-Which
DEPENDS+=	p5-IPC-Run3-[0-9]*:../../devel/p5-IPC-Run3

PERL5_PACKLIST=	auto/HTTP/Tinyish/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
