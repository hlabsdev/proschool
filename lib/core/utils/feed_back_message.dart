import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FeedBackMeassage {
  final BuildContext _buildContext;
  final String _message;

  FeedBackMeassage(this._buildContext, this._message);

  void showErrorDialog() {}

  void showSuccessDialog() {}

  void actionToDo();
}
