import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_active_account_state.freezed.dart';

@freezed
class ChefActiveAccountState extends BaseBlocState with _$ChefActiveAccountState {
  const ChefActiveAccountState._();

  const factory ChefActiveAccountState({
    @Default('') String id,
  }) = _ChefActiveAccountState;
}
