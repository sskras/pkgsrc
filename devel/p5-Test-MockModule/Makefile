# $NetBSD: Makefile,v 1.35 2024/06/02 02:10:36 wen Exp $

DISTNAME=	Test-MockModule-v0.178.0
PKGNAME=	p5-${DISTNAME:S/v0/0/}
CATEGORIES=	devel perl5 net
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Test-MockModule
COMMENT=	Perl 5 module to override subroutines in a module for unit testing
LICENSE=	gnu-gpl-v3

DEPENDS+=	p5-SUPER-[0-9]*:../../devel/p5-SUPER
TEST_DEPENDS+=	p5-Test-Pod-Coverage-[0-9]*:../../devel/p5-Test-Pod-Coverage
TEST_DEPENDS+=	p5-Test-Pod-[0-9]*:../../devel/p5-Test-Pod
TEST_DEPENDS+=	p5-Test-Warnings-[0-9]*:../../devel/p5-Test-Warnings

USE_LANGUAGES=		# empty
PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/Test/MockModule/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
