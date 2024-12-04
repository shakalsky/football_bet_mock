import 'package:bets/start_page.dart';
import 'package:bets/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<IndexController>(
      create: (context) => IndexController(),
      child: const GetMaterialApp(
        home: StartPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
