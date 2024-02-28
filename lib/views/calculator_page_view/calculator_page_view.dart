import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:for_you/models/countries.dart';
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
        onViewModelReady: (model) => model.initialize(context),
        builder: (context, model, child) => Scaffold(
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
                    const AutoSizeText(
                      '   Shipment from*',
                      maxFontSize: 24,
                      minFontSize: 18,
                      style: TextStyle(color: AppColor.appColorCornflowerBlue),
                    ),
                    customDropDownMenu(
                        context, model.countryList, 'FromCountry', model),
                    customDropDownMenu(
                        context, model.fromCities, 'FromCity', model),
                    Gap(
                      customHeight(context, percentage: 0.03),
                    ),
                    const AutoSizeText(
                      '   Shipment to*',
                      maxFontSize: 24,
                      minFontSize: 18,
                      style: TextStyle(color: AppColor.appColorCornflowerBlue),
                    ),
                    customDropDownMenu(
                        context, model.countryList, 'ToCountry', model),
                    customDropDownMenu(
                        context, model.toCities, 'ToCity', model),
                    Gap(
                      customHeight(context, percentage: 0.03),
                    ),
                    const AutoSizeText(
                      '   Weight of package*',
                      maxFontSize: 24,
                      minFontSize: 18,
                      style: TextStyle(color: AppColor.appColorCornflowerBlue),
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
                            height: customHeight(context, percentage: 0.08),
                            width: customWidth(context, percentage: 0.4),
                            child: TextField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(customWidth(context)),
                                    right:
                                        Radius.circular(customWidth(context)),
                                  ),
                                  borderSide: BorderSide(
                                    width: customHeight(context,
                                        percentage: 0.003),
                                    color: AppColor.appColorCornflowerBlue,
                                  ),
                                ),
                                alignLabelWithHint: true,
                                hintText: '0.5',
                                hintStyle: const TextStyle(
                                    color: AppColor.appColorGreylight),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(customWidth(context)),
                                    right:
                                        Radius.circular(customWidth(context)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: customHeight(context, percentage: 0.06),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      customHeight(context, percentage: 0.03),
                                  child: Row(
                                    children: [
                                      Radio(
                                        focusColor: AppColor.appColorGreyNormal,
                                        activeColor:
                                            AppColor.appColorGreyNormal,
                                        overlayColor: MaterialStateProperty.all(
                                            AppColor.appColorGreyNormal),
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>((states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return AppColor
                                                .appColorAccentRed; // Sets the color of the circle when it's selected to red
                                          }
                                          return AppColor
                                              .appColorGreyNormal; // Sets the color of the circle when it's not selected
                                        }),
                                        value: true,
                                        groupValue: model.weightRadioButton,
                                        onChanged: (value) {
                                          model.weightRadioButton =
                                              !model.weightRadioButton;
                                          print('kg $value');
                                          model.notifyListeners();
                                        },
                                      ),
                                      const AutoSizeText(
                                        'kg',
                                        maxFontSize: 14,
                                        minFontSize: 14,
                                        style: TextStyle(
                                            color: AppColor.appColorGreyNormal),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      customHeight(context, percentage: 0.03),
                                  child: Row(
                                    children: [
                                      Radio(
                                        focusColor: AppColor.appColorGreyNormal,
                                        activeColor:
                                            AppColor.appColorGreyNormal,
                                        overlayColor: MaterialStateProperty.all(
                                            AppColor.appColorGreyNormal),
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>((states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return AppColor
                                                .appColorAccentRed; // Sets the color of the circle when it's selected to red
                                          }
                                          return AppColor
                                              .appColorGreyNormal; // Sets the color of the circle when it's not selected
                                        }),
                                        value: true,
                                        groupValue: !model.weightRadioButton,
                                        onChanged: (value) {
                                          model.weightRadioButton =
                                              !model.weightRadioButton;
                                          print('lb $value');
                                          model.notifyListeners();
                                        },
                                      ),
                                      const AutoSizeText(
                                        'lb',
                                        maxFontSize: 14,
                                        minFontSize: 14,
                                        style: TextStyle(
                                            color: AppColor.appColorGreyNormal),
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
                    Gap(customHeight(context, percentage: 0.02)),
                    customTitleLable('   Shipping service type'),
                    Row(
                      children: List.generate(
                        2,
                        (index) => SizedBox(
                          height: customHeight(context, percentage: 0.03),
                          child: Row(
                            children: [
                              Radio(
                                focusColor: AppColor.appColorGreyNormal,
                                activeColor: AppColor.appColorGreyNormal,
                                overlayColor: MaterialStateProperty.all(
                                    AppColor.appColorGreyNormal),
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColor.appColorAccentRed;
                                  }
                                  return AppColor
                                      .appColorGreyNormal;
                                }),
                                value: true,
                                toggleable: true,
                                groupValue: index == 0
                                    ? !model.shippingType
                                    : model.shippingType,
                                onChanged: (value) {
                                  if (index == 0) {
                                    print('fast $value');
                                    model.shippingType = !model.shippingType;
                                  } else {
                                    model.shippingType = !model.shippingType;
                                    print('normal $value');
                                  }
                                  model.notifyListeners();
                                },
                              ),
                              AutoSizeText(
                                index == 0 ? 'fast' : 'normal',
                                maxFontSize: 14,
                                minFontSize: 14,
                                style: const TextStyle(
                                    color: AppColor.appColorGreyNormal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(customHeight(context, percentage: 0.02)),
                    const AutoSizeText(
                      '   Shipping method*',
                      maxFontSize: 24,
                      minFontSize: 18,
                      style: TextStyle(color: AppColor.appColorCornflowerBlue),
                    ),
                    SizedBox(
                      width: customWidth(context),
                      height: customHeight(context, percentage: 0.09),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    right:
                                        customWidth(context, percentage: 0.02),
                                    top:
                                        customHeight(context, percentage: 0.02),
                                    bottom: customHeight(context,
                                        percentage: 0.001)),
                                child: customTimeItem(
                                    context,
                                    index == 1
                                        ? AppColor.appColorCornflowerBlue
                                        : AppColor.appColorGreyNormal,
                                    '08:30 am 03 Feb 2024'));
                          }),
                    ),
                    Gap(customHeight(context, percentage: 0.013)),
                    customRequestButton(context, 'Send Shipment',
                        () => model.generalRequester(pagename: 'Calculator')),
                  ],
                ))));
  }
}
