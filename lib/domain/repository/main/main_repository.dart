
import 'package:main/data/product/product_model.dart';

abstract class MainRepository{
  Future<List<ProductModel>> getProducts();
}