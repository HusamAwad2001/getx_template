import 'package:flutter/material.dart';
import 'package:flutter_template/routes/pages.dart';
import '../routes/routes.dart';
import 'package:get/get.dart';
import '../core/storage.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Storage.getData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      title: 'Flutter Template',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splashScreen,
      getPages: Pages.getPages(),
    );
  }
}
