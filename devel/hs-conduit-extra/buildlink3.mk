# $NetBSD: buildlink3.mk,v 1.13 2024/05/09 01:31:50 pho Exp $

BUILDLINK_TREE+=	hs-conduit-extra

.if !defined(HS_CONDUIT_EXTRA_BUILDLINK3_MK)
HS_CONDUIT_EXTRA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-conduit-extra+=	hs-conduit-extra>=1.3.6
BUILDLINK_ABI_DEPENDS.hs-conduit-extra+=	hs-conduit-extra>=1.3.6nb4
BUILDLINK_PKGSRCDIR.hs-conduit-extra?=		../../devel/hs-conduit-extra

.include "../../devel/hs-async/buildlink3.mk"
.include "../../textproc/hs-attoparsec/buildlink3.mk"
.include "../../devel/hs-conduit/buildlink3.mk"
.include "../../net/hs-network/buildlink3.mk"
.include "../../devel/hs-primitive/buildlink3.mk"
.include "../../devel/hs-resourcet/buildlink3.mk"
.include "../../devel/hs-streaming-commons/buildlink3.mk"
.include "../../sysutils/hs-typed-process/buildlink3.mk"
.include "../../devel/hs-unliftio-core/buildlink3.mk"
.endif	# HS_CONDUIT_EXTRA_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-conduit-extra
