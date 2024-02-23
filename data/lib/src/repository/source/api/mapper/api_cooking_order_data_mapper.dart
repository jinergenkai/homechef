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
    this._apiAddressDataMapper,
  );

  ApiChefDataMapper _apiChefDataMapper;
  ApiCustomerDataMapper _apiCustomerDataMapper;
  ApiTransactionDataMapper _apiTransactionDataMapper;
  ApiDishDataMapper _apiDishDataMapper;
  ApiAddressDataMapper _apiAddressDataMapper;


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
note: data?.note ?? CookingOrder.defaultNote,
intialTransactionMethod: data?.intialTransactionMethod ?? CookingOrder.defaultIntialTransactionMethod,
rejectReason: data?.rejectReason ?? CookingOrder.defaultRejectReason,
cookedTime: data?.cookedTime ?? CookingOrder.defaultCookedTime,
cookedHour: data?.cookedHour ?? CookingOrder.defaultCookedHour,
addressId: data?.addressId ?? CookingOrder.defaultAddressId,
address: _apiAddressDataMapper.mapToEntity(data?.address),
      );
    }
}  
