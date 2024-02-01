import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../domain.dart';

part 'login_use_case.freezed.dart';

@Injectable()
class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput> {
  const LoginUseCase(this._repository, this._navigator);

  final Repository _repository;
  final AppNavigator _navigator;

  @protected
  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    // validate input
    if (!ValidationUtils.isValidEmail(input.email)) {
      throw const ValidationException(ValidationExceptionKind.invalidEmail);
    }

    if (!ValidationUtils.isValidPassword(input.password)) {
      throw const ValidationException(ValidationExceptionKind.invalidPassword);
    }

    try {
      //login firebase
      await _repository.login(email: input.email, password: input.password);

      final role = _repository.isDarkMode;
      if (role) {
        await _navigator.replace(const AppRouteInfo.chefMain());
      } else {
        await _navigator.replace(const AppRouteInfo.main());
      }
    } catch (e) {
      await _navigator.showDialog(
        AppPopupInfo.confirmDialog(
            message: "Email hoặc Mật khẩu không đúng!",
            onPressed: Func0(() async {
              await _navigator.pop();
              // navigator.push(const AppRouteInfo.main());
            })),
      );
      throw Exception("Email hoặc Mật khẩu không đúng!");
    }

    return const LoginOutput(isLoginSuccess: true);
  }
}

@freezed
class LoginInput extends BaseInput with _$LoginInput {
  const factory LoginInput({
    required String email,
    required String password,
  }) = _LoginInput;
}

@freezed
class LoginOutput extends BaseOutput with _$LoginOutput {
  // const LoginOutput._();

  const factory LoginOutput({
    @Default(false) bool isLoginSuccess,
  }) = _LoginOutput;
}
