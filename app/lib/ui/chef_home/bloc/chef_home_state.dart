import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'chef_home_state.freezed.dart';

@freezed
class ChefHomeState extends BaseBlocState with _$ChefHomeState {
  const ChefHomeState._();

  const factory ChefHomeState({
    @Default('') String id,
  }) = _ChefHomeState;
}
