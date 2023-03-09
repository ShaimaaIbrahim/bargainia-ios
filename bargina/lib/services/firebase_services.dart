import 'package:bargina/routes/RoutesNames.dart';
import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bargina/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Locator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/Resources.dart';
import '../models/Status.dart';
import '../utils/common_functions.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class FirebaseServices {

  final ApiService _apiService = locator<ApiService>();

 // var facebookLogin = FacebookLogin();

  FirebaseAuth auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  // loginFacebook(BuildContext context) async {
  //
  //
  //   var facebookLoginResult = await facebookLogin.logIn();
  //
     //loadingDialoge(context);
  //
  //   switch (facebookLoginResult.status) {
  //     case FacebookLoginStatus.error:
  //       locator<NavigationService>().goBack();
  //       showSnackBar('facebook  internal server error occured', context);
  //       break;
  //
  //     case FacebookLoginStatus.cancel:
  //       locator<NavigationService>().goBack();
  //       showSnackBar('facebook register canceled', context);
  //       break;
  //
  //     case FacebookLoginStatus.success:
  //       Response graphResponse = await Dio().get(
  //           'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken?.token}');
  //
  //       var data = json.decode(graphResponse.data);
  //       await socialRegister(
  //           context,
  //           data['email'] ?? '${data['first_name']}@fb.com',
  //           data['name'],
  //           data['id'],
  //           'facebook');
  //
  //       print('facebookGraphResponse is ${data['name']}');
  //       break;
  //   }
  // }

  signInWithGoogle({required BuildContext context}) async {
    googleSignIn.disconnect();

    loadingDialoge(context);

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        User? user = userCredential.user;

        socialRegister(context, user!.email ?? user.phoneNumber,
            user.displayName, user.uid, 'google');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          locator<NavigationService>().goBack();
          showSnackBar('account-exists-with-different-credential', context);
        } else if (e.code == 'invalid-credential') {
          locator<NavigationService>().goBack();
          showSnackBar(e.code, context);
        }
      } catch (e) {
        locator<NavigationService>().goBack();
        showSnackBar(e.toString(), context);
      }
    }
  }

  socialRegister(BuildContext context, email, name, profileId, provideName) async {
    loadingDialoge(context);
    Resource response = await _apiService.socialRegister(email, name, profileId, provideName);
    switch (response.status) {
      case Status.SUCCESS:
        locator<NavigationService>().goBack();
        locator<SharedPreferencesServices>()
            .storeAuthInfo(response.data)
            .then((value) {
          locator<NavigationService>()
              .navigateToAndClearStack(RouteName.MainPage);
          //locator<NavigationService>().goBack();
        });
        break;
      case Status.ERROR:
        if (response.errorMessage! == "Email  has already been taken.") {
          socialLogin(context, email);
        }
        break;
    }
   // locator<NavigationService>().goBack();
  }

  void logout(BuildContext context) async{
    await loadingDialoge(context);
    auth.signOut();
    //facebookLogin.logOut();
   // locator<NavigationService>().navigateToAndClearStack(RouteName.SignIn);
  }

  void socialLogin(BuildContext context, email) async{
    //loadingDialoge(context);
    Resource response = await _apiService.socialLogin(email);

    switch (response.status) {
      case Status.SUCCESS:
        locator<NavigationService>().goBack();
        locator<SharedPreferencesServices>()
            .storeAuthInfo(response.data)
            .then((value) {
          locator<NavigationService>()
              .navigateToAndClearStack(RouteName.MainPage);
        });
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage, context);
        break;
    }
    //locator<NavigationService>().goBack();
  }

  Future<User> signInWithApple({List<Scope> scopes = const [], BuildContext? context}) async {
    // 1. perform the sign-in request
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);
    // 2. check the result
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken: String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential = await auth.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
     //   if (scopes.contains(Scope.fullName)) {
          final fullName = firebaseUser.displayName ?? "user";
          final email = firebaseUser.email ?? "user@mail.com";

          socialRegister(context!, email ,
              fullName.toString().replaceAll(" ", "."), appleIdCredential.identityToken.toString().substring(0,10), 'apple');
       //   }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );

      case AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      default:
        throw UnimplementedError();
    }
  }
}
