import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/dashboard_nav_item/dashboard_nav_item_widget.dart';
import '/components/monitor_tile/monitor_tile_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'dart:async';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for DashboardNavItem.
  late DashboardNavItemModel dashboardNavItemModel1;
  // Model for DashboardNavItem.
  late DashboardNavItemModel dashboardNavItemModel2;
  // Model for DashboardNavItem.
  late DashboardNavItemModel dashboardNavItemModel3;
  // Model for DashboardNavItem.
  late DashboardNavItemModel dashboardNavItemModel4;
  // Model for MonitorTile.
  late MonitorTileModel monitorTileModel1;
  // Model for MonitorTile.
  late MonitorTileModel monitorTileModel2;
  // Model for MonitorTile.
  late MonitorTileModel monitorTileModel3;
  // Model for MonitorTile.
  late MonitorTileModel monitorTileModel4;

  @override
  void initState(BuildContext context) {
    dashboardNavItemModel1 =
        createModel(context, () => DashboardNavItemModel());
    dashboardNavItemModel2 =
        createModel(context, () => DashboardNavItemModel());
    dashboardNavItemModel3 =
        createModel(context, () => DashboardNavItemModel());
    dashboardNavItemModel4 =
        createModel(context, () => DashboardNavItemModel());
    monitorTileModel1 = createModel(context, () => MonitorTileModel());
    monitorTileModel2 = createModel(context, () => MonitorTileModel());
    monitorTileModel3 = createModel(context, () => MonitorTileModel());
    monitorTileModel4 = createModel(context, () => MonitorTileModel());
  }

  @override
  void dispose() {
    dashboardNavItemModel1.dispose();
    dashboardNavItemModel2.dispose();
    dashboardNavItemModel3.dispose();
    dashboardNavItemModel4.dispose();
    monitorTileModel1.dispose();
    monitorTileModel2.dispose();
    monitorTileModel3.dispose();
    monitorTileModel4.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
