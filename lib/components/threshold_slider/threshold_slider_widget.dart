import '/components/slider/slider_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'threshold_slider_model.dart';
export 'threshold_slider_model.dart';

class ThresholdSliderWidget extends StatefulWidget {
  const ThresholdSliderWidget({
    super.key,
    this.icon,
    String? label,
    String? value,
    double? percent,
    String? onChange,
  })  : this.label = label ?? 'AQI Danger Level',
        this.value = value ?? '',
        this.percent = percent ?? 0.0,
        this.onChange = onChange ?? '';

  final Widget? icon;
  final String label;
  final String value;
  final double percent;
  final String onChange;

  @override
  State<ThresholdSliderWidget> createState() => _ThresholdSliderWidgetState();
}

class _ThresholdSliderWidgetState extends State<ThresholdSliderWidget> {
  late ThresholdSliderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThresholdSliderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget!.icon!,
                          Text(
                            valueOrDefault<String>(
                              widget!.label,
                              'AQI Danger Level',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Text(
                        widget!.value,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.manrope(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.sliderModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SliderWidget(
                      label: '',
                      labelPresent: false,
                      description: '',
                      descriptionPresent: false,
                      valuePercentage: valueOrDefault<double>(
                        widget!.percent,
                        0.0,
                      ),
                      valueLabel: '',
                      valueLabelPresent: false,
                      step: 0.0,
                      divisions: 0,
                      color: FlutterFlowTheme.of(context).primary,
                      variant: 'Material',
                      disabled: false,
                      showTicks: true,
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
          Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
