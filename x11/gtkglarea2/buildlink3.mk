# $NetBSD: buildlink3.mk,v 1.47 2024/04/07 07:35:19 wiz Exp $

BUILDLINK_TREE+=	gtkglarea2

.if !defined(GTKGLAREA2_BUILDLINK3_MK)
GTKGLAREA2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gtkglarea2+=	gtkglarea2>=2.0.1
BUILDLINK_ABI_DEPENDS.gtkglarea2+=	gtkglarea2>=2.1.0nb6
BUILDLINK_PKGSRCDIR.gtkglarea2?=	../../x11/gtkglarea2

.include "../../graphics/MesaLib/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif	# GTKGLAREA2_BUILDLINK3_MK

BUILDLINK_TREE+=	-gtkglarea2
