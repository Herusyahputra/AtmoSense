import '/components/hardware_card/hardware_card_widget.dart';
import '/components/local_nav_item/local_nav_item_widget.dart';
import '/components/status_row/status_row_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'device_information_widget.dart' show DeviceInformationWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DeviceInformationModel extends FlutterFlowModel<DeviceInformationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel1;
  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel2;
  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel3;
  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel4;
  // Model for StatusRow.
  late StatusRowModel statusRowModel1;
  // Model for StatusRow.
  late StatusRowModel statusRowModel2;
  // Model for HardwareCard.
  late HardwareCardModel hardwareCardModel1;
  // Model for HardwareCard.
  late HardwareCardModel hardwareCardModel2;
  // Model for HardwareCard.
  late HardwareCardModel hardwareCardModel3;
  // Model for HardwareCard.
  late HardwareCardModel hardwareCardModel4;

  @override
  void initState(BuildContext context) {
    localNavItemModel1 = createModel(context, () => LocalNavItemModel());
    localNavItemModel2 = createModel(context, () => LocalNavItemModel());
    localNavItemModel3 = createModel(context, () => LocalNavItemModel());
    localNavItemModel4 = createModel(context, () => LocalNavItemModel());
    statusRowModel1 = createModel(context, () => StatusRowModel());
    statusRowModel2 = createModel(context, () => StatusRowModel());
    hardwareCardModel1 = createModel(context, () => HardwareCardModel());
    hardwareCardModel2 = createModel(context, () => HardwareCardModel());
    hardwareCardModel3 = createModel(context, () => HardwareCardModel());
    hardwareCardModel4 = createModel(context, () => HardwareCardModel());
  }

  @override
  void dispose() {
    localNavItemModel1.dispose();
    localNavItemModel2.dispose();
    localNavItemModel3.dispose();
    localNavItemModel4.dispose();
    statusRowModel1.dispose();
    statusRowModel2.dispose();
    hardwareCardModel1.dispose();
    hardwareCardModel2.dispose();
    hardwareCardModel3.dispose();
    hardwareCardModel4.dispose();
  }
}
