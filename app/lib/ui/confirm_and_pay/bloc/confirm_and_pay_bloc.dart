import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'confirm_and_pay.dart';
  
@Injectable()
class ConfirmAndPayBloc extends BaseBloc<ConfirmAndPayEvent, ConfirmAndPayState> {
  ConfirmAndPayBloc() : super(const ConfirmAndPayState()) {
    on<ConfirmAndPayPageInitiated>(
      _onConfirmAndPayPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onConfirmAndPayPageInitiated(
    ConfirmAndPayPageInitiated event,
    Emitter<ConfirmAndPayState> emit,
  ) async {
    
  }
}
