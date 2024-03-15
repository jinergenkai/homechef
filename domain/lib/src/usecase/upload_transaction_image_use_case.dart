import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'upload_transaction_image_use_case.freezed.dart';

@Injectable()
class UploadTransactionImageUseCase extends BaseFutureUseCase<UploadTransactionImageInput, UploadTransactionImageOutput> {
  const UploadTransactionImageUseCase(this._repository);

  final Repository _repository;

  @protected
  @override
  Future<UploadTransactionImageOutput> buildUseCase(UploadTransactionImageInput input) async {
    final result = await _repository.uploadTransactionImage(input.image, input.order);
    return UploadTransactionImageOutput();
  }
}

@freezed
class UploadTransactionImageInput extends BaseInput with _$UploadTransactionImageInput {
  const factory UploadTransactionImageInput({
    required File image,
    required CookingOrder order,
  }) = _UploadTransactionImageInput;
}

@freezed
class UploadTransactionImageOutput extends BaseOutput with _$UploadTransactionImageOutput {
  const UploadTransactionImageOutput._();

  const factory UploadTransactionImageOutput({
    @Default('') String xxx,
  }) = _UploadTransactionImageOutput;
}
