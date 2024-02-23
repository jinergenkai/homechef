import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'change_cooking_order_use_case.freezed.dart';

@Injectable()
class ChangeCookingOrderUseCase extends BaseFutureUseCase<ChangeCookingOrderInput, ChangeCookingOrderOutput> {
  const ChangeCookingOrderUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<ChangeCookingOrderOutput> buildUseCase(ChangeCookingOrderInput input) async {
    final result = await _repository.changeCookingOrder(input.orderStatus, input.cookingOrder);

    return ChangeCookingOrderOutput();
  }
}

@freezed
class ChangeCookingOrderInput extends BaseInput with _$ChangeCookingOrderInput {
  const factory ChangeCookingOrderInput({
    required int orderStatus,
    required CookingOrder cookingOrder,
  }) = _ChangeCookingOrderInput;
}

@freezed
class ChangeCookingOrderOutput extends BaseOutput with _$ChangeCookingOrderOutput {
  const ChangeCookingOrderOutput._();

  const factory ChangeCookingOrderOutput() = _ChangeCookingOrderOutput;
}
