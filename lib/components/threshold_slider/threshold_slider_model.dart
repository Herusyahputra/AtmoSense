import '/components/slider/slider_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'threshold_slider_widget.dart' show ThresholdSliderWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThresholdSliderModel extends FlutterFlowModel<ThresholdSliderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Slider.
  late SliderModel sliderModel;

  @override
  void initState(BuildContext context) {
    sliderModel = createModel(context, () => SliderModel());
  }

  @override
  void dispose() {
    sliderModel.dispose();
  }
}
