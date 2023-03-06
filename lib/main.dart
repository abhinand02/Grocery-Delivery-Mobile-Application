import 'package:flutter/material.dart';
import 'package:grocery_delivery_mobile_app/Constant/colors.dart';
import 'package:grocery_delivery_mobile_app/Screens/HomeScreen/order_list.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: whiteClr),bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent.withOpacity(0),),),
      home: const OrderList(),);
  }
}