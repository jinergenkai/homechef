import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'notification_event.freezed.dart';

abstract class NotificationEvent extends BaseBlocEvent {
  const NotificationEvent();
}

@freezed
class NotificationPageInitiated extends NotificationEvent with _$NotificationPageInitiated {
  const factory NotificationPageInitiated() = _NotificationPageInitiated;
}
