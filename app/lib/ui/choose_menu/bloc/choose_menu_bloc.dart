import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'choose_menu.dart';
  
@Injectable()
class ChooseMenuBloc extends BaseBloc<ChooseMenuEvent, ChooseMenuState> {
  ChooseMenuBloc() : super(const ChooseMenuState()) {
    on<ChooseMenuPageInitiated>(
      _onChooseMenuPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChooseMenuPageInitiated(
    ChooseMenuPageInitiated event,
    Emitter<ChooseMenuState> emit,
  ) async {
    
  }
}
