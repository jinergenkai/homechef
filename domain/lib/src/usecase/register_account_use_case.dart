import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../../domain.dart';

part 'register_account_use_case.freezed.dart';

@Injectable()
class RegisterAccountUseCase extends BaseFutureUseCase<RegisterAccountInput, RegisterAccountOutput> {
  const RegisterAccountUseCase(this._repository, this._navigator);

  final Repository _repository;
  final AppNavigator _navigator;

  @protected
  @override
  Future<RegisterAccountOutput> buildUseCase(RegisterAccountInput input) async {
    try {
      //login firebase
      await _repository.register(
        email: input.email,
        username: input.username,
        password: input.password,
        gender: input.gender,
        displayName: input.username,
      );
      await _navigator.replace(const AppRouteInfo.login());
    } catch (e) {
      await _navigator.showDialog(
        AppPopupInfo.confirmDialog(
            message: "Đăng ký không thành công!",
            onPressed: Func0(() async {
              await _navigator.pop();
              // navigator.push(const AppRouteInfo.main());
            })),
      );
      // throw Exception("Đăng ký không thành công!");
    }

    return const RegisterAccountOutput();
  }
}

@freezed
class RegisterAccountInput extends BaseInput with _$RegisterAccountInput {
  const factory RegisterAccountInput({
    required String username,
    required String email,
    required String password,
    required Gender gender,
  }) = _RegisterAccountInput;
}

@freezed
class RegisterAccountOutput extends BaseOutput with _$RegisterAccountOutput {
  const RegisterAccountOutput._();

  const factory RegisterAccountOutput() = _RegisterAccountOutput;
}
