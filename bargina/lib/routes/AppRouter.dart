import 'package:bargina/screens/main/aboutapp_screen.dart';
import 'package:bargina/screens/auth/forgetpassword_screen.dart';
import 'package:bargina/screens/auth/signin_screen.dart';
import 'package:bargina/screens/auth/vendor_register.dart';
import 'package:bargina/screens/auth/vendor_register_contract.dart';
import 'package:bargina/screens/main/account/account_transfer.dart';
import 'package:bargina/screens/main/account/delete_account_page.dart';
import 'package:bargina/screens/main/account/language_page.dart';
import 'package:bargina/screens/main/account/my_account_screen.dart';
import 'package:bargina/screens/main/account/orders/my_orders.dart';
import 'package:bargina/screens/main/account/my_products.dart';
import 'package:bargina/screens/main/home/buy_now_screen.dart';
import 'package:bargina/screens/main/home/pages/add_discount_page.dart';
import 'package:bargina/screens/main/home/product_details_page.dart';
import 'package:bargina/screens/main/home/sellon_bargina_screen.dart';
import 'package:bargina/screens/main/main_screen.dart';
import 'package:bargina/screens/main/search/search_items_page.dart';
import 'package:bargina/screens/main/support_screen.dart';
import 'package:bargina/screens/main/termsconditions.dart';
import 'package:bargina/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/main/account/shipping_address.dart';
import '../screens/main/account/update_password_screen.dart';
import 'RoutesNames.dart';
import 'RoutingData.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    print('settings.name ${settings.name}');

    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    print("objecttype = ${routingData['order_id'].runtimeType}");
    print("id object= ${routingData['order_id']}");
    print("area object= ${routingData['area']}");

    switch (routingData.route) {

      case RouteName.SPLASH:
        return _getPageRoute(SplashScreen(), settings);

      case RouteName.SignIn:
        return _getPageRoute(SignInScreen(), settings);

      case RouteName.SignUp:
        return _getPageRoute(SignUpScreen(), settings);

      case RouteName.ForgetPassword:
        return _getPageRoute(ForgetPasswordScreen(), settings);


      case RouteName.MainPage:
        return _getPageRoute(MainScreen(), settings);

      case RouteName.VendorRegister:
        return _getPageRoute(VendorRegisterScreen(), settings);

      case RouteName.VendorRegisterContract:
        return _getPageRoute(VendorRegisterContractPage(), settings);

      case RouteName.BuyNow:
        return _getPageRoute(BuyNowScreen(), settings);

      case RouteName.SellonBargina:
        return _getPageRoute(SellonBarginaScreen(), settings);

      case RouteName.delete:
        return _getPageRoute(DeleteAccountPage(), settings);

      case RouteName.UpdatePassword:
        return _getPageRoute(UpdatePasswordScreen(), settings);

      case RouteName.MyAccount:
        return _getPageRoute(MyAccountScreen(), settings);

      case RouteName.ProductsDetails:
        return _getPageRoute(ProductDetailsScreen(), settings);

      case RouteName.LangPage:
        return _getPageRoute(LanguagePage(), settings);

      case RouteName.ShippingAddress:
        return _getPageRoute(ShippinAddressScreen(), settings);

      case RouteName.MyProducts:
        return _getPageRoute(MyProductsScreen(), settings);

      case RouteName.MyOrders:
        return _getPageRoute(MyOrdersPage(), settings);

      case RouteName.Support:
        return _getPageRoute(SupportScreen(), settings);

      case RouteName.TermsConditions:
        return _getPageRoute(TermsConditionsScreen(), settings);

      case RouteName.AboutApp:
        return _getPageRoute(AboutAppScreen(), settings);

      case RouteName.SEARCH:
        return _getPageRoute(SearchItemsPage(), settings);

      // case RouteName.SEARCHResults:
      //   return _getPageRoute(SearchResultsPage(), settings);

      case RouteName.AccountTransfer:
        return _getPageRoute(AccountTransferPage(), settings);

      // case RouteName.addDiscount:
      //   return _getPageRoute(AddDiscountPage(productId: productId), settings);

      default:
        return _getPageRoute(SplashScreen(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
