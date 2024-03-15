import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'waiting_order.dart';

@Injectable()
class WaitingOrderBloc extends BaseBloc<WaitingOrderEvent, WaitingOrderState> {
  WaitingOrderBloc(this._getCookingOrderUseCase, this._getCurrentUserUseCase) : super(const WaitingOrderState()) {
    on<WaitingOrderPageInitiated>(
      _onWaitingOrderPageInitiated,
      transformer: log(),
    );
  }

  final GetCookingOrdersUseCase _getCookingOrderUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  FutureOr<void> _onWaitingOrderPageInitiated(
    WaitingOrderPageInitiated event,
    Emitter<WaitingOrderState> emit,
  ) async {
    return runBlocCatching(action: () async {
      //get current user
      final user = await _getCurrentUserUseCase.execute(const GetCurrentUserInput(id: 1));

      var response;

      //* role chef
      response = (await _getCookingOrderUseCase.execute(const GetCookingOrdersInput())).cookingOrders.where((element) {
        return element.status == event.status.index && (event.role == 1 ? element.chef.id : element.customer.id) == user.user.id;
        // return element.status == 0 && (event.role == 1 ? element.chef.id : element.customer.id) == user.user.id;
      }).toList();
      emit(
        state.copyWith(
          waitingOrders: response,
          isChefUser: event.role == 1,
        ),
      );
    });
  }
}
