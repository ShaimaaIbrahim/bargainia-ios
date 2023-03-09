import 'package:bargina/screens/main/account/model/transfer_model.dart';
import 'package:bargina/utils/common_functions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
class TransferListItem extends StatelessWidget {
  Transfers transfer;
   TransferListItem({Key? key, required this.transfer }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              offset: const Offset(
                0.0,
                5.0,
              ),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                reg18Text('${transfer.totalAmount!} SAR', color: HexColor('#1E272E')),
                Spacer(),
                reg14Text(transfer.status!, color: additionColor),
              ],
            ),
            heightSpace(7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Expanded(
                //   flex: 2,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       normal14Text('Alahly Bank', color: additionColor),
                //       normal14Text('Sept 18, 2021', color: additionColor)
                //     ],
                //   ),
                // ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reg14Text(transfer.bankName! , color: additionColor),
                      reg14Text(transfer.created ?? transfer.accountNumber!, color: additionColor)
                    ],
                  ),
                ),
                Spacer(),
                CachedNetworkmage(url: transfer.image?? 'https://phplaravel-425085-2297893.cloudwaysapps.com/storage/uploads/tmpphphlzcnw.png', width: 27.w, height: 37.h,),

              ],
            )
          ],
        ),
      ),

    );
  }
}
