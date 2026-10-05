import '/backend/api_requests/api_calls.dart';
import '/components/info_row_widget.dart';
import '/components/local_nav_item/local_nav_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'location1_widget.dart' show Location1Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Location1Model extends FlutterFlowModel<Location1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for InfoRow.
  late InfoRowModel infoRowModel1;
  // Model for InfoRow.
  late InfoRowModel infoRowModel2;
  // Model for InfoRow.
  late InfoRowModel infoRowModel3;
  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel1;
  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel2;
  // Model for LocalNavItem.
  late LocalNavItemModel localNavItemModel3;

  @override
  void initState(BuildContext context) {
    infoRowModel1 = createModel(context, () => InfoRowModel());
    infoRowModel2 = createModel(context, () => InfoRowModel());
    infoRowModel3 = createModel(context, () => InfoRowModel());
    localNavItemModel1 = createModel(context, () => LocalNavItemModel());
    localNavItemModel2 = createModel(context, () => LocalNavItemModel());
    localNavItemModel3 = createModel(context, () => LocalNavItemModel());
  }

  @override
  void dispose() {
    infoRowModel1.dispose();
    infoRowModel2.dispose();
    infoRowModel3.dispose();
    localNavItemModel1.dispose();
    localNavItemModel2.dispose();
    localNavItemModel3.dispose();
  }
}
