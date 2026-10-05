import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/dashboard_nav_item/dashboard_nav_item_widget.dart';
import '/components/nav_item/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'prediction_widget.dart' show PredictionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PredictionModel extends FlutterFlowModel<PredictionWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavItem.
  late NavItemModel navItemModel1;
  // Model for LocationNavItem.
  late DashboardNavItemModel locationNavItemModel;
  // Model for NavItem.
  late NavItemModel navItemModel2;
  // Model for NavItem.
  late NavItemModel navItemModel3;

  @override
  void initState(BuildContext context) {
    navItemModel1 = createModel(context, () => NavItemModel());
    locationNavItemModel = createModel(context, () => DashboardNavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    navItemModel1.dispose();
    locationNavItemModel.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
  }
}
