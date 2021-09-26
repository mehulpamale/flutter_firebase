import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  void navigate(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));
  }
}

extension WidgetExt on Widget {
  void showDialog(String msg) {
    // showDialog(context: this.con, builder: builder)
  }
}

extension DialogExt on Dialog {
  void showDialog(BuildContext context, String msg) {
    this.showDialog(context, msg);
  }
}
