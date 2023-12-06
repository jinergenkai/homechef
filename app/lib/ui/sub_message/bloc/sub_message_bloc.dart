import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'sub_message.dart';
  
@Injectable()
class SubMessageBloc extends BaseBloc<SubMessageEvent, SubMessageState> {
  SubMessageBloc() : super(const SubMessageState()) {
    on<SubMessagePageInitiated>(
      _onSubMessagePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onSubMessagePageInitiated(
    SubMessagePageInitiated event,
    Emitter<SubMessageState> emit,
  ) async {
    
  }
}
