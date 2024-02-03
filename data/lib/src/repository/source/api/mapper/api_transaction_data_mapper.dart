import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiTransactionDataMapper extends BaseDataMapper<ApiTransactionData, Transaction> {
    @override
    Transaction mapToEntity(ApiTransactionData? data) {
      return Transaction(
        id: data?.id ?? Transaction.defaultId,
amount: data?.amount ?? Transaction.defaultAmount,
transactionMethod: data?.transactionMethod ?? Transaction.defaultTransactionMethod,
transactionType: data?.transactionType ?? Transaction.defaultTransactionType,
transactionStatus: data?.transactionStatus ?? Transaction.defaultTransactionStatus,
      );
    }
}  
