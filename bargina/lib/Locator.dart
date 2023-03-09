import 'package:bargina/screens/auth/viewmodel/auth_view_model.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/screens/main/cart/viewmodel/cart_viewmodel.dart';
import 'package:bargina/screens/main/home/viewmodel/add_discount_viewmodel.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/screens/main/search/viewmodel/search_viewmodel.dart';
import 'package:bargina/screens/main/viewmodel/main_viewmodel.dart';
import 'package:bargina/services/api_services.dart';
import 'package:bargina/services/db_services.dart';
import 'package:bargina/services/firebase_services.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => SharedPreferencesServices());
  locator.registerLazySingleton(() => DbServices());
  locator.registerLazySingleton(() => FirebaseServices());

  locator.registerFactory(() => BaseViewModel());
  locator.registerFactory(() => CartViewModel());
  locator.registerFactory(() => SearchViewModel());
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => AuthViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => AccountViewModel());
  locator.registerFactory(() => AddDiscountViewmodel());
  initSingleton();
}

void initSingleton() {
  locator<SharedPreferencesServices>().init();
  locator<DbServices>().initializeDB();
}