import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
class ToastUtils {
  static const Color successColor = Color(0xFF75FB4C);
  static const Color errorColor = Color(0xFFEA3323);
  static const IconData successIcon = LineIcons.checkCircle;
  static const IconData errorIcon = LineIcons.ban;
  static const IconData infoIcon = LineIcons.infoCircle;
  static void showToast(String msg, {Color? color}) {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.top,
      builder: (context) => T
    ).show(context);
    Icon
  }
}
