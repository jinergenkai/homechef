import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_home.dart';
  
@Injectable()
class ChefHomeBloc extends BaseBloc<ChefHomeEvent, ChefHomeState> {
  ChefHomeBloc() : super(const ChefHomeState()) {
    on<ChefHomePageInitiated>(
      _onChefHomePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefHomePageInitiated(
    ChefHomePageInitiated event,
    Emitter<ChefHomeState> emit,
  ) async {
    
  }
}
