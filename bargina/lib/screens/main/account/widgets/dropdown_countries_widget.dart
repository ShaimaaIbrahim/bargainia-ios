import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/texts.dart';


class DropDownCountriesWidget extends StatelessWidget {
  List<dynamic>? list;
  AccountViewModel viewModel;

  DropDownCountriesWidget({Key? key, this.list, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          border: Border.all(color: blackColor, width: 1.w)
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        value: viewModel.selectedCountry,
        items: list!.map((dynamic items) {
          return DropdownMenuItem(
            value: items,
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child:  bold16Text(items.name, color: Colors.grey)),
          );
        }).toList(),
        onChanged: (dynamic newValue) {
          viewModel.setSelectedCountry(newValue);
        },
      ),
    );
  }
}