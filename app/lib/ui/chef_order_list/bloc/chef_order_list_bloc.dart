import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_order_list.dart';
  
@Injectable()
class ChefOrderListBloc extends BaseBloc<ChefOrderListEvent, ChefOrderListState> {
  ChefOrderListBloc() : super(const ChefOrderListState()) {
    on<ChefOrderListPageInitiated>(
      _onChefOrderListPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefOrderListPageInitiated(
    ChefOrderListPageInitiated event,
    Emitter<ChefOrderListState> emit,
  ) async {
    
  }
}
