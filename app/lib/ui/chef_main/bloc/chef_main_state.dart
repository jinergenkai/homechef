import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_main_state.freezed.dart';

@freezed
class ChefMainState extends BaseBlocState with _$ChefMainState {
  const ChefMainState._();

  const factory ChefMainState({
    @Default('') String id,
  }) = _ChefMainState;
}
