import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_main.dart';
  
@Injectable()
class ChefMainBloc extends BaseBloc<ChefMainEvent, ChefMainState> {
  ChefMainBloc() : super(const ChefMainState()) {
    on<ChefMainPageInitiated>(
      _onChefMainPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefMainPageInitiated(
    ChefMainPageInitiated event,
    Emitter<ChefMainState> emit,
  ) async {
    
  }
}
