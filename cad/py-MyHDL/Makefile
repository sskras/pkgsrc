# $NetBSD: Makefile,v 1.34 2024/05/05 22:35:32 wiz Exp $

.include "Makefile.common"

PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/myhdl/MyHDL/}

MAINTAINER=	pkgsrc-users@NetBSD.org
COMMENT=	Hardware description in Python

TOOL_DEPENDS+=	${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools
TOOL_DEPENDS+=	${PYPKGPREFIX}-wheel-[0-9]*:../../devel/py-wheel

PYTHON_VERSIONS_INCOMPATIBLE=	27

post-install:
	${FIND} ${DESTDIR} -name '*.orig' -exec rm -rf '{}' ';'

.include "../../lang/python/wheel.mk"
.include "../../mk/bsd.pkg.mk"
