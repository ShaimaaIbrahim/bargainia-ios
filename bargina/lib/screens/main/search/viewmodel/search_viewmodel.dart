import 'dart:developer';

import 'package:bargina/screens/main/BaseViewModel.dart';
import 'package:bargina/services/api_services.dart';
import 'package:flutter/cupertino.dart';

import '../../../../Locator.dart';
import '../../../../enums/ScreenState.dart';
import '../../../../models/Resources.dart';
import '../../../../models/Status.dart';
import '../../../../services/shared_prefrence_services.dart';
import '../../../../utils/common_functions.dart';
import '../widget/chip_listitem.dart';



class SearchViewModel extends BaseViewModel{

  final ApiService _apiService = ApiService();
  List<dynamic>? products =[];
  List<String> searches =[];


  List<ChipListItem>  chips =[];
  Future<void> searchProducts(BuildContext context, String key) async{
    setState(ViewState.Busy);
    products= null;
    Resource<List<dynamic>> response = await _apiService.searchProducts(key);
    switch (response.status) {
      case Status.SUCCESS:
        products = response.data!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        products =[];
        setState(ViewState.Idle);
       // showSnackBar(response.errorMessage!, context);
        break;
    }
  }

  void saveSearch(String val) {
    locator<SharedPreferencesServices>().saveSearch(val);
  }

  void getSearch() {
    locator<SharedPreferencesServices>().getSearches().then((value) {
      searches = value;
      print('search is ${searches.length}');
      searches.forEach((element) {
         chips.add(ChipListItem(text: element,));
      });
      notifyListeners();

    });
  }

}