import 'package:get/get.dart';
import 'package:simple_shopping_app/model/product.dart';

class CartController extends GetxController {
  /// add한 아이템을 담을 Product 타입의 데이터 리스트
  var cartItems = <Product>[].obs;

  /// late를 제거하면 에러가 발생하는데 totalPrice를 초기화하기전엔 엑세스가 불가능 하므로 late로 나중에 초기화 하겠다고 해줌
  // late double totalPrice = cartItems.fold(0, (e, item) => e + item.price);
  /// 위 방법도 있지만 아에 getter로 만들어버려서 사용하는 곳에서, 합계를 getter로 접근할 수 있게함
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
