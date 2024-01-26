import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'upload_profile_state.freezed.dart';

@freezed
class UploadProfileState extends BaseBlocState with _$UploadProfileState {
  const UploadProfileState._();

  const factory UploadProfileState({
    @Default('') String id,
  }) = _UploadProfileState;
}
