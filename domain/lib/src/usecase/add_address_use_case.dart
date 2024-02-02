import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'add_address_use_case.freezed.dart';

@Injectable()
class AddAddressUseCase extends BaseFutureUseCase<AddAddressInput, AddAddressOutput> {
  const AddAddressUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<AddAddressOutput> buildUseCase(AddAddressInput input) async {
    await _repository.addAddress(input.address);
    return const AddAddressOutput();
  }
}

@freezed
class AddAddressInput extends BaseInput with _$AddAddressInput {
  const factory AddAddressInput({
    required Address address,
  }) = _AddAddressInput;
}

@freezed
class AddAddressOutput extends BaseOutput with _$AddAddressOutput {
  const AddAddressOutput._();

  const factory AddAddressOutput() = _AddAddressOutput;
}
