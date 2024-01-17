import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'choose_menu_state.freezed.dart';

@freezed
class ChooseMenuState extends BaseBlocState with _$ChooseMenuState {
  const ChooseMenuState._();

  const factory ChooseMenuState({
    @Default('') String id,
    @Default(1) int people,
    @Default(["", ""]) List<String> menu,
  }) = _ChooseMenuState;
}
