import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'in_processing_order.dart';
  
@Injectable()
class InProcessingOrderBloc extends BaseBloc<InProcessingOrderEvent, InProcessingOrderState> {
  InProcessingOrderBloc() : super(const InProcessingOrderState()) {
    on<InProcessingOrderPageInitiated>(
      _onInProcessingOrderPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onInProcessingOrderPageInitiated(
    InProcessingOrderPageInitiated event,
    Emitter<InProcessingOrderState> emit,
  ) async {
    
  }
}
