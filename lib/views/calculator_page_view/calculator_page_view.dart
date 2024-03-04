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
  CalculatorPageView({super.key});
  final Icon leadingIcon =
      const Icon(Icons.home, color: AppColor.appColorCornflowerBlue);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorPageViewModel>.reactive(
        viewModelBuilder: () => CalculatorPageViewModel(),
        onViewModelReady: (model) => model.initialize(context),
        builder: (context, model, child) => Scaffold(
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
                    const AutoSizeText(
                      '   Shipment from*',
                      maxFontSize: 24,
                      minFontSize: 18,
                      style: TextStyle(color: AppColor.appColorCornflowerBlue),
                    ),
                    // customPicker(
                    //   context,
                    //   '   Pick up address',
                    //   'Ahmed - salmabad building 1234 road 321 block 12',
                    //   AppColor.appColorCornflowerBlueLight,
                    //   0.1,
                    //   5,
                    //   leadingIcon,
                    //   model,
                    //   'address',
                    //  actionButton:  IconButton(
                    //       onPressed: () {
                    //         // context.push(AddressesControlPageViewRoute.path,extra: {'addressId':null});
                    //       },
                    //       icon: SvgPicture.asset('assets/edit_icon.svg')),
                    // ),
                    customDropDownMenuCalculatorPage(
                        context, model.countryList, 'FromCountry', model),
                    customDropDownMenuCalculatorPage(
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
                    customDropDownMenuCalculatorPage(
                        context, model.countryList, 'ToCountry', model),
                    customDropDownMenuCalculatorPage(
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
                            width: customWidth(context, percentage: 0.45),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height:
                                      customHeight(context, percentage: 0.08),
                                  width: customWidth(context, percentage: 0.3),
                                  child: TextField(
                                    controller:
                                        model.textControllerWeightCounter,
                                    enabled: false,
                                    onChanged: (value) {
                                      model.packageWeight =
                                          double.parse(value) ?? 0.0;
                                      model.packageWeight != null
                                          ? model.packageWeight =
                                              double.parse(value)
                                          : 0.0;

                                      print(model.convertToNearestPointFive(
                                          model.packageWeight ?? 0.0));
                                      model.validateShippingInformation(
                                          'callMethods');
                                    },
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
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
                                          color:
                                              AppColor.appColorCornflowerBlue),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: customHeight(context,
                                              percentage: 0.03),
                                          child: InkWell(
                                            onTap: () {
                                              double currentValue = double.parse(model
                                                      .textControllerWeightCounter
                                                      .text
                                                      .isEmpty
                                                  ? '0.0'
                                                  : model
                                                      .textControllerWeightCounter
                                                      .text);
                                              model.textControllerWeightCounter
                                                      .text =
                                                  (currentValue + 1.0)
                                                      .toStringAsFixed(1)
                                                      .toString();
                                              model.shipmentInformation(
                                                  currentValue + 1.0, 'weight');
                                              model.validateShippingInformation(
                                                  'callMethods');
                                            },
                                            child: const Icon(Icons
                                                .keyboard_double_arrow_up_rounded),
                                          ),
                                        ),
                                        SizedBox(
                                          height: customHeight(context,
                                              percentage: 0.03),
                                          child: InkWell(
                                            onTap: () {
                                              double currentValue = double.parse(model
                                                      .textControllerWeightCounter
                                                      .text
                                                      .isEmpty
                                                  ? '0.0'
                                                  : model
                                                      .textControllerWeightCounter
                                                      .text);
                                              if (currentValue > 1.0) {
                                                model
                                                    .textControllerWeightCounter
                                                    .text = (currentValue -
                                                        1.0)
                                                    .toStringAsFixed(1)
                                                    .toString();
                                              }
                                              model.shipmentInformation(
                                                  currentValue - 1.0, 'weight');
                                              model.validateShippingInformation(
                                                  'callMethods');
                                            },
                                            child: const Icon(Icons
                                                .keyboard_double_arrow_down_rounded),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: customHeight(context,
                                              percentage: 0.03),
                                          child: InkWell(
                                            onTap: () {
                                              double currentValue = double.parse(model
                                                      .textControllerWeightCounter
                                                      .text
                                                      .isEmpty
                                                  ? '0.0'
                                                  : model
                                                      .textControllerWeightCounter
                                                      .text);
                                              model.textControllerWeightCounter
                                                      .text =
                                                  (currentValue + 0.1)
                                                      .toStringAsFixed(1)
                                                      .toString();

                                              model.shipmentInformation(
                                                  currentValue + 0.1, 'weight');
                                              model.validateShippingInformation(
                                                  'callMethods');
                                            },
                                            child: Icon(Icons
                                                .keyboard_arrow_up_rounded),
                                          ),
                                        ),
                                        SizedBox(
                                          height: customHeight(context,
                                              percentage: 0.03),
                                          child: InkWell(
                                            onTap: () {
                                              double currentValue = double.parse(model
                                                      .textControllerWeightCounter
                                                      .text
                                                      .isEmpty
                                                  ? '0.0'
                                                  : model
                                                      .textControllerWeightCounter
                                                      .text);
                                              if (currentValue > 0.0) {
                                                model
                                                    .textControllerWeightCounter
                                                    .text = (currentValue -
                                                        0.1)
                                                    .toStringAsFixed(1)
                                                    .toString();
                                                model.shipmentInformation(
                                                    currentValue - 0.1,
                                                    'weight');
                                                model
                                                    .validateShippingInformation(
                                                        'callMethods');
                                              }
                                            },
                                            child: Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
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
                                          model.shipmentInformation(
                                              'kg', 'weightUnit');
                                          model.validateShippingInformation(
                                              'callMethods');
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
                                          model.shipmentInformation(
                                              'lb', 'weightUnit');
                                          model.validateShippingInformation(
                                              'callMethods');
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
                                  return AppColor.appColorGreyNormal;
                                }),
                                value: true,
                                toggleable: true,
                                groupValue: index == 0 &&
                                        model.shippingTypefast == null
                                    ? model.shippingTypefast
                                    : index == 0 &&
                                            model.shippingTypefast == true
                                        ? model.shippingTypefast
                                        : index == 1 &&
                                                model.shippingTypeNormal == null
                                            ? model.shippingTypeNormal
                                            : model.shippingTypeNormal,
                                onChanged: (value) {
                                  if (index == 0 &&
                                      model.shippingTypefast == null) {
                                    model.shippingTypefast = true;
                                    model.shippingTypeNormal = null;
                                  } else if (index == 0 &&
                                      model.shippingTypefast == true) {
                                    model.shippingTypefast = null;
                                  } else if (index == 1 &&
                                      model.shippingTypeNormal == null) {
                                    model.shippingTypeNormal = true;
                                    model.shippingTypefast = null;
                                  } else if (index == 1 &&
                                      model.shippingTypeNormal == true) {
                                    model.shippingTypeNormal = null;
                                  }

                                  print('fast is ${model.shippingTypefast}');
                                  print(
                                      'normal is ${model.shippingTypeNormal}');
                                  if (model.shippingTypefast == true &&
                                      model.shippingTypeNormal == null) {
                                    model.shipmentInformation(
                                        'Fast', 'shippingType');
                                  } else if (model.shippingTypeNormal == true &&
                                      model.shippingTypefast == null) {
                                    model.shipmentInformation(
                                        'Normal', 'shippingType');
                                  } else if (model.shippingTypefast == null) {
                                    model.shipmentInformation(
                                        null, 'shippingType');
                                  } else if (model.shippingTypeNormal == null) {
                                    model.shipmentInformation(
                                        null, 'shippingType');
                                  }
                                  model.validateShippingInformation(
                                      'callMethods');
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
                    model.showShippingMethods &&
                            model.shippingMethods.isNotEmpty
                        ? SizedBox(
                            width: customWidth(context),
                            height: customHeight(context, percentage: 0.09),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: model.shippingMethods.length,
                                itemBuilder: (context, index) {
                                  final shippingMethodName = model
                                      .shippingMethods[index]
                                      .managerCommercialName;
                                  final totalPrice = double.parse(model
                                          .shippingMethods[index]
                                          .shippingRat!) *
                                      model.sendShipmentDetails.weight!;
                                  return Padding(
                                      padding: EdgeInsets.only(
                                          right: customWidth(context,
                                              percentage: 0.02),
                                          top: customHeight(context,
                                              percentage: 0.02),
                                          bottom: customHeight(context,
                                              percentage: 0.001)),
                                      child: customHorizontalListItem(
                                          context,
                                          index ==
                                                  model
                                                      .shippingMethodSelectedIndex
                                              ? AppColor.appColorCornflowerBlue
                                              : AppColor.appColorGreyNormal,
                                          '${model.totalPrice(double.parse(model.shippingMethods[index].shippingRat!))} BHD - $shippingMethodName',
                                          model,
                                          index,
                                          'selectMethod'));
                                }),
                          )
                        : AutoSizeText(
                            model.showShippingMethods
                                ? 'Fill the fields to show the shipping methods!'
                                : 'No shipping methods availble!',
                            maxFontSize: 20,
                            minFontSize: 16,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColor.appColorGreyNormal),
                          ),
                    Gap(customHeight(context, percentage: 0.013)),
                    customRequestButton(context, 'Send Shipment',
                        () => model.generalRequester(pagename: 'Calculator')),
                  ],
                ))));
  }
}
