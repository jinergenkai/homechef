import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'create_address.dart';

@Injectable()
class CreateAddressBloc extends BaseBloc<CreateAddressEvent, CreateAddressState> {
  CreateAddressBloc(
    this._getDistrictByProvinceUseCase,
  ) : super(const CreateAddressState()) {
    on<CreateAddressPageInitiated>(
      _onCreateAddressPageInitiated,
      transformer: log(),
    );
    on<AddressChanged>(
      _onAddressChanged,
      transformer: log(),
    );

    on<DistrictChanged>(
      _onDistrictChanged,
      transformer: log(),
    );

    on<CreateAddressButtonPressed>(
      _onCreateAddressButtonPressed,
      transformer: log(),
    );
  }

  GetDistrictByProvinceUseCase _getDistrictByProvinceUseCase;

  FutureOr<void> _onCreateAddressPageInitiated(
    CreateAddressPageInitiated event,
    Emitter<CreateAddressState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final result = await _getDistrictByProvinceUseCase.execute(
        const GetDistrictByProvinceInput(),
      );

      emit(state.copyWith(
        districts: result.districts,
      ));
    });
  }

  FutureOr<void> _onAddressChanged(
    AddressChanged event,
    Emitter<CreateAddressState> emit,
  ) async {
    emit(
      state.copyWith(
        address: event.address,
      ),
    );
  }

  FutureOr<void> _onDistrictChanged(
    DistrictChanged event,
    Emitter<CreateAddressState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDistrictId: event.selectedDistrictId,
      ),
    );
  }

  // FutureOr<void> _onCreateAddressButtonPressed(
  //   CreateAddressButtonPressed event,
  //   Emitter<CreateAddressState> emit,
  // ) async {
  //   return runBlocCatching(action: () async {
  //     final result = await _createAddressUseCase.execute(
  //       CreateAddressInput(
  //         address: state.address,
  //         districtId: state.selectedDistrictId,
  //       ),
  //     );
  //   },
  //   doOnEventCompleted: () {
  //     return navigator.pop();
  //   }
  //   );
  // }
}
