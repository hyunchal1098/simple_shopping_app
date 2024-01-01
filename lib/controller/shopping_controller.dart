import 'package:get/get.dart';
import 'package:simple_shopping_app/model/product.dart';

class ShoppingController extends GetxController {
  /// observable로 해주면 데이터가 변경되면 자동 UI 업데이트
  var product = <Product>[].obs;

  /// 클래스가 초기화될 때 호출되는 메서드
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    var productData = [
      Product(
        id: 1,
        productName: "Mouse",
        productDescription: "this is a Mouse.",
        price: 30,
      ),
      Product(
        id: 2,
        productName: "NoteBook",
        productDescription: "this is a NoteBook.",
        price: 40,
      ),
      Product(
        id: 3,
        productName: "Computor",
        productDescription: "this is a Computor.",
        price: 50,
      ),
      Product(
        id: 4,
        productName: "Speaker",
        productDescription: "this is a Speaker.",
        price: 60,
      ),
    ];
    /// obs인 product에 값 추가(전체 삭제해준후 추가)
    product.assignAll(productData);
  }
}
