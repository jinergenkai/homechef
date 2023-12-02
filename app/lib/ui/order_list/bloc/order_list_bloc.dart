import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'order_list.dart';
  
@Injectable()
class OrderListBloc extends BaseBloc<OrderListEvent, OrderListState> {
  OrderListBloc() : super(const OrderListState()) {
    on<OrderListPageInitiated>(
      _onOrderListPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onOrderListPageInitiated(
    OrderListPageInitiated event,
    Emitter<OrderListState> emit,
  ) async {
    
  }
}
