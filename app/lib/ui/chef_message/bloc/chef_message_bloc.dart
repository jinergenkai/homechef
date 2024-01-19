import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_message.dart';
  
@Injectable()
class ChefMessageBloc extends BaseBloc<ChefMessageEvent, ChefMessageState> {
  ChefMessageBloc() : super(const ChefMessageState()) {
    on<ChefMessagePageInitiated>(
      _onChefMessagePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefMessagePageInitiated(
    ChefMessagePageInitiated event,
    Emitter<ChefMessageState> emit,
  ) async {
    
  }
}
