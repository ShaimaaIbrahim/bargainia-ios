import 'package:bargina/enums/ScreenState.dart';
import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/extensions.dart';
import 'package:bargina/utils/texts.dart';
import 'package:bargina/widgets/rect_checkbox.dart';
import 'package:bargina/widgets/round_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/common_functions.dart';
import '../../search/search_results_page.dart';
import 'package:hexcolor/hexcolor.dart';
class FilterCategoryProducts extends StatelessWidget {
  HomeViewModel viewModel;

  FilterCategoryProducts({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: viewModel.visible,
      child: Container(
        margin: EdgeInsets.only(bottom: 30.h),
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
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 11.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  normal12Text('REFINE RESULTS', color: Colors.grey),
                  Spacer(),
                  normal12Text('CLEAR', color: secondaryColor).onTap(() {
                    viewModel.setVisible();
                  }),
                ],
              ),
              // heightSpace(10.h),
              // bold16Text('Category', color: textColor),
              // heightSpace(9.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     normal16Text('New Product'),
              //     widthSpace(11.w),
              //     RectChecBox()
              //   ],
              // ),
              // heightSpace(9.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     normal16Text('Used Product'),
              //     widthSpace(11.w),
              //     RectChecBox()
              //   ],
              // ),
              heightSpace(12.h),
              reg16Text('Category', color: HexColor('#1E2022')),
              heightSpace(9.h),
             viewModel.categories==null ? Container(): ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RoundChecBox(check: viewModel.checkCategory[i], function: (){
                          viewModel.selectCategory(i);
                        }),
                        widthSpace(11.w),
                        reg14Text(viewModel.categories![i].title),
                      ],
                    ),
                  );
                },
                itemCount: viewModel.categories!.length,
              ),
              heightSpace(12.h),
              reg16Text('Sort By', color: textColor),
              heightSpace(9.h),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        RoundChecBox(check: viewModel.checkPrices[i], function: (){
                          viewModel.selectPrice(i);
                        }),
                        widthSpace(11.w),
                        reg14Text('Price(Lowest)'),
                      ],
                    ),
                  );
                },
                itemCount: 2,
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        RoundChecBox(check: viewModel.checkDates[i], function: (){
                          viewModel.selectDate(i);
                        }),
                        widthSpace(11.w),
                        reg14Text('Date(Newst)'),

                      ],
                    ),
                  );
                },
                itemCount: 2,
              ),
              heightSpace(12.h),
              _buildApplyButton(context),
              heightSpace(10.h),
            ],
          ),
        ),
      ),
    );
  }

  _buildApplyButton(BuildContext context) {
    return viewModel.state==ViewState.Busy ? Center(
      child: CircularProgressIndicator(
        color: secondaryColor,
      ),
    ): Container(
      width: 170.w,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5.w)),
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 2,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 20.w, top: 5.h, bottom: 5.h, right: 20.w),
        child:  Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration:
                    BoxDecoration(color: whiteColor, shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: secondaryColor,
                )),
              ),
            ),
            widthSpace(15.w),
            Expanded(
                flex: 1,
                child: bold12Text('APPLY FILTERS', color: whiteColor)),
          ],
        ),
      ),
    ).onTap(() {
     // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SearchResultsPage(catId: viewModel.selectedCategory.id, price: viewModel.selectedPrice, date: viewModel.selectedDate, )));
      viewModel.applyFilters(context);

    });
  }
}
