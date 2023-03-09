import 'package:bargina/screens/main/account/viewmodel/account_viewmodel.dart';
import 'package:bargina/utils/colors.dart';
import 'package:bargina/utils/texts.dart';
import 'package:flutter/material.dart';

import '../../../utils/common_functions.dart';
import '../../../widgets/styled_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/styled_text_field.dart';
import '../BaseScreen.dart';

TextEditingController _controller = TextEditingController();

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  //DelAccountBloc _bloc = DelAccountBloc();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: bold14Text('DELETE ACCOUNT', color: Colors.white),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: BaseScreen<AccountViewModel>(
        onModelReady: (_) {},
        builder: (_, vm, child) {
          return SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightSpace(10.h),
                          bold12Text(
                              "Are you sure want to delete your account , please read how account deletion will affect",
                              color: Colors.grey),
                          heightSpace(10.h),
                          bold14Text(
                            "Account",
                            color: Colors.black,
                          ),
                          bold12Text(
                              "deleting your account removes personal information from our database",
                              color: Colors.grey),
                          heightSpace(10.h),
                          bold12Text("Confirm Account Deletion",
                              color: Colors.black),
                          heightSpace(10.h),
                          bold12Text("Enter ACCOUNT DELETE to confirm:",
                              color: Colors.grey),
                          heightSpace(10.h),
                          StyledTextField(
                            hint: 'Confirm delete',
                            controller: _controller,
                            onChange: (_) {
                              if (_ == "ACCOUNT DELETE") {
                                setState(() {
                                  _controller.text = "ACCOUNT DELETE";
                                });
                              }
                            },
                            labelText: '',
                          ),
                          heightSpace(10.h),
                          // Spacer()
                        ],
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.5,
                        child: _loading == true
                            ? Center(
                                child: CircularProgressIndicator(
                                color: primaryColor,
                              ))
                            : StyledButton(
                                width: MediaQuery.of(context).size.width,
                                function: () {
                                  ///////////
                                  vm.logout(context);
                                  Navigator.pop(context, "done");
                                },
                                child: Center(
                                  child:
                                      bold14Text("DELETE", color: Colors.white),
                                ),
                                fillColor:
                                    _controller.text.toString().isNotEmpty &&
                                            _controller.text == "ACCOUNT DELETE"
                                        ? primaryColor
                                        : Colors.grey),
                      )
                    ],
                  )),
            ),
          ));
        },
      ),
    );
  }
}
