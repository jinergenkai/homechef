import 'dart:async';

import 'package:flutter/material.dart';
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

    on<BookButtonPressed>(
      _onBookButtonPressed,
      transformer: log(),
    );
  }

  FutureOr<void> _onBookButtonPressed(
    BookButtonPressed event,
    Emitter<ConfirmAndPayState> emit,
  ) async {
    emit(
      state.copyWith(
        booked: true,
      ),
    );
  }

  FutureOr<void> _onConfirmAndPayPageInitiated(
    ConfirmAndPayPageInitiated event,
    Emitter<ConfirmAndPayState> emit,
  ) async {}
}
