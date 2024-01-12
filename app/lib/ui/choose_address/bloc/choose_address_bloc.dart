import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'choose_address.dart';
  
@Injectable()
class ChooseAddressBloc extends BaseBloc<ChooseAddressEvent, ChooseAddressState> {
  ChooseAddressBloc() : super(const ChooseAddressState()) {
    on<ChooseAddressPageInitiated>(
      _onChooseAddressPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChooseAddressPageInitiated(
    ChooseAddressPageInitiated event,
    Emitter<ChooseAddressState> emit,
  ) async {
    
  }
}
