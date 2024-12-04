import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:football_history/copy/start_page.dart';
import 'package:football_history/copy/utils.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<IndexController>(
      create: (context) => IndexController(),
      child: const CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.dark),
        home: GetMaterialApp(
          home: StartPage(),
        ),
      ),
    ),
  );
}
