import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'onboarding.dart';
  
@Injectable()
class OnboardingBloc extends BaseBloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingPageInitiated>(
      _onOnboardingPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onOnboardingPageInitiated(
    OnboardingPageInitiated event,
    Emitter<OnboardingState> emit,
  ) async {
    
  }
}
