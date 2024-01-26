import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'search_over_time.dart';
  
@Injectable()
class SearchOverTimeBloc extends BaseBloc<SearchOverTimeEvent, SearchOverTimeState> {
  SearchOverTimeBloc() : super(const SearchOverTimeState()) {
    on<SearchOverTimePageInitiated>(
      _onSearchOverTimePageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onSearchOverTimePageInitiated(
    SearchOverTimePageInitiated event,
    Emitter<SearchOverTimeState> emit,
  ) async {
    
  }
}
