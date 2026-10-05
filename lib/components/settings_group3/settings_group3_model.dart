import '/components/settings_row4/settings_row4_widget.dart';
import '/components/settings_row5/settings_row5_widget.dart';
import '/components/settings_row6/settings_row6_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group3_widget.dart' show SettingsGroup3Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroup3Model extends FlutterFlowModel<SettingsGroup3Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for SettingsRow4.
  late SettingsRow4Model settingsRow4Model;
  // Model for SettingsRow5.
  late SettingsRow5Model settingsRow5Model;
  // Model for SettingsRow6.
  late SettingsRow6Model settingsRow6Model;

  @override
  void initState(BuildContext context) {
    settingsRow4Model = createModel(context, () => SettingsRow4Model());
    settingsRow5Model = createModel(context, () => SettingsRow5Model());
    settingsRow6Model = createModel(context, () => SettingsRow6Model());
  }

  @override
  void dispose() {
    settingsRow4Model.dispose();
    settingsRow5Model.dispose();
    settingsRow6Model.dispose();
  }
}
