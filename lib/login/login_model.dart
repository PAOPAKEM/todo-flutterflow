import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8ksh6rel' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwd widget.
  FocusNode? passwdFocusNode;
  TextEditingController? passwdTextController;
  late bool passwdVisibility;
  String? Function(BuildContext, String?)? passwdTextControllerValidator;
  String? _passwdTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z1d5nf8y' /* Field is required */,
      );
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for confirm widget.
  FocusNode? confirmFocusNode;
  TextEditingController? confirmTextController;
  late bool confirmVisibility;
  String? Function(BuildContext, String?)? confirmTextControllerValidator;
  String? _confirmTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jb2qn6yd' /* Field is required */,
      );
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for log_in widget.
  FocusNode? logInFocusNode;
  TextEditingController? logInTextController;
  String? Function(BuildContext, String?)? logInTextControllerValidator;
  String? _logInTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mnkwu7uq' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for login_passwd widget.
  FocusNode? loginPasswdFocusNode;
  TextEditingController? loginPasswdTextController;
  late bool loginPasswdVisibility;
  String? Function(BuildContext, String?)? loginPasswdTextControllerValidator;
  String? _loginPasswdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0abulg4s' /* Field is required */,
      );
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    passwdVisibility = false;
    passwdTextControllerValidator = _passwdTextControllerValidator;
    confirmVisibility = false;
    confirmTextControllerValidator = _confirmTextControllerValidator;
    logInTextControllerValidator = _logInTextControllerValidator;
    loginPasswdVisibility = false;
    loginPasswdTextControllerValidator = _loginPasswdTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwdFocusNode?.dispose();
    passwdTextController?.dispose();

    confirmFocusNode?.dispose();
    confirmTextController?.dispose();

    logInFocusNode?.dispose();
    logInTextController?.dispose();

    loginPasswdFocusNode?.dispose();
    loginPasswdTextController?.dispose();
  }
}
