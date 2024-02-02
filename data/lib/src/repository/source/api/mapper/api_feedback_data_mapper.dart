import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiFeedbackDataMapper extends BaseDataMapper<ApiFeedbackData, Feedback> {
    @override
    Feedback mapToEntity(ApiFeedbackData? data) {
      return Feedback(
        id: data?.id ?? Feedback.defaultId,
orderId: data?.orderId ?? Feedback.defaultOrderId,
content: data?.content ?? Feedback.defaultContent,
rating: data?.rating ?? Feedback.defaultRating,
createdAt: data?.createdAt ?? Feedback.defaultCreatedAt,
createdBy: data?.createdBy ?? Feedback.defaultCreatedBy,
      );
    }
}  
