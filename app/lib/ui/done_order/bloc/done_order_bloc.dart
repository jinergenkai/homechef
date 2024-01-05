import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'done_order.dart';
  
@Injectable()
class DoneOrderBloc extends BaseBloc<DoneOrderEvent, DoneOrderState> {
  DoneOrderBloc() : super(const DoneOrderState()) {
    on<DoneOrderPageInitiated>(
      _onDoneOrderPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onDoneOrderPageInitiated(
    DoneOrderPageInitiated event,
    Emitter<DoneOrderState> emit,
  ) async {
    
  }
}
