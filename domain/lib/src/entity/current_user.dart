import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'current_user.freezed.dart';

@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    @Default(CurrentUser.defaultId) String id,
    @Default(CurrentUser.defaultEmail) String email,
    @Default(CurrentUser.defaultFullName) String fullName,
    @Default(CurrentUser.defaultAvatarUrl) String avatarUrl,
    @Default(CurrentUser.defaultPhone) String phone,
    @Default(CurrentUser.defaultIdentityCard) List<String> identityCard,
    @Default(CurrentUser.defaultBiography) String biography,
    @Default(CurrentUser.defaultWallet) int wallet,
    @Default(CurrentUser.defaultBirthday) String birthday,
    @Default(CurrentUser.defaultRole) String role,
    // @Default(CurrentUser.defaultRating) int rating,
    // @Default(CurrentUser.defaultTotalFeedbacks) int totalFeedbacks,
    // @Default(CurrentUser.defaultFeedbacks) List<Feedback> feedbacks,
    // @Default(CurrentUser.defaultTotalOrders) int totalOrders,
    // @Default(CurrentUser.defaultCreatedOn) String createdOn,
    // @Default(CurrentUser.defaultStatus) String status,
  }) = _User;

  

  static const defaultId = '';
  static const defaultEmail = '';
  static const defaultFullName = '';
  static const defaultAvatarUrl = '';
  static const defaultPhone = '';
  static const defaultIdentityCard = <String>[];
  static const defaultBiography = '';
  static const defaultWallet = 0;
  static const defaultBirthday = '';
  static const defaultRole = '';
  static const defaultRating = 0;
  static const defaultTotalFeedbacks = 0;
  static const defaultFeedbacks = <Feedback>[];
  static const defaultTotalOrders = 0;
  static const defaultCreatedOn = '';
  static const defaultStatus = '';
}
