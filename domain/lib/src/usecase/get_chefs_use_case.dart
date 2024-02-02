import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_chefs_use_case.freezed.dart';

@Injectable()
class GetChefsUseCase extends BaseFutureUseCase<GetChefsInput, GetChefsOutput> {
  const GetChefsUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<GetChefsOutput> buildUseCase(GetChefsInput input) async {
    final result = await _repository.getChefs();
    if (result == null) {
      throw Exception();
    }
    return GetChefsOutput(chefs: result);
  }
}

@freezed
class GetChefsInput extends BaseInput with _$GetChefsInput {
  const factory GetChefsInput({
    required int id,
  }) = _GetChefsInput;
}

@freezed
class GetChefsOutput extends BaseOutput with _$GetChefsOutput {
  const GetChefsOutput._();

  const factory GetChefsOutput({
    @Default([]) List<CurrentUser> chefs,
  }) = _GetChefsOutput;
}
