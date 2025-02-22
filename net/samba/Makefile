# $NetBSD: Makefile,v 1.300 2024/05/29 16:34:03 adam Exp $

DISTNAME=	samba-${VERSION}
CATEGORIES=	net
MASTER_SITES=	${SAMBA_MIRRORS:=stable/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.samba.org/
COMMENT=	SMB/CIFS protocol server suite
LICENSE=	gnu-gpl-v3

VERSION=	3.6.25
PKGREVISION=	40

CONFLICTS+=	ja-samba-[0-9]* pam-smbpass-[0-9]* winbind-[0-9]*

USE_GCC_RUNTIME=	yes

FILESDIR=		${PKGDIR}/../../net/samba/files
DESCR_SRC=		${PKGDIR}/../../net/samba/DESCR
MESSAGE_SRC=		${PKGDIR}/../../net/samba/MESSAGE
WRKSRC=			${WRKDIR}/${DISTNAME}/source3
BUILD_DEFS+=		VARBASE

.include "../../mk/bsd.prefs.mk"

PKG_SYSCONFSUBDIR=	samba
SAMBA_ETCDIR?=		${PKG_SYSCONFDIR}
SAMBA_LIBDIR?=		${PREFIX}/lib
SAMBA_LOCKDIR?=		${SAMBA_VARDIR}/run/samba
SAMBA_LOGDIR?=		${SAMBA_VARDIR}/log
SAMBA_MODULESDIR?=	${SAMBA_LIBDIR}/samba
SAMBA_PIDDIR?=		${SAMBA_VARDIR}/run
SAMBA_PRIVATE?=		${SAMBA_ETCDIR}/private
SAMBA_STATEDIR?=	${SAMBA_VARDIR}/db/samba
SAMBA_VARDIR?=		${VARBASE}
WINBINDD_RCD_SCRIPT=	# empty

SMF_INSTANCES=		smbd nmbd

FILES_SUBST+=		SAMBA_ETCDIR=${SAMBA_ETCDIR}
FILES_SUBST+=		SAMBA_LOCKDIR=${SAMBA_LOCKDIR}
FILES_SUBST+=		SAMBA_LOGDIR=${SAMBA_LOGDIR}
FILES_SUBST+=		SAMBA_PIDDIR=${SAMBA_PIDDIR}
FILES_SUBST+=		SAMBA_PRIVATE=${SAMBA_PRIVATE:Q}
FILES_SUBST+=		SAMBA_STATEDIR=${SAMBA_STATEDIR}
FILES_SUBST+=		SAMBA_VARDIR=${SAMBA_VARDIR}
FILES_SUBST+=		WINBINDD_RCD_SCRIPT=${WINBINDD_RCD_SCRIPT:Q}

# mktemp is useful for the replacement adduser script, but don't require
# a full dependency since it's not actually needed by samba.
USE_TOOLS+=		gmake mktemp perl:run pkg-config
REPLACE_PERL=		script/findsmb.in

BROKEN_GETTEXT_DETECTION=	yes
GNU_CONFIGURE=			yes
GNU_CONFIGURE_LIBDIR=		${SAMBA_LIBDIR}
CONFIGURE_ARGS+=		--with-libiconv=${BUILDLINK_PREFIX.iconv}
CONFIGURE_ARGS+=		--with-readline=${BUILDLINK_PREFIX.readline}
CONFIGURE_ARGS+=		--with-configdir=${SAMBA_ETCDIR}
CONFIGURE_ARGS+=		--with-lockdir=${SAMBA_LOCKDIR}
CONFIGURE_ARGS+=		--with-logfilebase=${SAMBA_LOGDIR}
CONFIGURE_ARGS+=		--with-modulesdir=${SAMBA_MODULESDIR}
CONFIGURE_ARGS+=		--with-piddir=${SAMBA_PIDDIR}
CONFIGURE_ARGS+=		--with-privatedir=${SAMBA_PRIVATE:Q}
CONFIGURE_ARGS+=		--with-statedir=${SAMBA_STATEDIR}
CONFIGURE_ARGS+=		--localstatedir=${SAMBA_VARDIR}
CONFIGURE_ARGS+=		--with-mandir=${PREFIX}/${PKGMANDIR}
CONFIGURE_ARGS+=		--with-swatdir=${PREFIX}/share/samba/swat
CONFIGURE_ARGS+=		--enable-external-libtdb

.include "../../net/samba/options.mk"

.if ${SHLIB_TYPE} == "dylib"
PLIST_SUBST+=	LIBEXT=dylib
SAMBA_LIBEXT=	dylib
.else
PLIST_SUBST+=	LIBEXT=so
SAMBA_LIBEXT=	so
.endif

.if !defined(PWD_MKDB)
PWD_MKDB!=	${TYPE} pwd_mkdb 2>&1 | \
		${AWK} '/not found/ { print "pwd_mkdb"; exit } { print $$3 }'
MAKEFLAGS+=	PWD_MKDB=${PWD_MKDB:Q}
.endif
FILES_SUBST+=	MKTEMP=${MKTEMP:Q}
FILES_SUBST+=	PWD_MKDB=${PWD_MKDB:Q}

INSTALLATION_DIRS+=	${DOCDIR} ${EGDIR}

DOCDIR=		share/doc/${PKGBASE}
EGDIR=		share/examples/${PKGBASE}
CONF_FILES=	${PREFIX}/${EGDIR}/smb.conf.default ${SAMBA_ETCDIR}/smb.conf
MAKE_DIRS=	${SAMBA_VARDIR} ${SAMBA_LOGDIR} ${SAMBA_PIDDIR}
OWN_DIRS=	${SAMBA_ETCDIR} ${SAMBA_LOCKDIR} ${SAMBA_STATEDIR}
OWN_DIRS_PERMS=	${SAMBA_PRIVATE} ${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0700
RCD_SCRIPTS+=	samba nmbd smbd ${WINBINDD_RCD_SCRIPT}

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Fixing paths.
SUBST_FILES.paths=	${WRKDIR}/adduser.sh ${WRKDIR}/deluser.sh
SUBST_STAGE.paths=	pre-configure
SUBST_VARS.paths+=	AWK CAT MKTEMP RM PWD_MKDB SH

SUBST_CLASSES+=		def-cfg
SUBST_MESSAGE.def-cfg=	Fixing default config files
SUBST_FILES.def-cfg=	${WRKDIR}/${DISTNAME}/examples/smb.conf.default
SUBST_STAGE.def-cfg=	post-configure
SUBST_VARS.def-cfg=	SAMBA_LOGDIR

post-extract:
	${CP} ${FILESDIR}/adduser.sh ${FILESDIR}/deluser.sh ${WRKDIR}
	for n in tdbbackup.8 tdbdump.8 tdbtool.8; do \
		${RM} ${WRKSRC}/../docs/manpages/$$n; \
		${RM} ${WRKSRC}/../docs/htmldocs/manpages/$$n.html; \
	done

post-install:
	${RMDIR} ${DESTDIR}${PREFIX}/share/samba/swat/js
	${RMDIR} ${DESTDIR}${PREFIX}/share/samba/swat/lang/ja/include
	${RMDIR} ${DESTDIR}${PREFIX}/share/samba/swat/lang/ja/images
	${RMDIR} ${DESTDIR}${PREFIX}/share/samba/swat/lang/ja/js
	${RMDIR} ${DESTDIR}${PREFIX}/share/samba/swat/lang/tr/include
	${RMDIR} ${DESTDIR}${PREFIX}/share/samba/swat/lang/tr/js
	${RMDIR} ${DESTDIR}${SAMBA_MODULESDIR}/gpext
	${RMDIR} ${DESTDIR}${SAMBA_MODULESDIR}/nss_info
	${RMDIR} ${DESTDIR}${SAMBA_MODULESDIR}/pdb
	${RMDIR} ${DESTDIR}${SAMBA_MODULESDIR}/perfcount
	set -e ; cd ${WRKDIR}/${DISTNAME}/docs/registry; for f in *.reg; do \
		${INSTALL_DATA} $${f} ${DESTDIR}${PREFIX}/${DOCDIR}/$${f}; \
	done
	${INSTALL_SCRIPT} ${WRKDIR}/adduser.sh \
		${DESTDIR}${PREFIX}/${EGDIR}/adduser.sh
	${INSTALL_SCRIPT} ${WRKDIR}/deluser.sh \
		${DESTDIR}${PREFIX}/${EGDIR}/deluser.sh
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/examples/LDAP/samba.schema \
		${DESTDIR}${PREFIX}/${EGDIR}
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/examples/smb.conf.default \
		${DESTDIR}${PREFIX}/${EGDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/script/mknissmbpasswd.sh \
		${DESTDIR}${PREFIX}/${EGDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/script/mknissmbpwdtbl.sh \
		${DESTDIR}${PREFIX}/${EGDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/script/mksmbpasswd.sh \
		${DESTDIR}${PREFIX}/${EGDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/script/updatesmbpasswd.sh \
		${DESTDIR}${PREFIX}/${EGDIR}
	${CHMOD} ${SHAREMODE} ${DESTDIR}${PREFIX}/include/*.h
.if ${_OPSYS_SHLIB_TYPE} == "dylib"
	cd ${DESTDIR}${PREFIX}; ${FIND} lib/samba lib/security -name "*.dylib" | while read lib; do \
		install_name_tool -id ${PREFIX}/$${lib} $${lib}; \
	done
.endif

.include "../../net/samba/Makefile.mirrors"

.if ${OPSYS} == "Linux"
.include "../../devel/libuuid/buildlink3.mk"
.endif
.include "../../converters/libiconv/buildlink3.mk"
BUILDLINK_API_DEPENDS.tdb+= tdb>=1.2.10
.include "../../databases/tdb/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/popt/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
