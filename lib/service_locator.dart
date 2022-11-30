
import 'package:dawn_app/Services/api_manager.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'controllers/theme_controller.dart';

final getIt = GetIt.instance;

void setupServiceLocators() {
  getIt.registerSingleton<IApiManager>(ApiManager());
  Get.lazyPut(()=>ThemeController());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}