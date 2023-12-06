import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'sub_message_event.freezed.dart';

abstract class SubMessageEvent extends BaseBlocEvent {
  const SubMessageEvent();
}

@freezed
class SubMessagePageInitiated extends SubMessageEvent with _$SubMessagePageInitiated {
  const factory SubMessagePageInitiated() = _SubMessagePageInitiated;
}
