import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'confirm_and_pay_event.freezed.dart';

abstract class ConfirmAndPayEvent extends BaseBlocEvent {
  const ConfirmAndPayEvent();
}

@freezed
class ConfirmAndPayPageInitiated extends ConfirmAndPayEvent with _$ConfirmAndPayPageInitiated {
  const factory ConfirmAndPayPageInitiated({
    required CookingOrder cookingOrder,
  }) = _ConfirmAndPayPageInitiated;
}

@freezed
class BookButtonPressed extends ConfirmAndPayEvent with _$BookButtonPressed {
  const factory BookButtonPressed() = _BookButtonPressed;
}