import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;

class ViewState extends base.ViewState {
  final String message;
  ViewState({required this.message});
  @override
  Widget content(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              message,
              style: context.texts.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
