import 'package:bargina/screens/main/home/viewmodel/home_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/texts.dart';


class OptionDropDownWidget extends StatefulWidget {
  List<dynamic>? list;
  dynamic init;
  HomeViewModel vm;
  int index;

  OptionDropDownWidget({Key? key, required this.list,
    required this.init, required this.vm, required this.index}) : super(key: key);

  @override
  State<OptionDropDownWidget> createState() => _OptionDropDownWidgetState();
}

class _OptionDropDownWidgetState extends State<OptionDropDownWidget> {
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
        value: widget.init,
        items: widget.list!.map((dynamic items) {
          return DropdownMenuItem(
            value: items.valueEn,
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child:  bold16Text(items.valueEn, color: Colors.grey)),
          );
        }).toList(),
        onChanged: (dynamic newValue) {
          widget.vm.setInitInput(newValue, widget.index);
        },
      ),
    );
  }
}

// class OptionDropDownWidget extends StatelessWidget {
//   List<dynamic>? list;
//   dynamic init;
//   HomeViewModel vm;
//   int index;
//
//   OptionDropDownWidget({Key? key, required this.list,
//     required this.init, required this.vm, required this.index}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48.h,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(8.w)),
//           border: Border.all(color: blackColor, width: 1.w)
//       ),
//       child: DropdownButton(
//         isExpanded: true,
//         underline: const SizedBox(),
//         value: init.valueEn,
//         items: list!.map((dynamic items) {
//           return DropdownMenuItem(
//             value: items.valueEn,
//             child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child:  bold16Text(items.valueEn, color: Colors.grey)),
//           );
//         }).toList(),
//         onChanged: (dynamic newValue) {
//              vm.setInitInput(newValue, index);
//         },
//       ),
//     );
//   }
// }