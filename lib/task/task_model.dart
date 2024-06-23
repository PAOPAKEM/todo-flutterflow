import '/flutter_flow/flutter_flow_util.dart';
import 'task_widget.dart' show TaskWidget;
import 'package:flutter/material.dart';

class TaskModel extends FlutterFlowModel<TaskWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
