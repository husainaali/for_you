import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/custom_widget_helper.dart';
import 'calculator_page_view_model.dart';

part 'custom_calculator_parts.dart';

class CalculatorPageView extends StatelessWidget {
  const CalculatorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorPageViewModel>.reactive(
        viewModelBuilder: () => CalculatorPageViewModel(),
        onViewModelReady: (model) => model.initialize(),
        builder: (context, model, child) => SafeArea(
              child: Scaffold(
                  appBar: customLongAppBar(context),
                  backgroundColor: AppColor.appColorWhite,
                  body: SafeArea(
                      top: bool.fromEnvironment('name'),
                      child: ListView(
                        padding: EdgeInsets.only(
                            top: customHeight(context, percentage: 0.02),
                            left: customWidth(context, percentage: 0.05),
                            right: customWidth(context, percentage: 0.05)),
                        children: [
                          AutoSizeText(
                            '   Shipment from*',
                            maxFontSize: 24,
                            minFontSize: 18,
                            style: TextStyle(
                                color: AppColor.appColorCornflowerBlue),
                          ),
                          customDropDownMenu(context),
                          customDropDownMenu(context),
                          Gap(
                            customHeight(context, percentage: 0.03),
                          ),
                          AutoSizeText(
                            '   Shipment to*',
                            maxFontSize: 24,
                            minFontSize: 18,
                            style: TextStyle(
                                color: AppColor.appColorCornflowerBlue),
                          ),
                          customDropDownMenu(context),
                          customDropDownMenu(context),
                          Gap(
                            customHeight(context, percentage: 0.03),
                          ),
                          AutoSizeText(
                            '   Weight of package*',
                            maxFontSize: 24,
                            minFontSize: 18,
                            style: TextStyle(
                                color: AppColor.appColorCornflowerBlue),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: customWidth(context, percentage: 0.02),
                              right: customWidth(context, percentage: 0.02),
                              top: customHeight(context, percentage: 0.02),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height:
                                      customHeight(context, percentage: 0.08),
                                  width: customWidth(context, percentage: 0.4),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(
                                              customWidth(context)),
                                          right: Radius.circular(
                                              customWidth(context)),
                                        ),
                                        borderSide: BorderSide(
                                          width: customHeight(context,
                                              percentage: 0.003),
                                          color:
                                              AppColor.appColorCornflowerBlue,
                                        ),
                                      ),
                                      alignLabelWithHint: true,
                                      hintText: '0.5',
                                      hintStyle: const TextStyle(
                                          color: AppColor.appColorGreylight),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(
                                              customWidth(context)),
                                          right: Radius.circular(
                                              customWidth(context)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      customHeight(context, percentage: 0.06),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: customHeight(context,
                                            percentage: 0.03),
                                        child: Row(
                                          children: [
                                            Radio(
                                              focusColor:
                                                  AppColor.appColorGreyNormal,
                                              activeColor:
                                                  AppColor.appColorGreyNormal,
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      AppColor
                                                          .appColorGreyNormal),
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      AppColor
                                                          .appColorGreyNormal),
                                              value: true,
                                              groupValue: null,
                                              onChanged: (value) {},
                                            ),
                                            const AutoSizeText(
                                              'kg',
                                              maxFontSize: 14,
                                              minFontSize: 14,
                                              style: TextStyle(
                                                  color: AppColor
                                                      .appColorGreyNormal),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: customHeight(context,
                                            percentage: 0.03),
                                        child: Row(
                                          children: [
                                            Radio(
                                              focusColor:
                                                  AppColor.appColorGreyNormal,
                                              activeColor:
                                                  AppColor.appColorGreyNormal,
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      AppColor
                                                          .appColorGreyNormal),
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      AppColor
                                                          .appColorGreyNormal),
                                              value: true,
                                              groupValue: null,
                                              onChanged: (value) {},
                                            ),
                                            const AutoSizeText(
                                              'lb',
                                              maxFontSize: 14,
                                              minFontSize: 14,
                                              style: TextStyle(
                                                  color: AppColor
                                                      .appColorGreyNormal),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Gap(customHeight(context,percentage: 0.013)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(customHeight(context,percentage: 0.2)),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                         AppColor.appColorCornflowerBlue
                                        ),
                                  ),
                                  onPressed: () {
                                  
                                  },
                                  child: AutoSizeText(
                                    'Send Shipment',
                                    style: TextStyle(
                                        fontSize: customHeight(context, percentage: 0.02),
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.appColorWhite),
                                    maxLines: 1,
                                  ),
                                ),
                          ),
                        ],
                      ))),
            ));
  }
}
