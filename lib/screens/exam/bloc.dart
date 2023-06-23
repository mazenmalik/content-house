export 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/services/server.dart';
import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context)
      : super(loading_view.ViewState(), context: context);

  @override
  void init() async {
    final service = context.server;
    Map<String, dynamic> data = await service.data;
    int? statusCode = data['status_code'];
    String? image = data['image'];
    String? message = data['message'];
    String? errorMessage = data['error_message'];
    int? count = data['count'];

    if (statusCode == 503) {
      emit(error_view.ViewState(message: errorMessage!));
      return;
    }

    emit(main_view.ViewState(
      networkImage: image!,
      message: message!,
      count: count ?? 0,
    ));
  }
}
