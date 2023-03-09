import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class CustomeNumberPicker extends StatelessWidget {
  HomeViewModel viewModel;
   CustomeNumberPicker({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      //height: 22.h,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
        border: Border.all(color: HexColor('#D4D4D4'), width: 1.w)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 5.w),
        child: Row(
          children: [
            bold14Text(viewModel.quantity.toString()),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_drop_up_outlined, size: 20.w,).onTap((){
                  viewModel.increseQuantity();
                }),
                Icon(Icons.arrow_drop_down,size: 20.w,).onTap((){
                  viewModel.decreseQuantity();
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
