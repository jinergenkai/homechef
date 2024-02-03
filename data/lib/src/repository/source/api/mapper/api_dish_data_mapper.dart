import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
  
import '../../../../../data.dart';
  
@Injectable()
class ApiDishDataMapper extends BaseDataMapper<ApiDishData, Dish> {
    @override
    Dish mapToEntity(ApiDishData? data) {
      return Dish(
        id: data?.id ?? Dish.defaultId,
name: data?.name ?? Dish.defaultName,
      );
    }
}  
