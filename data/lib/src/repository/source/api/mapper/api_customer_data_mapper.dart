import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiCustomerDataMapper extends BaseDataMapper<ApiCustomerData, Customer> {
  ApiCustomerDataMapper(this._apiFeedbackDataMapper);

  ApiFeedbackDataMapper _apiFeedbackDataMapper;

  @override
  Customer mapToEntity(ApiCustomerData? data) {
    return Customer(
      id: data?.id ?? Customer.defaultId,
      email: data?.email ?? Customer.defaultEmail,
      fullName: data?.fullName ?? Customer.defaultFullName,
      avatarUrl: data?.avatarUrl ?? Customer.defaultAvatarUrl,
      phone: data?.phone ?? Customer.defaultPhone,
      identityCard: data?.identityCard ?? Customer.defaultIdentityCard,
      biography: data?.biography ?? Customer.defaultBiography,
      wallet: data?.wallet ?? Customer.defaultWallet,
      birthday: data?.birthday ?? Customer.defaultBirthday,
      role: data?.role ?? Customer.defaultRole,
      rating: data?.rating ?? Customer.defaultRating,
      totalFeedbacks: data?.totalFeedbacks ?? Customer.defaultTotalFeedbacks,
      feedbacks: data?.feedbacks?.map((e) => _apiFeedbackDataMapper.mapToEntity(e)).toList() ?? Customer.defaultFeedbacks,
      totalOrders: data?.totalOrders ?? Customer.defaultTotalOrders,
      createdOn: data?.createdOn ?? Customer.defaultCreatedOn,
      status: data?.status ?? Customer.defaultStatus,
    );
  }
}
