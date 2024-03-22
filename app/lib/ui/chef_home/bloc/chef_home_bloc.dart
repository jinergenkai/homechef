import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_home.dart';

@Injectable()
class ChefHomeBloc extends BaseBloc<ChefHomeEvent, ChefHomeState> {
  ChefHomeBloc(
    this._getCurrentUserUseCase,
    this._getCookingOrdersUseCase,
  ) : super(const ChefHomeState()) {
    on<ChefHomePageInitiated>(
      _onChefHomePageInitiated,
      transformer: log(),
    );
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final GetCookingOrdersUseCase _getCookingOrdersUseCase;

  FutureOr<void> _onChefHomePageInitiated(
    ChefHomePageInitiated event,
    Emitter<ChefHomeState> emit,
  ) async {
    final user = await _getCurrentUserUseCase.execute(GetCurrentUserInput(id: 1));
    final orders = (await _getCookingOrdersUseCase.execute(GetCookingOrdersInput()))
                    .cookingOrders.where((element) => element.status == OrderStatus.PENDING.index).toList();
    // print(user);
    emit(state.copyWith(
      user: user.user,
      cookingOrders: orders,
    ));
  }
}
