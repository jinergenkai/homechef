import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'waiting_order.dart';

@Injectable()
class WaitingOrderBloc extends BaseBloc<WaitingOrderEvent, WaitingOrderState> {
  WaitingOrderBloc(this._getCookingOrderUseCase) : super(const WaitingOrderState()) {
    on<WaitingOrderPageInitiated>(
      _onWaitingOrderPageInitiated,
      transformer: log(),
    );
  }

  final GetCookingOrdersUseCase _getCookingOrderUseCase;

  FutureOr<void> _onWaitingOrderPageInitiated(
    WaitingOrderPageInitiated event,
    Emitter<WaitingOrderState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final response = await _getCookingOrderUseCase.execute(const GetCookingOrdersInput());
      emit(
        state.copyWith(
          waitingOrders: response.cookingOrders,
        ),
      );
    });
  }
}
