import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'create_address.dart';
  
@Injectable()
class CreateAddressBloc extends BaseBloc<CreateAddressEvent, CreateAddressState> {
  CreateAddressBloc() : super(const CreateAddressState()) {
    on<CreateAddressPageInitiated>(
      _onCreateAddressPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onCreateAddressPageInitiated(
    CreateAddressPageInitiated event,
    Emitter<CreateAddressState> emit,
  ) async {
    
  }
}
