import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../app.dart';
import 'confirm_and_pay.dart';

@Injectable()
class ConfirmAndPayBloc extends BaseBloc<ConfirmAndPayEvent, ConfirmAndPayState> {
  ConfirmAndPayBloc(this._addCookingOrderUseCase) : super(const ConfirmAndPayState()) {
    on<ConfirmAndPayPageInitiated>(
      _onConfirmAndPayPageInitiated,
      transformer: log(),
    );

    on<BookButtonPressed>(
      _onBookButtonPressed,
      transformer: log(),
    );
  }

  final AddCookingOrderUseCase _addCookingOrderUseCase;

  FutureOr<void> _onBookButtonPressed(
    BookButtonPressed event,
    Emitter<ConfirmAndPayState> emit,
  ) async {
    // print(state.cookingOrder);
    return runBlocCatching(
      action: () async {
        await _addCookingOrderUseCase.execute(
          AddCookingOrderInput(cookingOrder: state.cookingOrder),
        );
        await navigator.showDialog(
          AppPopupInfo.confirmDialog(
              message: "Đặt đơn thành công",
              onPressed: Func0(() async {
                // navigator.popUntilRoot();
                // navigator.push(const AppRouteInfo.main());
                // navigator.replace(const AppRouteInfo.main());
                navigator.popUntilRouteName("MainRoute");
                await navigator.replace(const AppRouteInfo.main());
              })),
        );
      },
      doOnError: (p0) async {
        print("false");
      },
    );
    // navigator.push(const AppRouteInfo.createAddress());
  }

  FutureOr<void> _onConfirmAndPayPageInitiated(
    ConfirmAndPayPageInitiated event,
    Emitter<ConfirmAndPayState> emit,
  ) async {
    emit(state.copyWith(cookingOrder: event.cookingOrder));
  }
}
