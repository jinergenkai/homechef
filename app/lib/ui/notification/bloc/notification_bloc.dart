import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'notification.dart';
  
@Injectable()
class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<NotificationPageInitiated>(
      _onNotificationPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onNotificationPageInitiated(
    NotificationPageInitiated event,
    Emitter<NotificationState> emit,
  ) async {
    
  }
}
