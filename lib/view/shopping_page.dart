import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shopping_app/controller/cart_controller.dart';
import 'package:simple_shopping_app/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          /// Column 위젯 내에서 리스트뷰 위젯을 불러올경우 반드시 Expanded로 감싸야 정상출력됨
          Expanded(
            /// GetX가 ShoppingController을 listen -> 데이터 변경시 UI 변경
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.product.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.product[index].productName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(controller
                                        .product[index].productDescription),
                                  ],
                                ),
                                Text(
                                  "\$${controller.product[index].price}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation:
                                    MaterialStateProperty.resolveWith<double>(
                                  (Set<MaterialState> states) {
                                    // if the button is pressed the elevation is 10.0, if not
                                    // it is 5.0
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return 10.0;
                                    }
                                    return 5.0;
                                  },
                                ),
                              ),
                              onPressed: () {
                                /// CartController가 적용된 GetX UI가 빌드됨
                                cartController
                                    .addToItem(controller.product[index]);
                              },
                              child: const Text("Add to cart"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          /// Total Amount 글자가 FAB와 겹쳐서 위로 올리기 위함
          const SizedBox(
            height: 30,
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                "Total Amount : \$${controller.totalPrice}",
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            "${controller.count}",
            style: const TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
