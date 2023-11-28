import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'onboarding_event.freezed.dart';

abstract class OnboardingEvent extends BaseBlocEvent {
  const OnboardingEvent();
}

@freezed
class OnboardingPageInitiated extends OnboardingEvent with _$OnboardingPageInitiated {
  const factory OnboardingPageInitiated() = _OnboardingPageInitiated;
}
