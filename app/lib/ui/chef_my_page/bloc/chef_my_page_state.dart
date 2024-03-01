import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_my_page_state.freezed.dart';

@freezed
class ChefMyPageState extends BaseBlocState with _$ChefMyPageState {
  const ChefMyPageState._();

  const factory ChefMyPageState({
    @Default('') String id,
    @Default(CurrentUser()) CurrentUser currentUser,
  }) = _ChefMyPageState;
}
