import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_my_page.dart';
  
@Injectable()
class ChefMyPageBloc extends BaseBloc<ChefMyPageEvent, ChefMyPageState> {
  ChefMyPageBloc() : super(const ChefMyPageState()) {
    on<ChefMyPagePageInitiated>(
      _onChefMyPagePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefMyPagePageInitiated(
    ChefMyPagePageInitiated event,
    Emitter<ChefMyPageState> emit,
  ) async {
    
  }
}
