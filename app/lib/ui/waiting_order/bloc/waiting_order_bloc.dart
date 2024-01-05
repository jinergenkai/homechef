import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'waiting_order.dart';
  
@Injectable()
class WaitingOrderBloc extends BaseBloc<WaitingOrderEvent, WaitingOrderState> {
  WaitingOrderBloc() : super(const WaitingOrderState()) {
    on<WaitingOrderPageInitiated>(
      _onWaitingOrderPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onWaitingOrderPageInitiated(
    WaitingOrderPageInitiated event,
    Emitter<WaitingOrderState> emit,
  ) async {
    
  }
}
