import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/core/services/server.dart';
import 'package:provider/provider.dart';

class ViewState extends base.ViewState {
  final String networkImage;
  final int count;
  final String message;

  ViewState(
      {required this.networkImage, required this.count, required this.message});
  @override
  Widget content(BuildContext context) {
    final serverProvider = Provider.of<Server>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.network(networkImage),
          const SizedBox(height: 10),
          Text(message),
          FloatingActionButton(
            onPressed: () => context.server.addToCount(1),
            child: Text(serverProvider.count.toString()),
          )
        ],
      ),
    );
  }
}
