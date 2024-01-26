import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app.dart';
  
part 'search_over_time_event.freezed.dart';

abstract class SearchOverTimeEvent extends BaseBlocEvent {
  const SearchOverTimeEvent();
}

@freezed
class SearchOverTimePageInitiated extends SearchOverTimeEvent with _$SearchOverTimePageInitiated {
  const factory SearchOverTimePageInitiated() = _SearchOverTimePageInitiated;
}
