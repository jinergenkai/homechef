import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState extends BaseBlocState with _$OnboardingState {
  const OnboardingState._();

  const factory OnboardingState({
    @Default('') String id,
  }) = _OnboardingState;
}
