import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'update_info_state.freezed.dart';

@freezed
class UpdateInfoState extends BaseBlocState with _$UpdateInfoState {
  const UpdateInfoState._();

  const factory UpdateInfoState({
    @Default('') String id,
  }) = _UpdateInfoState;
}
