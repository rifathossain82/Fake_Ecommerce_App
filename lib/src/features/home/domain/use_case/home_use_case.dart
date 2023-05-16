import 'package:fake_ecommerce_app/src/features/home/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/home/domain/repository/home_repository.dart';

class HomeUseCase{
  final HomeRepository homeRepository;
  HomeUseCase({required this.homeRepository});

  Future<List<ProductModel>> getProductList() async{
    return await homeRepository.getProductList();
  }
}