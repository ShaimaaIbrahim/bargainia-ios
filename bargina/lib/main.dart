import 'package:bargina/Locator.dart';
import 'package:bargina/routes/AppRouter.dart';
import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

String? currentIso;
String? country;

const platform = MethodChannel("com.app.bargina");

final _configuration = PurchasesConfiguration('appl_hCilqkZBUqNJuyOtaSDBfihWnmv');


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();

  await Purchases.configure(_configuration);
  print("userId: ${ await Purchases.appUserID}");


  SharedPreferences prefs = await SharedPreferences.getInstance();
  currentIso =
  await Future.value(prefs.getString('default_language_iso') ?? 'ar');
  country =
  await Future.value(prefs.getString('default_language_country') ?? 'EG');


  print('logs');
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US'),],
      saveLocale: true,
      path: 'assets/translations',
      startLocale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: tr('app_name'),
          theme: ThemeData(
              fontFamily: 'jannah',
              primarySwatch: Colors.indigo,
              textTheme: GoogleFonts.cairoTextTheme(
                Theme.of(context).textTheme,
              ),
              checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.all(additionColor),
              )
          ),
          initialRoute: RouteName.SPLASH,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
        ));
  }
}

