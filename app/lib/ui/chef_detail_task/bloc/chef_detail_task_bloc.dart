import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_detail_task.dart';
  
@Injectable()
class ChefDetailTaskBloc extends BaseBloc<ChefDetailTaskEvent, ChefDetailTaskState> {
  ChefDetailTaskBloc() : super(const ChefDetailTaskState()) {
    on<ChefDetailTaskPageInitiated>(
      _onChefDetailTaskPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefDetailTaskPageInitiated(
    ChefDetailTaskPageInitiated event,
    Emitter<ChefDetailTaskState> emit,
  ) async {
    
  }
}
