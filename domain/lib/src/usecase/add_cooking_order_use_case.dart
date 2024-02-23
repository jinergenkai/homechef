import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'add_cooking_order_use_case.freezed.dart';

@Injectable()
class AddCookingOrderUseCase extends BaseFutureUseCase<AddCookingOrderInput, AddCookingOrderOutput> {
  const AddCookingOrderUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<AddCookingOrderOutput> buildUseCase(AddCookingOrderInput input) async {
    final result = await _repository.addCookingOrder(input.cookingOrder);

    return AddCookingOrderOutput();
  }
}

@freezed
class AddCookingOrderInput extends BaseInput with _$AddCookingOrderInput {
  const factory AddCookingOrderInput({
    required CookingOrder cookingOrder,
  }) = _AddCookingOrderInput;
}

@freezed
class AddCookingOrderOutput extends BaseOutput with _$AddCookingOrderOutput {
  const AddCookingOrderOutput._();

  const factory AddCookingOrderOutput() = _AddCookingOrderOutput;
}
