import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default('') String id,
    @Default('') String displayName,
    @Default([]) List<CurrentUser> chefs,
  }) = _HomeState;
}
