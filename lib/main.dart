import 'package:flutter/material.dart';
import 'package:simple_shopping_app/view/shopping_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,

        /// elevatedButtonTheme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            /// MaterialStateProperty : 다양한 상태에 대해 다양한 스타일을 지정할 수 있도록 하는 것
            /// resolveWith<Color?> : 버튼 이벤트에 따라 색상지정
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              /// 위젯의 상태를 나타내는 states 객체를 매개변수 받음
              (Set<MaterialState> states) {
                /// MaterialState.pressed == 위젯이 눌린 상태
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                }

                /// 위젯이 눌린 상태가 아니라면 기본 색상 적용
                return null; // Use the component's default.
              },
            ),

            /// MaterialStateProperty.all() : 위젯의 모든 상태에 대해 동일한 값을 반환
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
      ),
      home: ShoppingPage(),
    );
  }
}
