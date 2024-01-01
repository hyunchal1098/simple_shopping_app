import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          /// Column 위젯 내에서 리스트뷰 위젯을 불러올경우 반드시 Expanded로 감싸야 정상출력됨
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "물건이름",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                Text("상품설명"),
                              ],
                            ),
                            Text(
                              "\$30",
                              style: TextStyle(
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
                                if (states.contains(MaterialState.pressed)) {
                                  return 10.0;
                                }
                                return 5.0;
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Add to cart"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Total Amount : \$30",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
