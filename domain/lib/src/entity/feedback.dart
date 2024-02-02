import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback.freezed.dart';
  
@freezed
class Feedback with _$Feedback {
    const factory Feedback({
        @Default(Feedback.defaultId) String id,
@Default(Feedback.defaultOrderId) String orderId,
@Default(Feedback.defaultContent) String content,
@Default(Feedback.defaultRating) int rating,
@Default(Feedback.defaultCreatedAt) String createdAt,
@Default(Feedback.defaultCreatedBy) String createdBy,
    }) = _User;
  
    static const defaultId = '';
static const defaultOrderId = '';
static const defaultContent = '';
static const defaultRating = 0;
static const defaultCreatedAt = '';
static const defaultCreatedBy = '';
}  
