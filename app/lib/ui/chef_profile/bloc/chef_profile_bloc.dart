import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_profile.dart';
  
@Injectable()
class ChefProfileBloc extends BaseBloc<ChefProfileEvent, ChefProfileState> {
  ChefProfileBloc() : super(const ChefProfileState()) {
    on<ChefProfilePageInitiated>(
      _onChefProfilePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefProfilePageInitiated(
    ChefProfilePageInitiated event,
    Emitter<ChefProfileState> emit,
  ) async {
    emit(state.copyWith(chef: event.chef));    
  }
}
