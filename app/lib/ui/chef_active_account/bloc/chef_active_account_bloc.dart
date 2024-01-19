import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'chef_active_account.dart';
  
@Injectable()
class ChefActiveAccountBloc extends BaseBloc<ChefActiveAccountEvent, ChefActiveAccountState> {
  ChefActiveAccountBloc() : super(const ChefActiveAccountState()) {
    on<ChefActiveAccountPageInitiated>(
      _onChefActiveAccountPageInitiated,
      transformer: log(),
    );
  }


  FutureOr<void> _onChefActiveAccountPageInitiated(
    ChefActiveAccountPageInitiated event,
    Emitter<ChefActiveAccountState> emit,
  ) async {
    
  }
}
