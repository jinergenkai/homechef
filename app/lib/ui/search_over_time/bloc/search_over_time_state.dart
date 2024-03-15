import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
import 'package:domain/domain.dart';

part 'search_over_time_state.freezed.dart';

@freezed
class SearchOverTimeState extends BaseBlocState with _$SearchOverTimeState {
  const SearchOverTimeState._();

  const factory SearchOverTimeState({
    @Default('') String id,
    @Default(false) isLoading,
    @Default([]) List<CurrentUser> chefs,
  }) = _SearchOverTimeState;
}
