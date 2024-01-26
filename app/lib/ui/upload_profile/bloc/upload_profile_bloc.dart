import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'upload_profile.dart';
  
@Injectable()
class UploadProfileBloc extends BaseBloc<UploadProfileEvent, UploadProfileState> {
  UploadProfileBloc() : super(const UploadProfileState()) {
    on<UploadProfilePageInitiated>(
      _onUploadProfilePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onUploadProfilePageInitiated(
    UploadProfilePageInitiated event,
    Emitter<UploadProfileState> emit,
  ) async {
    
  }
}
