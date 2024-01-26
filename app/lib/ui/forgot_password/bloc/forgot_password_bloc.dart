import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'forgot_password.dart';
  
@Injectable()
class ForgotPasswordBloc extends BaseBloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<ForgotPasswordPageInitiated>(
      _onForgotPasswordPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onForgotPasswordPageInitiated(
    ForgotPasswordPageInitiated event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    
  }
}
