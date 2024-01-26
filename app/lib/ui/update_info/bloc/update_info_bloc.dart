import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'update_info.dart';
  
@Injectable()
class UpdateInfoBloc extends BaseBloc<UpdateInfoEvent, UpdateInfoState> {
  UpdateInfoBloc() : super(const UpdateInfoState()) {
    on<UpdateInfoPageInitiated>(
      _onUpdateInfoPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onUpdateInfoPageInitiated(
    UpdateInfoPageInitiated event,
    Emitter<UpdateInfoState> emit,
  ) async {
    
  }
}
