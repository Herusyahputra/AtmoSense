import '/components/settings_row4/settings_row4_widget.dart';
import '/components/settings_row5/settings_row5_widget.dart';
import '/components/settings_row6/settings_row6_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group3_model.dart';
export 'settings_group3_model.dart';

class SettingsGroup3Widget extends StatefulWidget {
  const SettingsGroup3Widget({
    super.key,
    String? title,
  }) : this.title = title ?? 'HARDWARE & SYNC';

  final String title;

  @override
  State<SettingsGroup3Widget> createState() => _SettingsGroup3WidgetState();
}

class _SettingsGroup3WidgetState extends State<SettingsGroup3Widget> {
  late SettingsGroup3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroup3Model());

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
            'HARDWARE & SYNC',
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
                      model: _model.settingsRow4Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsRow4Widget(
                        icon: Icon(
                          Icons.timer_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Sampling Interval',
                        subtitle: 'Every 30 seconds',
                        hasSubtitle: true,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsRow5Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsRow5Widget(
                        icon: Icon(
                          Icons.wifi_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Network Settings',
                        subtitle: 'Connected to \'Atmo_Secure_5G\'',
                        hasSubtitle: true,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsRow6Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsRow6Widget(
                        icon: Icon(
                          Icons.restart_alt_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Restart ESP32',
                        subtitle: 'Perform a soft system reset',
                        hasSubtitle: true,
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
