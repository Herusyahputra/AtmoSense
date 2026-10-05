import '/components/threshold_slider/threshold_slider_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group2_widget.dart' show SettingsGroup2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroup2Model extends FlutterFlowModel<SettingsGroup2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for ThresholdSlider.
  late ThresholdSliderModel thresholdSliderModel1;
  // Model for ThresholdSlider.
  late ThresholdSliderModel thresholdSliderModel2;
  // Model for ThresholdSlider.
  late ThresholdSliderModel thresholdSliderModel3;

  @override
  void initState(BuildContext context) {
    thresholdSliderModel1 = createModel(context, () => ThresholdSliderModel());
    thresholdSliderModel2 = createModel(context, () => ThresholdSliderModel());
    thresholdSliderModel3 = createModel(context, () => ThresholdSliderModel());
  }

  @override
  void dispose() {
    thresholdSliderModel1.dispose();
    thresholdSliderModel2.dispose();
    thresholdSliderModel3.dispose();
  }
}
