import '/components/settings_row/settings_row_widget.dart';
import '/components/settings_row2/settings_row2_widget.dart';
import '/components/settings_row3/settings_row3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'settings_group_widget.dart' show SettingsGroupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsGroupModel extends FlutterFlowModel<SettingsGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SettingsRow.
  late SettingsRowModel settingsRowModel;
  // Model for SettingsRow2.
  late SettingsRow2Model settingsRow2Model;
  // Model for SettingsRow3.
  late SettingsRow3Model settingsRow3Model;

  @override
  void initState(BuildContext context) {
    settingsRowModel = createModel(context, () => SettingsRowModel());
    settingsRow2Model = createModel(context, () => SettingsRow2Model());
    settingsRow3Model = createModel(context, () => SettingsRow3Model());
  }

  @override
  void dispose() {
    settingsRowModel.dispose();
    settingsRow2Model.dispose();
    settingsRow3Model.dispose();
  }
}
