import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'message_state.freezed.dart';

@freezed
class MessageState extends BaseBlocState with _$MessageState {
  const MessageState._();

  const factory MessageState({
    @Default('') String id,
  }) = _MessageState;
}
