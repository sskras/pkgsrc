# $NetBSD: buildlink3.mk,v 1.10 2024/05/20 19:38:25 adam Exp $

BUILDLINK_TREE+=	qt6-qtcharts

.if !defined(QT6_QTCHARTS_BUILDLINK3_MK)
QT6_QTCHARTS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qt6-qtcharts+=	qt6-qtcharts>=6.4.1
BUILDLINK_ABI_DEPENDS.qt6-qtcharts+=	qt6-qtcharts>=6.6.3nb1
BUILDLINK_PKGSRCDIR.qt6-qtcharts?=	../../graphics/qt6-qtcharts

.include "../../lang/qt6-qtdeclarative/buildlink3.mk"
.include "../../multimedia/qt6-qtmultimedia/buildlink3.mk"
.include "../../x11/qt6-qtbase/buildlink3.mk"
.endif	# QT6_QTCHARTS_BUILDLINK3_MK

BUILDLINK_TREE+=	-qt6-qtcharts
