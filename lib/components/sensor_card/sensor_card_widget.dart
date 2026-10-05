import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sensor_card_model.dart';
export 'sensor_card_model.dart';

class SensorCardWidget extends StatefulWidget {
  const SensorCardWidget({
    super.key,
    Color? color,
    this.icon,
    String? unit,
    String? label,
    String? value,
    String? trend,
  })  : this.color = color ?? const Color(0x00000000),
        this.unit = unit ?? '°C',
        this.label = label ?? 'Temperature',
        this.value = value ?? '',
        this.trend = trend ?? '22,23,24,24.2,23.8,24.2';

  final Color color;
  final Widget? icon;
  final String unit;
  final String label;
  final String value;
  final String trend;

  @override
  State<SensorCardWidget> createState() => _SensorCardWidgetState();
}

class _SensorCardWidgetState extends State<SensorCardWidget> {
  late SensorCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SensorCardModel());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        widget!.color,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: widget!.icon!,
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      valueOrDefault<String>(
                        widget!.unit,
                        '°C',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.spaceGrotesk(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).accent3,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                            lineHeight: 1.2,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.label,
                      'Temperature',
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
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.2,
                        ),
                  ),
                  Text(
                    widget!.value,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                          lineHeight: 1.3,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
              Container(
                height: 30.0,
                child: Container(
                  height: 30.0,
                  child: FlutterFlowLineChart(
                    data: [
                      FFLineChartData(
                        xData: ([0.0, 1.0, 2.0, 3.0, 4.0, 5.0])!,
                        yData: (String data) {
                          return data
                              .split(',')
                              .map(
                                  (value) => double.tryParse(value.trim()) ?? 0)
                              .toList();
                        }(valueOrDefault<String>(
                          widget!.trend,
                          '22,23,24,24.2,23.8,24.2',
                        )),
                        settings: LineChartBarData(
                          color: valueOrDefault<Color>(
                            widget!.color,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          barWidth: 2.0,
                          isCurved: true,
                          dotData: FlDotData(show: false),
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
                      maxX: 5.0,
                      maxY: 29.04,
                    ),
                    xLabels: (['1', '2', '3', '4', '5', '6'])!,
                    xAxisLabelInfo: AxisLabelInfo(
                      reservedSize: 0.0,
                    ),
                    yAxisLabelInfo: AxisLabelInfo(
                      reservedSize: 0.0,
                    ),
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
