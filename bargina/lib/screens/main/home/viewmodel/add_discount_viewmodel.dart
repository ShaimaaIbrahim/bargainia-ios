
import 'package:bargina/utils/common_functions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../enums/ScreenState.dart';
import '../../../../models/Resources.dart';
import '../../../../models/Status.dart';
import '../../../../services/api_services.dart';
import '../../../auth/model/Fee_model.dart';
import '../../BaseViewModel.dart';

class AddDiscountViewmodel extends BaseViewModel{

  final ApiService _apiService = ApiService();
  FeeModel? fees;

  TextEditingController discountController = TextEditingController();
  TextEditingController feebarginatController = TextEditingController();
  TextEditingController countryFeeController = TextEditingController();
  TextEditingController totalController= TextEditingController();

  void calculateTotal(_) {
    totalController.text = (int.parse(_) + int.parse(countryFeeController.text) + int.parse(feebarginatController.text)).toString();
    notifyListeners();
  }

  void getFees(BuildContext context) async{
    setState(ViewState.Busy);
    Resource<FeeModel> response = await _apiService.getFees();
    switch (response.status) {
      case Status.SUCCESS:
        fees = response.data;
        feebarginatController.text = fees!.barginiaFee!;
        countryFeeController.text = fees!.fee!;
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        feebarginatController.text = '';
        break;
    }
    // setState(ViewState.Idle);
  }

  void addDiscount(BuildContext context , String startDate, String endDate, productId) async{
    setState(ViewState.Busy);
    Resource<dynamic> response = await _apiService.addDiscount(productId, discountController.text, startDate, endDate, totalController.text);
    switch (response.status) {
      case Status.SUCCESS:
        showSnackBar(response.data, context);
        setState(ViewState.Idle);
        break;
      case Status.ERROR:
        showSnackBar(response.data, context);
        break;
    }
  }

}