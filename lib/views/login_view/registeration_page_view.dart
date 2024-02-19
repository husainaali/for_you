import 'package:flutter/material.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:for_you/widgets/custom_widget_helper.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import 'login_page_view_model.dart';

class RegistrationPageView extends StatelessWidget {
  RegistrationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
        viewModelBuilder: () => LoginPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                    child: ListView(
                        padding: EdgeInsets.only(
                            left: customWidth(context, percentage: 0.11),
                            right: customWidth(context, percentage: 0.11)),
                        children: [
                      Gap(customHeight(context, percentage: 0.12)),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.appColorGreyNormal,
                            borderRadius: BorderRadius.circular(
                                customHeight(context, percentage: 0.1))),
                        height: customHeight(context, percentage: 0.07),
                        width: customWidth(context, percentage: 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: customWidth(context, percentage: 0.03),
                                right: customWidth(context, percentage: 0.03),
                              ),
                              child: SizedBox(
                                width: customWidth(context, percentage: 0.33),
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text('User')),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: customWidth(context, percentage: 0.03),
                                right: customWidth(context, percentage: 0.03),
                              ),
                              child: SizedBox(
                                width: customWidth(context, percentage: 0.33),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        // foregroundColor:
                                        //     MaterialStateProperty.all<Color>(
                                        //         AppColor.appColorWhite
                                        //             .withOpacity(0.0)),
                                                    elevation: MaterialStateProperty.all(0.0),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColor.appColorWhite
                                                    .withOpacity(0.0))),
                                    onPressed: () {},
                                    child: Text('Manager')),
                              ),
                            )
                          ],
                        ),
                      )
                    ])))));
  }
}
