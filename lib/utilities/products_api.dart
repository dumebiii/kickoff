import 'package:dio/dio.dart';
import 'package:kickoff/app/app.logger.dart';
import 'package:kickoff/model/product.dart';
import 'package:kickoff/ui/common/app_strings.dart';
import 'package:kickoff/utilities/api_handler/api.dart';
import 'package:kickoff/utilities/api_handler/dio_interceptor.dart';
import 'package:kickoff/utilities/api_handler/exceptions.dart';

class ProductService implements Products {
  final log = getLogger('ProductService');
  final dio = Dio();
  final _apiService = DioInterceptor();

  final postHeader = {
    'Content-Type': 'application/json',
    'cookie': 'session_id=ufe1nfq69mdi67pnql6n1cs3cv; path=/; HttpOnly=',
    'Access-Control-Allow-Credentials': 'true'
  };
  @override
  Future<Product> getProducts() async {
    const String getProductUrl =
        "$kgetproductUrl?organization_id=$korganizationID&reverse_sort=false&page=1&size=10&Appid=$kappID&Apikey=$kApiKey";

    var api = _apiService.api;

    try {
      final response = await api.get(
        getProductUrl,
        options: Options(headers: postHeader),
      );

      final data = response.data;

      print("Responseeeeeee Data: $data");

      Product mapProducts = Product.fromJson(data);

      print(mapProducts);

      return mapProducts;
    } on DioException catch (e) {
      return Future.error(AppException.handleError(e));
    } catch (e) {
      return Future.error(e);
    }
  }
}
