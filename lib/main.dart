import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app_flutter_getx_firebase/app/routes/app_pages.dart';
import 'package:note_app_flutter_getx_firebase/services/shared_preference.dart';
import 'package:note_app_flutter_getx_firebase/theme/app_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  PrefService prefService = PrefService();
  await prefService.prefInit();

  String isLogin = prefService.getIdCustomer ?? '';
  log(isLogin.toString(), name: "isLogin");
  String initialRoutes = isLogin == '' ? Routes.LOGIN : Routes.HOME;

  runApp(MyApp(initialRoutes: initialRoutes));
}

class MyApp extends StatelessWidget {
  final String initialRoutes;

  const MyApp({super.key, required this.initialRoutes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.system,
      initialRoute: initialRoutes,
      getPages: AppPages.routes,
    );
  }
}
