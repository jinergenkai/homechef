import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'get_current_user_use_case.freezed.dart';

@Injectable()
class GetCurrentUserUseCase extends BaseFutureUseCase<GetCurrentUserInput, GetCurrentUserOutput> {
  const GetCurrentUserUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<GetCurrentUserOutput> buildUseCase(GetCurrentUserInput input) async {
    final result = _repository.getUserPreference();
    return GetCurrentUserOutput(user: result);
  }
}

@freezed
class GetCurrentUserInput extends BaseInput with _$GetCurrentUserInput {
  const factory GetCurrentUserInput({
    required int id,
  }) = _GetCurrentUserInput;
}

@freezed
class GetCurrentUserOutput extends BaseOutput with _$GetCurrentUserOutput {
  const GetCurrentUserOutput._();

  const factory GetCurrentUserOutput({
    @Default(CurrentUser()) CurrentUser user,
  }) = _GetCurrentUserOutput;
}
