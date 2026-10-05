import '/components/threshold_slider/threshold_slider_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group2_model.dart';
export 'settings_group2_model.dart';

class SettingsGroup2Widget extends StatefulWidget {
  const SettingsGroup2Widget({
    super.key,
    String? title,
    this.draftAqi,
    this.draftPm25,
    this.draftCo,
  }) : this.title = title ?? 'THRESHOLD TRIGGER LEVELS';

  final String title;
  final int? draftAqi;
  final double? draftPm25;
  final double? draftCo;

  @override
  State<SettingsGroup2Widget> createState() => _SettingsGroup2WidgetState();
}

class _SettingsGroup2WidgetState extends State<SettingsGroup2Widget> {
  late SettingsGroup2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          valueOrDefault<String>(
            widget!.title,
            'THRESHOLD TRIGGER LEVELS',
          ),
          style: FlutterFlowTheme.of(context).labelLarge.override(
                font: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                lineHeight: 1.3,
              ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    wrapWithModel(
                      model: _model.thresholdSliderModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: ThresholdSliderWidget(
                        icon: Icon(
                          Icons.speed_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        label: 'AQI Danger Level',
                        value: widget!.draftAqi?.toString(),
                        percent: 0.0,
                        onChange: 'form.set_draft_aqi(value)',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.thresholdSliderModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: ThresholdSliderWidget(
                        icon: Icon(
                          Icons.grain_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        label: 'PM2.5 Limit (µg/m³)',
                        value: widget!.draftPm25?.toString(),
                        percent: 0.0,
                        onChange: 'form.set_draft_pm25(value)',
                      ),
                    ),
                    wrapWithModel(
                      model: _model.thresholdSliderModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: ThresholdSliderWidget(
                        icon: Icon(
                          Icons.cloud_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        label: 'CO Limit (ppm)',
                        value: widget!.draftCo?.toString(),
                        percent: 0.0,
                        onChange: 'form.set_draft_co(value)',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info10,
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 18.0,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Alerts trigger when values exceed these limits for 5+ minutes.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.spaceGrotesk(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
