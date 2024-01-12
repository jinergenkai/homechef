import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'create_address_state.freezed.dart';

@freezed
class CreateAddressState extends BaseBlocState with _$CreateAddressState {
  const CreateAddressState._();

  const factory CreateAddressState({
    @Default('') String id,
  }) = _CreateAddressState;
}
