import 'package:main/service/api_service.dart';
import '../../../../data/product/product_model.dart';
import '../main_repository.dart';

class MainRepositoryImpl extends MainRepository {
  final dio = ApiService().dio;

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;

        final products = data.map<ProductModel>((item) {
          try {
            return ProductModel.fromJson(item);
          } catch (e) {
            print('Error parsing product: $e');
            rethrow;
          }
        }).toList();

        print('Fetched products count: ${products.length}');
        return products;
      } else {
        print('Server error: ${response.statusCode}');
        return [];
      }
    } catch (e, stack) {
      print('Error fetching products: $e');
      print('Stack trace: $stack');
      return [];
    }
  }
}
