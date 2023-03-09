import 'dart:async';

import 'package:bargina/services/navigation_service.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Locator.dart';
import 'colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkNetworkState() async{
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}

 retryConnection(fuction){
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result)  {
    if(result != ConnectivityResult.none) {
      fuction();
    }
  });
}

Widget widthSpace(double widthSpace) {
  return SizedBox(
    width: widthSpace,
  );
}

Widget heightSpace(double heightSpace) {
  return SizedBox(
    height: heightSpace,
  );
}

// String formatTimeStamp(Timestamp timestamp) {
//   var dt = timestamp.toDate().toUtc();
//   return dt.day.toString().trim() +
//       "/" +
//       dt.month.toString().trim() +
//       "/" +
//       dt.year.toString().trim();
// }
//
// Future<Position> getCurrentLocation() async{
//   return await GeolocatorPlatform.instance.getCurrentPosition();
//
// }

showDialoge(Widget widget , BuildContext context, {Color? color, Widget? title}){
  return showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (ctx) => AlertDialog(
      title: title,
      backgroundColor: Colors.transparent,
     // elevation: 0,
      content: widget,
    ),
  );
}

Future<void> loadingDialoge(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                // The loading indicator
                CircularProgressIndicator(
                  color: secondaryColor,
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}

showNoInternetDialoge( BuildContext context){
  return showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.transparent,
      // elevation: 0,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
          color: whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
         child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/no_internet.png', width: 50.w, height: 50.h,),
              heightSpace(10.h),
              bold20Text('Oops No Internet !'),
              heightSpace(10.h),
              reg14Text('looks like you are facing a temporary network interrution \n or check your connection', color: greyColor.withOpacity(0.5)),
              heightSpace(20.h),
              Image.asset('assets/icons/retry.png', width: 40.w, height: 40.h,).onTap((){
                 locator<NavigationService>().goBack();
                // function;
              }),
            ],
          )
        ),
      ),
    ),
  );
}

showSnackBar(message, context){
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}


showDatePickerFun(BuildContext  context) async{
  DateTime? pickedDate = await showDatePicker(
    context: context, //context of current state
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2101),

  );
  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
  return formattedDate;
}