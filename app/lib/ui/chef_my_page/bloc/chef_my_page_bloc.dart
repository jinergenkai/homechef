import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_my_page.dart';

@Injectable()
class ChefMyPageBloc extends BaseBloc<ChefMyPageEvent, ChefMyPageState> {
  ChefMyPageBloc(
    this._logoutUseCase,
    this._getCurrentUserUseCase,
    this._getCookingOrdersUseCase,
  ) : super(const ChefMyPageState()) {
    on<ChefMyPagePageInitiated>(
      _onChefMyPagePageInitiated,
      transformer: log(),
    );
    on<LogoutButtonPressed>(
      _onLogoutButtonPressed,
      transformer: log(),
    );
  }

  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetCookingOrdersUseCase _getCookingOrdersUseCase;

  FutureOr<void> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<ChefMyPageState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _logoutUseCase.execute(const LogoutInput());
      },
    );
  }


  FutureOr<void> _onChefMyPagePageInitiated(
    ChefMyPagePageInitiated event,
    Emitter<ChefMyPageState> emit,
  ) async {
    final currentUser = await _getCurrentUserUseCase.execute(const GetCurrentUserInput(id: 1));
    emit(state.copyWith(currentUser: currentUser.user));

    final cookingOrders = await _getCookingOrdersUseCase.execute(const GetCookingOrdersInput());
    final myCookingOrders = cookingOrders.cookingOrders.where((order) => order.chef.id == currentUser.user.id && order.status == OrderStatus.COMPLETED.index).toList();

    final commissionRate = 0.8;
    final myWallet = myCookingOrders.fold<int>(0, (previousValue, order) => previousValue + order.price) * commissionRate;

    emit(state.copyWith(wallet: myWallet.toInt()));
  }
}
