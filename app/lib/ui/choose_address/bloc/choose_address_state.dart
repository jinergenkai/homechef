import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'choose_address_state.freezed.dart';

@freezed
class ChooseAddressState extends BaseBlocState with _$ChooseAddressState {
  const ChooseAddressState._();

  const factory ChooseAddressState({
    @Default('') String id,
    @Default([]) List<Address> addresses,
  }) = _ChooseAddressState;
}
