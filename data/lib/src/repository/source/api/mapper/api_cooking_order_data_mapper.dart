import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiCookingOrderDataMapper extends BaseDataMapper<ApiCookingOrderData, CookingOrder> {

  ApiCookingOrderDataMapper(
    this._apiChefDataMapper,
    this._apiCustomerDataMapper,
    this._apiTransactionDataMapper,
    this._apiDishDataMapper,
  );

  ApiChefDataMapper _apiChefDataMapper;
  ApiCustomerDataMapper _apiCustomerDataMapper;
  ApiTransactionDataMapper _apiTransactionDataMapper;
  ApiDishDataMapper _apiDishDataMapper;


    @override
    CookingOrder mapToEntity(ApiCookingOrderData? data) {
      return CookingOrder(
        id: data?.id ?? CookingOrder.defaultId,
// chef: data?.chef ?? CookingOrder.defaultChef,
chef: _apiChefDataMapper.mapToEntity(data?.chef),
// customer: data?.customer ?? CookingOrder.defaultCustomer,
customer: _apiCustomerDataMapper.mapToEntity(data?.customer),
status: data?.status ?? CookingOrder.defaultStatus,
transaction: data?.transaction?.map((e) => _apiTransactionDataMapper.mapToEntity(e)).toList() ?? CookingOrder.defaultTransaction,
totalPrice: data?.totalPrice ?? CookingOrder.defaultTotalPrice,
price: data?.price ?? CookingOrder.defaultPrice,
quantity: data?.quantity ?? CookingOrder.defaultQuantity,
option: data?.option ?? CookingOrder.defaultOption,
dish: data?.dish?.map((e) => _apiDishDataMapper.mapToEntity(e)).toList() ?? CookingOrder.defaultDish,
dishType: data?.dishType ?? CookingOrder.defaultDishType,
intialTransactionMethod: data?.intialTransactionMethod ?? CookingOrder.defaultIntialTransactionMethod,
rejectReason: data?.rejectReason ?? CookingOrder.defaultRejectReason,
      );
    }
}  