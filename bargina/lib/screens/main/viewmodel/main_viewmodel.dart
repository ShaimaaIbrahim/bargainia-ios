import 'package:bargina/screens/auth/model/login_model.dart';
import 'package:bargina/screens/main/model/about_us_model.dart';
import 'package:bargina/services/api_services.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../Locator.dart';
import '../../../enums/ScreenState.dart';
import '../../../models/Resources.dart';
import '../../../models/Status.dart';
import '../../../services/db_services.dart';
import '../../../services/shared_prefrence_services.dart';
import '../../../utils/common_functions.dart';
import '../../auth/data/my_account_model.dart';
import '../BaseViewModel.dart';
import 'package:bargina/screens/auth/data/products/all_categories_model.dart';
import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/cupertino.dart';

import '../cart/model/cart_entity.dart';
import '../model/terms_conditions_model.dart';
class MainViewModel extends BaseViewModel{

  int current=0;

  final ApiService _apiService = ApiService();

  LoginModel? loginModel;

  TermsConditionsModel? termsConditionsModel;
  AboutUsModel? aboutUsModel;
  List<dynamic>? categories;
  MyAccountModel? myAccountModel;
  List<dynamic>? like4CardCategories;
  List<bool> checkCategory =[];
  List<CartEntity>? cartItems;
  List<dynamic>? products;
  List<dynamic>? filters;
  List<dynamic>? sellsubcat;

  setCurrent(int ind){
    current = ind;
    notifyListeners();
  }



  void getTerms(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<TermsConditionsModel> response = await _apiService.getTerms();
    switch (response.status) {
      case Status.SUCCESS:
        termsConditionsModel= response.data;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  Future<void> getCategories(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState()==true){
      Resource<List<dynamic>> response = await _apiService.getAllCategories();
      switch (response.status) {
        case Status.SUCCESS:
          categories = response.data!;
          selectedCategory = categories![0];
          categories!.forEach((element) {
            checkCategory.add(false);
          });
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          categories = [];
          setState(ViewState.Idle);
         // showSnackBar(response.errorMessage!, context);
          break;
      }
    }else{
     setState(ViewState.NOINTERNET);
    }
  }
  //LIKE 4 CARDS=================
  Future<void> getLike4CardsCategories(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState()==true){
      Resource<List<dynamic>> response = await _apiService.getLike4CardCategories();
      switch (response.status) {
        case Status.SUCCESS:
          like4CardCategories = response.data!;
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          like4CardCategories =[];
          setState(ViewState.Idle);
          break;
      }
    }else{
     setState(ViewState.NOINTERNET);
    }
  }

  dynamic selectedCategory;

  void setSelectedCategory(BuildContext context, id, int i) {
    selectedCategory = products![i];
    getSellSubCategories(context, id);
    notifyListeners();
  }



  void aboutUs(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<AboutUsModel> response = await _apiService.aboutUs();
    switch (response.status) {
      case Status.SUCCESS:
        aboutUsModel = response.data;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        setState(ViewState.Idle);
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }


  void getSellCategories(BuildContext context) async{
    setState(ViewState.Busy);
    if(await checkNetworkState() == true){
      Resource<List<dynamic>> response = await _apiService.getSellCategories();
      switch (response.status) {
        case Status.SUCCESS:
          products = response.data!;
          selectedCategory = products![0];
          getSellSubCategories(context, selectedCategory.id);
          setState(ViewState.Idle);
          break;
        case Status.ERROR:
          setState(ViewState.Idle);
         // showSnackBar(response.errorMessage!, context);
          break;
      }
    }else{
     setState(ViewState.NOINTERNET);
    }
  }

  void getSellSubCategories(BuildContext context, int id) async{
    setState(ViewState.Busy);
    Resource<List<dynamic>> response = await _apiService.getSellSubCategories(id);
    switch (response.status) {
      case Status.SUCCESS:
        sellsubcat = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  getCartItems() async{
    cartItems = await locator<DbServices>().retrieveCartItems();
    notifyListeners();
  }

  // void getUser() async{
  //   Future.delayed(const Duration(milliseconds: 100)).then((value) async{
  //     loginModel= await locator<SharedPreferencesServices>().getUserAuthInfo();
  //     setState(ViewState.Idle);
  //   });
  // }
  //
  Future<void> getMyAccount(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<MyAccountModel> response = await _apiService.getMyAccount();
    switch (response.status) {
      case Status.SUCCESS:
        myAccountModel = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
       // showSnackBar(response.errorMessage!, context);
        break;
    }
  }
}