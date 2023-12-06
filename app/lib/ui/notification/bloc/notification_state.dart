import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState extends BaseBlocState with _$NotificationState {
  const NotificationState._();

  const factory NotificationState({
    @Default('') String id,
  }) = _NotificationState;
}
