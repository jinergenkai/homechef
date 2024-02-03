import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiChefDataMapper extends BaseDataMapper<ApiChefData, Chef> {

  ApiChefDataMapper(this._apiFeedbackDataMapper);

  final ApiFeedbackDataMapper _apiFeedbackDataMapper;

    @override
    Chef mapToEntity(ApiChefData? data) {
      return Chef(
        id: data?.id ?? Chef.defaultId,
email: data?.email ?? Chef.defaultEmail,
fullName: data?.fullName ?? Chef.defaultFullName,
avatarUrl: data?.avatarUrl ?? Chef.defaultAvatarUrl,
phone: data?.phone ?? Chef.defaultPhone,
identityCard: data?.identityCard ?? Chef.defaultIdentityCard,
biography: data?.biography ?? Chef.defaultBiography,
wallet: data?.wallet ?? Chef.defaultWallet,
birthday: data?.birthday ?? Chef.defaultBirthday,
role: data?.role ?? Chef.defaultRole,
rating: data?.rating ?? Chef.defaultRating,
totalFeedbacks: data?.totalFeedbacks ?? Chef.defaultTotalFeedbacks,
// feedbacks: data?.feedbacks ?? Chef.defaultFeedbacks,
feedbacks: _apiFeedbackDataMapper.mapToListEntity(data?.feedbacks),
totalOrders: data?.totalOrders ?? Chef.defaultTotalOrders,
createdOn: data?.createdOn ?? Chef.defaultCreatedOn,
status: data?.status ?? Chef.defaultStatus,
      );
    }
}  
