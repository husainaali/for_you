import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/custom_widget_helper.dart';
import 'calculator_page_view_model.dart';

class SendShipmentPageView extends StatelessWidget {
  const SendShipmentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorPageViewModel>.reactive(
        viewModelBuilder: () => CalculatorPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
                appBar: customShortAppBar(context),
                backgroundColor: AppColor.appColorWhite,
                body: SafeArea(
                    top: bool.fromEnvironment('name'),
                    child: ListView(
                        padding: EdgeInsets.only(
                            top: customHeight(context, percentage: 0.02),
                            left: customWidth(context, percentage: 0.05),
                            right: customWidth(context, percentage: 0.05)),
                        children: [
                          Center(
                            child: AutoSizeText(
                              '5.600 BHD',
                              maxFontSize: 42,
                              minFontSize: 40,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColorCornflowerBlue),
                            ),
                          ),
                          Gap(10),
                          AutoSizeText(
                            '   Shipment from*',
                            maxFontSize: 24,
                            minFontSize: 18,
                            style: TextStyle(
                                color: AppColor.appColorCornflowerBlue),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.appColorCornflowerBlueLight),
                            ),
                            onPressed: () {
                              model.notifyListeners();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.home),
                                AutoSizeText(
                                  'Ahmed - salmabad\nbuilding 1234 road 321 block 12',
                                  style: TextStyle(
                                      fontSize: customHeight(context,
                                          percentage: 0.2),
                                      fontWeight: FontWeight.w200,
                                      color: AppColor.appColorWhite),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ])))));
  }
}
