import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'message_event.freezed.dart';

abstract class MessageEvent extends BaseBlocEvent {
  const MessageEvent();
}

@freezed
class MessagePageInitiated extends MessageEvent with _$MessagePageInitiated {
  const factory MessagePageInitiated() = _MessagePageInitiated;
}
