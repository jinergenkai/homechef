import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_cooking_orders_use_case.freezed.dart';

@Injectable()
class GetCookingOrdersUseCase extends BaseFutureUseCase<GetCookingOrdersInput, GetCookingOrdersOutput> {
  const GetCookingOrdersUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<GetCookingOrdersOutput> buildUseCase(GetCookingOrdersInput input) async {
    final result = await _repository.getCookingOrders();
    return GetCookingOrdersOutput(cookingOrders: result);
  }
}

@freezed
class GetCookingOrdersInput extends BaseInput with _$GetCookingOrdersInput {
  const factory GetCookingOrdersInput() = _GetCookingOrdersInput;
}

@freezed
class GetCookingOrdersOutput extends BaseOutput with _$GetCookingOrdersOutput {
  const GetCookingOrdersOutput._();

  const factory GetCookingOrdersOutput({
    @Default([]) List<CookingOrder> cookingOrders,
  }) = _GetCookingOrdersOutput;
}
