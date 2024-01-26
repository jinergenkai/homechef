import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_schedule.dart';
  
@Injectable()
class ChefScheduleBloc extends BaseBloc<ChefScheduleEvent, ChefScheduleState> {
  ChefScheduleBloc() : super(const ChefScheduleState()) {
    on<ChefSchedulePageInitiated>(
      _onChefSchedulePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefSchedulePageInitiated(
    ChefSchedulePageInitiated event,
    Emitter<ChefScheduleState> emit,
  ) async {
    
  }
}
