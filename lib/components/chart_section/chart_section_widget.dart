import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chart_section_model.dart';
export 'chart_section_model.dart';

class ChartSectionWidget extends StatefulWidget {
  const ChartSectionWidget({
    super.key,
    String? title,
    String? subtitle,
    String? period,
    String? data,
    String? labels,
  })  : this.title = title ?? 'AQI Trend',
        this.subtitle = subtitle ?? 'Overall Air Quality Index',
        this.period = period ?? 'Last 24h',
        this.data = data ?? '32,35,45,52,48,40,34,31',
        this.labels = labels ?? '00,03,06,09,12,15,18,21';

  final String title;
  final String subtitle;
  final String period;
  final String data;
  final String labels;

  @override
  State<ChartSectionWidget> createState() => _ChartSectionWidgetState();
}

class _ChartSectionWidgetState extends State<ChartSectionWidget> {
  late ChartSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartSectionModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget!.title,
                          'AQI Trend',
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                              lineHeight: 1.4,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.subtitle,
                          'Overall Air Quality Index',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.spaceGrotesk(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              lineHeight: 1.2,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryContainer,
                      borderRadius: BorderRadius.circular(9999.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                      child: Container(
                        child: Text(
                          valueOrDefault<String>(
                            widget!.period,
                            'Last 24h',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.spaceGrotesk(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 16.0,
              ),
              Container(
                height: 160.0,
                child: FlutterFlowLineChart(
                  data: [
                    FFLineChartData(
                      xData: ([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])!,
                      yData: (String data) {
                        return data
                            .split(',')
                            .map((value) => double.tryParse(value.trim()) ?? 0)
                            .toList();
                      }(valueOrDefault<String>(
                        widget!.data,
                        '32,35,45,52,48,40,34,31',
                      )),
                      settings: LineChartBarData(
                        color: FlutterFlowTheme.of(context).primary,
                        barWidth: 3.0,
                        isCurved: true,
                        belowBarData: BarAreaData(
                          show: true,
                          color: FlutterFlowTheme.of(context).primary10,
                        ),
                      ),
                    )
                  ],
                  chartStylingInfo: ChartStylingInfo(
                    backgroundColor: Colors.transparent,
                    showBorder: false,
                  ),
                  axisBounds: AxisBounds(
                    minX: 0.0,
                    minY: 0.0,
                    maxX: 7.0,
                    maxY: 62.4,
                  ),
                  xLabels: (['1', '2', '3', '4', '5', '6', '7', '8'])!,
                  xAxisLabelInfo: AxisLabelInfo(
                    showLabels: true,
                    labelTextStyle: FlutterFlowTheme.of(context)
                        .bodySmall
                        .override(
                          font: GoogleFonts.manrope(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                          lineHeight: 1.0,
                        ),
                    reservedSize: 28.0,
                  ),
                  yAxisLabelInfo: AxisLabelInfo(
                    reservedSize: 0.0,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
