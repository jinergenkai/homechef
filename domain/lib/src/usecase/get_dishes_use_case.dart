import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_dishes_use_case.freezed.dart';

@Injectable()
class GetDishesUseCase extends BaseFutureUseCase<GetDishesInput, GetDishesOutput> {
  const GetDishesUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<GetDishesOutput> buildUseCase(GetDishesInput input) async {
    final result = await _repository.getDishes();
    return GetDishesOutput(dishes: result);
  }
}

@freezed
class GetDishesInput extends BaseInput with _$GetDishesInput {
  const factory GetDishesInput() = _GetDishesInput;
}

@freezed
class GetDishesOutput extends BaseOutput with _$GetDishesOutput {
  const GetDishesOutput._();

  const factory GetDishesOutput({
    @Default([]) List<Dish> dishes,
  }) = _GetDishesOutput;
}
