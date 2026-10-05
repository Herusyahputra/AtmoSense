import '/components/settings_row/settings_row_widget.dart';
import '/components/settings_row2/settings_row2_widget.dart';
import '/components/settings_row3/settings_row3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_group_model.dart';
export 'settings_group_model.dart';

class SettingsGroupWidget extends StatefulWidget {
  const SettingsGroupWidget({
    super.key,
    String? title,
    this.draftPush,
    this.draftEmail,
    this.draftSound,
  }) : this.title = title ?? 'ALERTS & NOTIFICATIONS';

  final String title;
  final bool? draftPush;
  final bool? draftEmail;
  final bool? draftSound;

  @override
  State<SettingsGroupWidget> createState() => _SettingsGroupWidgetState();
}

class _SettingsGroupWidgetState extends State<SettingsGroupWidget> {
  late SettingsGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsGroupModel());

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
            'ALERTS & NOTIFICATIONS',
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
                      model: _model.settingsRowModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsRowWidget(
                        icon: Icon(
                          Icons.notifications_active_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Push Notifications',
                        subtitle: 'Critical air quality alerts',
                        hasSubtitle: true,
                        draftPush: widget!.draftPush,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsRow2Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsRow2Widget(
                        icon: Icon(
                          Icons.email_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Email Summaries',
                        subtitle: 'Weekly air quality reports',
                        hasSubtitle: true,
                        draftEmail: widget!.draftEmail,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.settingsRow3Model,
                      updateCallback: () => safeSetState(() {}),
                      child: SettingsRow3Widget(
                        icon: Icon(
                          Icons.volume_up_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 22.0,
                        ),
                        label: 'Alert Sound',
                        subtitle: 'High-pitch industrial siren',
                        hasSubtitle: true,
                        draftSound: widget!.draftSound,
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
