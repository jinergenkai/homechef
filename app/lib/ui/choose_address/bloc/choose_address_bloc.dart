import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'choose_address.dart';
  
@Injectable()
class ChooseAddressBloc extends BaseBloc<ChooseAddressEvent, ChooseAddressState> {
  ChooseAddressBloc(
    this._getAddressUseCase,
  ) : super(const ChooseAddressState()) {
    on<ChooseAddressPageInitiated>(
      _onChooseAddressPageInitiated,
      transformer: log(),
    );
  }

  final GetAddressesUseCase _getAddressUseCase;

  FutureOr<void> _onChooseAddressPageInitiated(
    ChooseAddressPageInitiated event,
    Emitter<ChooseAddressState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final response = await _getAddressUseCase.execute(const GetAddressesInput());
      emit(state.copyWith(addresses: response.addresses));
    });
  }
}
