import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_addresses_use_case.freezed.dart';

@Injectable()
class GetAddressesUseCase extends BaseFutureUseCase<GetAddressesInput, GetAddressesOutput> {
  const GetAddressesUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<GetAddressesOutput> buildUseCase(GetAddressesInput input) async {
    final result = await _repository.getAddresses(_repository.getUserPreference().id);
    if (result == null) {
      return const GetAddressesOutput();
    }
    return GetAddressesOutput(addresses: result);
  }
}

@freezed
class GetAddressesInput extends BaseInput with _$GetAddressesInput {
  const factory GetAddressesInput() = _GetAddressesInput;
}

@freezed
class GetAddressesOutput extends BaseOutput with _$GetAddressesOutput {
  const GetAddressesOutput._();

  const factory GetAddressesOutput({
    @Default([]) List<Address> addresses,
  }) = _GetAddressesOutput;
}
