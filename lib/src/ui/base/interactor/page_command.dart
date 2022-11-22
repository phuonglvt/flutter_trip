import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_demo/src/ui/routing/pop_result.dart';

abstract class PageCommand {}

class PageCommandShowError extends PageCommand {
  String msg;
  PageCommandShowError(this.msg);
}

class PageCommandShowTokenError extends PageCommand {
  PageCommandShowTokenError();
}

class PageCommandShowToast extends PageCommand {
  String message;
  PageCommandShowToast(this.message);
}

class PageCommandDialog extends PageCommand {
  String title;
  String content;
  PopResult? result;
  PageCommandDialog({
    this.title = '',
    this.content = '',
    this.result,
  });
}

class PageCommandNavigatorPage extends PageCommand {
  String? page;
  dynamic argument;
  PopResult? result;

  PageCommandNavigatorPage({this.page, this.result, this.argument});
}

void showToast({
  required String message,
  ToastGravity? gravity,
  Color? backgroundColor,
  Color? textColor,
}) =>
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFFD5E8D4),
      textColor: Colors.black,
    );
