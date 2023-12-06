import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'sub_message_state.freezed.dart';

@freezed
class SubMessageState extends BaseBlocState with _$SubMessageState {
  const SubMessageState._();

  const factory SubMessageState({
    @Default('') String id,
  }) = _SubMessageState;
}
