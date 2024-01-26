import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'upload_profile_event.freezed.dart';

abstract class UploadProfileEvent extends BaseBlocEvent {
  const UploadProfileEvent();
}

@freezed
class UploadProfilePageInitiated extends UploadProfileEvent with _$UploadProfilePageInitiated {
  const factory UploadProfilePageInitiated() = _UploadProfilePageInitiated;
}
