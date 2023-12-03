import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'message.dart';
  
@Injectable()
class MessageBloc extends BaseBloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState()) {
    on<MessagePageInitiated>(
      _onMessagePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onMessagePageInitiated(
    MessagePageInitiated event,
    Emitter<MessageState> emit,
  ) async {
    
  }
}
