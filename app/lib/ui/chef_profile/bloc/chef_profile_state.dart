import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_profile_state.freezed.dart';

@freezed
class ChefProfileState extends BaseBlocState with _$ChefProfileState {
  const ChefProfileState._();

  const factory ChefProfileState({
    @Default('') String id,
    @Default(CurrentUser()) CurrentUser chef,
  }) = _ChefProfileState;
}
