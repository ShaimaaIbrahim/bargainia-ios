import 'package:bargina/screens/auth/model/vendor_model.dart';
import 'package:bargina/screens/auth/password_email_token.dart';
import 'package:bargina/screens/auth/resetpass_page.dart';
import 'package:bargina/screens/auth/verification_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bargina/screens/auth/model/login_model.dart';
import 'package:bargina/screens/auth/model/register_model.dart';
import 'package:bargina/screens/auth/signup_screen.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/services/api_services.dart';
import 'package:bargina/services/shared_prefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Locator.dart';
import '../../../enums/ScreenState.dart';
import '../../../models/Resources.dart';
import '../../../models/Status.dart';
import '../../../routes/RoutesNames.dart';
import '../../../services/navigation_service.dart';
import '../../../utils/common_functions.dart';

class AuthViewModel extends BaseViewModel {
  ApiService _apiService = ApiService();
  SharedPreferencesServices _preferencesServices = SharedPreferencesServices();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  TextEditingController tokenController = TextEditingController();

  TextEditingController commircalNumberController = TextEditingController();
  TextEditingController vatNumberController = TextEditingController();
  TextEditingController bankNoController = TextEditingController();

  dynamic commircalNumberImage;
  dynamic vatNumberImage;

  Future<void> signUp(BuildContext context) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource<RegisterModel> response = await _apiService.register(
          phoneController.text,
          passwordController.text,
          confirmPassController.text,
          emailController.text,
          lastNameController.text,
          firstNameController.text);
      switch (response.status) {
        case Status.SUCCESS:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => VerificationScreen(phone: phoneController.text)));
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context,);
    }
  }

  Future<void> vendorSignUp(BuildContext context) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource<VendorModel> response = await _apiService.vendorRegister(
          phoneController.text,
          lastNameController.text,
          firstNameController.text,
          bankNoController.text,
          commircalNumberController.text,
          vatNumberController.text,
          vatNumberImage,
          commircalNumberImage);
      switch (response.status) {
        case Status.SUCCESS:
          locator<NavigationService>()
              .navigateTo(RouteName.VendorRegisterContract);
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context);
    }
  }

  Future<void> signIn(BuildContext context) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource<LoginModel> response = await _apiService.login(
          phoneController.text, passwordController.text);
      switch (response.status) {
        case Status.SUCCESS:
          _preferencesServices.storeAuthInfo(response.data!);
          Future.delayed(Duration(seconds: 2));
          //locator<NavigationService>().navigateTo(RouteName.MainPage);
          locator<NavigationService>().navigateToAndClearStack(RouteName.MainPage);
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context);
    }
  }

  Future<void> passwordEmail(BuildContext context) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource response = await _apiService.passwordEmail(emailController.text);
      switch (response.status) {
        case Status.SUCCESS:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PasswordEmailToken(email: emailController.text)));
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context);
    }
  }

  Future<void> passwordEmailToken(BuildContext context, email) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource response =
          await _apiService.passwordEmailToken(email, tokenController.text);
      switch (response.status) {
        case Status.SUCCESS:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ResetPassPage(token: tokenController.text)));
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context,);
    }
  }

  Future<void> resetPssword(BuildContext context, token) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource response = await _apiService.passwordReset(
          token, passwordController.text, confirmPassController.text);
      switch (response.status) {
        case Status.SUCCESS:
          locator<NavigationService>().navigateTo(RouteName.SignIn);
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context);
    }
  }

  Future<void> showChoiceDialog(BuildContext context, int i) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.indigo),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery(context, i);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.indigo,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.indigo,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context, i);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context, int i) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    switch (i) {
      case 1:
        commircalNumberImage = pickedFile;
        notifyListeners();
        break;
      case 2:
        vatNumberImage = pickedFile;
        notifyListeners();
        break;
    }
    Navigator.pop(context);
  }

  void _openCamera(BuildContext context, int i) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    switch (i) {
      case 1:
        commircalNumberImage = pickedFile;
        notifyListeners();
        break;
      case 2:
        vatNumberImage = pickedFile;
        notifyListeners();
        break;
    }
    Navigator.pop(context);
  }

  //01112356987
  Future<void> verifyCode(BuildContext context, phone, code) async {
    setState(ViewState.Busy);
    if (await checkNetworkState() == true) {
      Resource<dynamic> response = await _apiService.verifyCode(phone, code);
      switch (response.status) {
        case Status.SUCCESS:
          //_preferencesServices.storeAuthInfo(response.data!);
          locator<NavigationService>().navigateTo(RouteName.SignIn);
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
          showSnackBar(response.errorMessage!, context);
          break;
      }
    } else {
      setState(ViewState.Idle);
      showNoInternetDialoge(context);
    }
  }
}
