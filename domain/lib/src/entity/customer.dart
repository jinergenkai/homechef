import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'customer.freezed.dart';
  
@freezed
class Customer with _$Customer {
    const factory Customer({
        @Default(Customer.defaultId) String id,
@Default(Customer.defaultEmail) String email,
@Default(Customer.defaultFullName) String fullName,
@Default(Customer.defaultAvatarUrl) String avatarUrl,
@Default(Customer.defaultPhone) String phone,
@Default(Customer.defaultIdentityCard) List<String> identityCard,
@Default(Customer.defaultBiography) String biography,
@Default(Customer.defaultWallet) int wallet,
@Default(Customer.defaultBirthday) String birthday,
@Default(Customer.defaultRole) String role,
@Default(Customer.defaultRating) int rating,
@Default(Customer.defaultTotalFeedbacks) int totalFeedbacks,
@Default(Customer.defaultFeedbacks) List<Feedback> feedbacks,
@Default(Customer.defaultTotalOrders) int totalOrders,
@Default(Customer.defaultCreatedOn) String createdOn,
@Default(Customer.defaultStatus) String status,
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
