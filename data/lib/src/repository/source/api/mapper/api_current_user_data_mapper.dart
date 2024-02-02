import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiCurrentUserDataMapper extends BaseDataMapper<ApiCurrentUserData, CurrentUser> {

  ApiCurrentUserDataMapper(this._apiFeedbackDataMapper);

  ApiFeedbackDataMapper _apiFeedbackDataMapper;

  @override
  CurrentUser mapToEntity(ApiCurrentUserData? data) {
    return CurrentUser(
      id: data?.id ?? CurrentUser.defaultId,
      email: data?.email ?? CurrentUser.defaultEmail,
      fullName: data?.fullName ?? CurrentUser.defaultFullName,
      avatarUrl: data?.avatarUrl ?? CurrentUser.defaultAvatarUrl,
      phone: data?.phone ?? CurrentUser.defaultPhone,
      identityCard: data?.identityCard ?? CurrentUser.defaultIdentityCard,
      biography: data?.biography ?? CurrentUser.defaultBiography,
      wallet: data?.wallet ?? CurrentUser.defaultWallet,
      birthday: data?.birthday ?? CurrentUser.defaultBirthday,
      role: data?.role ?? CurrentUser.defaultRole,
      // rating: data?.rating ?? CurrentUser.defaultRating,
      // totalFeedbacks: data?.totalFeedbacks ?? CurrentUser.defaultTotalFeedbacks,
      // feedbacks: _apiFeedbackDataMapper.mapToListEntity(data?.feedbacks),
      // totalOrders: data?.totalOrders ?? CurrentUser.defaultTotalOrders,
      // createdOn: data?.createdOn ?? CurrentUser.defaultCreatedOn,
      // status: data?.status ?? CurrentUser.defaultStatus,
    );
  }
}
