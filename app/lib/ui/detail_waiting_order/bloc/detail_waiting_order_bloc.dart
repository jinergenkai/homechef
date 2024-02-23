import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'detail_waiting_order.dart';

@Injectable()
class DetailWaitingOrderBloc extends BaseBloc<DetailWaitingOrderEvent, DetailWaitingOrderState> {
  DetailWaitingOrderBloc(
    this._currentUserUseCase,
    this._changeCookingOrderUseCase,
  ) : super(const DetailWaitingOrderState()) {
    on<DetailWaitingOrderPageInitiated>(
      _onDetailWaitingOrderPageInitiated,
      transformer: log(),
    );
    on<AcceptButtonPressed>(
      _onAcceptButtonPressed,
      transformer: log(),
    );
  }

  final GetCurrentUserUseCase _currentUserUseCase;
  final ChangeCookingOrderUseCase _changeCookingOrderUseCase;

  FutureOr<void> _onDetailWaitingOrderPageInitiated(
    DetailWaitingOrderPageInitiated event,
    Emitter<DetailWaitingOrderState> emit,
  ) async {
    emit(
      state.copyWith(
        cookingOrder: event.order,
      ),
    );
  }

  FutureOr<void> _onAcceptButtonPressed(
    AcceptButtonPressed event,
    Emitter<DetailWaitingOrderState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final userResponse = await _currentUserUseCase.execute(const GetCurrentUserInput(id: 1));
      if (userResponse.user.role != "CHEF") {
        return;
      }
      // print(userResponse.user);
      // print(state.cookingOrder);
      await _changeCookingOrderUseCase.execute(
        ChangeCookingOrderInput(
          cookingOrder: state.cookingOrder.copyWith(
            chef: state.cookingOrder.chef.copyWith(
              id: userResponse.user.id,
            )
          ),
          orderStatus: 2,
          // orderStatus: OrderStatus.PROCESSING.index,
        ),
      );

      // final
    });
  }
}
