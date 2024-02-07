import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../app.dart';
import 'choose_menu.dart';

@Injectable()
class ChooseMenuBloc extends BaseBloc<ChooseMenuEvent, ChooseMenuState> {
  ChooseMenuBloc(
    this._getDishesUseCase,
  ) : super(const ChooseMenuState()) {
    on<ChooseMenuPageInitiated>(
      _onChooseMenuPageInitiated,
      transformer: log(),
    );

    on<PeopleChanged>(
      _onPeopleChanged,
      transformer: log(),
    );

    on<AddCourse>(
      _onAddCourse,
      transformer: log(),
    );

    on<ChooseMenuDishChanged>(
      _onChooseMenuDishChanged,
      transformer: log(),
    );

    on<NoteChanged>(
      _onNoteChanged,
      transformer: log(),
    );

    on<FlavorChanged>(
      _onFlavorChanged,
      transformer: log(),
    );
  }

  void _onPeopleChanged(
    PeopleChanged event,
    Emitter<ChooseMenuState> emit,
  ) {
    final changedPeople = (state.people + event.amount >= 0) ? state.people + event.amount : state.people;
    emit(state.copyWith(
      people: changedPeople,
      cookingOrder: state.cookingOrder.copyWith(quantity: changedPeople),
    ));
    print(state.cookingOrder);
    // print(state.menu);
    // print(state.dishes);
  }

  void _onChooseMenuDishChanged(
    ChooseMenuDishChanged event,
    Emitter<ChooseMenuState> emit,
  ) {
    final List<Dish> dishes = List.from(state.dishes);
    dishes[event.index] = event.dish;
    emit(state.copyWith(
      dishes: dishes,
      cookingOrder: state.cookingOrder.copyWith(
        price: state.cookingOrder.price + event.dish.price,
      )
    ));
  }

  void _onAddCourse(
    AddCourse event,
    Emitter<ChooseMenuState> emit,
  ) {
    // state.menu.add("1");
    // print(menu);
    emit(state.copyWith(
      dishes: [...state.dishes, state.menu.first],
      cookingOrder: state.cookingOrder.copyWith(
        price: state.cookingOrder.price + state.dishes.first.price,
      )
    ));
  }

  final GetDishesUseCase _getDishesUseCase;

  FutureOr<void> _onChooseMenuPageInitiated(
    ChooseMenuPageInitiated event,
    Emitter<ChooseMenuState> emit,
  ) async {
    return runBlocCatching(action: () async {
      final result = await _getDishesUseCase.execute(const GetDishesInput());
      emit(state.copyWith(
        menu: result.dishes,
      ));
    });
  }

  void _onNoteChanged(
    NoteChanged event,
    Emitter<ChooseMenuState> emit,
  ) {
    emit(state.copyWith(
      cookingOrder: state.cookingOrder.copyWith(note: event.note),
    ));
  }

  void _onFlavorChanged(
    FlavorChanged event,
    Emitter<ChooseMenuState> emit,
  ) {
    var iFlavor = flavors.indexOf(event.flavor);
    emit(state.copyWith(
      cookingOrder: state.cookingOrder.copyWith(dishType: iFlavor),
    ));
  }

  var flavors = [
    'Bắc',
    'Trung',
    'Nam',
  ];
}
