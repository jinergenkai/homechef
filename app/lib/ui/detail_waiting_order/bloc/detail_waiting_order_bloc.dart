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

    on<CancelButtonPressed>(
      _onCancelButtonPressed,
      transformer: log(),
    );

    on<CompleteButtonPressed>(
      _onCompleteButtonPressed,
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

  //* Accept button pressed
  FutureOr<void> _onAcceptButtonPressed(
    AcceptButtonPressed event,
    Emitter<DetailWaitingOrderState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final userResponse = await _currentUserUseCase.execute(const GetCurrentUserInput(id: 1));
      if (userResponse.user.role != "CHEF") {
        return;
      }
      await _changeCookingOrderUseCase.execute(
        ChangeCookingOrderInput(
          cookingOrder: state.cookingOrder.copyWith(
              chef: state.cookingOrder.chef.copyWith(
            id: userResponse.user.id,
          )),
          orderStatus: OrderStatus.PROCESSING.index,
        ),
      );
      // final
      await navigator.push(const AppRouteInfo.chefMain());
    });
  }

  //* Cancel button pressed
  FutureOr<void> _onCancelButtonPressed(
    CancelButtonPressed event,
    Emitter<DetailWaitingOrderState> emit,
  ) async {
    return runBlocCatching(action: () async {
      await _changeCookingOrderUseCase.execute(
        ChangeCookingOrderInput(
          cookingOrder: state.cookingOrder,
          orderStatus: OrderStatus.CANCELED.index,
        ),
      );
      // final
      await navigator.push(const AppRouteInfo.chefMain());
    });
  }

  //* Complete button pressed
  FutureOr<void> _onCompleteButtonPressed(
    CompleteButtonPressed event,
    Emitter<DetailWaitingOrderState> emit,
  ) async {
    return runBlocCatching(action: () async {
      await _changeCookingOrderUseCase.execute(
        ChangeCookingOrderInput(
          cookingOrder: state.cookingOrder,
          orderStatus: OrderStatus.COMPLETED.index,
        ),
      );
      // final
      await navigator.push(const AppRouteInfo.chefMain());
    });
  }
}
