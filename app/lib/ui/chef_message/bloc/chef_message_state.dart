import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_message_state.freezed.dart';

@freezed
class ChefMessageState extends BaseBlocState with _$ChefMessageState {
  const ChefMessageState._();

  const factory ChefMessageState({
    @Default('') String id,
  }) = _ChefMessageState;
}
