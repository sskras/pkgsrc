# $NetBSD: Makefile,v 1.19 2024/04/29 07:11:58 wen Exp $

DISTNAME=	Crypt-SMIME-0.30
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/M/MI/MIKAGE/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/pod/Crypt::SMIME
COMMENT=	Perl5 S/MIME message signing, verification, encryption and decryption
LICENSE=	${PERL5_LICENSE}

TOOL_DEPENDS+=	p5-ExtUtils-PkgConfig-[0-9]*:../../devel/p5-ExtUtils-PkgConfig
TOOL_DEPENDS+=	p5-ExtUtils-CChecker-[0-9]*:../../devel/p5-ExtUtils-CChecker
TEST_DEPENDS+=	p5-Test-Exception-[0-9]*:../../devel/p5-Test-Exception

USE_TOOLS+=	pkg-config

PERL5_PACKLIST=	auto/Crypt/SMIME/.packlist

.include "../../security/openssl/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
