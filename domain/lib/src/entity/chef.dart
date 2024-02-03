import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'chef.freezed.dart';
  
@freezed
class Chef with _$Chef {
    const factory Chef({
        @Default(Chef.defaultId) String id,
@Default(Chef.defaultEmail) String email,
@Default(Chef.defaultFullName) String fullName,
@Default(Chef.defaultAvatarUrl) String avatarUrl,
@Default(Chef.defaultPhone) String phone,
@Default(Chef.defaultIdentityCard) List<String> identityCard,
@Default(Chef.defaultBiography) String biography,
@Default(Chef.defaultWallet) int wallet,
@Default(Chef.defaultBirthday) String birthday,
@Default(Chef.defaultRole) String role,
@Default(Chef.defaultRating) int rating,
@Default(Chef.defaultTotalFeedbacks) int totalFeedbacks,
@Default(Chef.defaultFeedbacks) List<Feedback> feedbacks,
@Default(Chef.defaultTotalOrders) int totalOrders,
@Default(Chef.defaultCreatedOn) String createdOn,
@Default(Chef.defaultStatus) String status,
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
