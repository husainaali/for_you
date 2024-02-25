import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/custom_widget_helper.dart';
import 'calculator_page_view_model.dart';

class SendShipmentPageView extends StatelessWidget {
  SendShipmentPageView({super.key});

  final Icon leadingIcon =
      const Icon(Icons.home, color: AppColor.appColorCornflowerBlue);
  final IconButton actionIcon = IconButton(
      onPressed: () {}, icon: SvgPicture.asset('assets/edit_icon.svg'));
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
                          const Center(
                            child: AutoSizeText(
                              '5.600 BHD',
                              maxFontSize: 42,
                              minFontSize: 40,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColorCornflowerBlue),
                            ),
                          ),
                          Gap(customHeight(context, percentage: 0.02)),
                          customPicker(
                              context,
                              '   Pick up address',
                              'Ahmed - salmabad building 1234 road 321 block 12',
                              AppColor.appColorCornflowerBlueLight,
                              0.1,
                              2,
                              leadingIcon,actionIcon),
                          Gap(customHeight(context, percentage: 0.02)),
                          customPicker(
                              context,
                              '   Pick up date and time',
                              '08:30 am - 02 Feb 2024',
                              AppColor.appColorWhite,
                              0.07,
                              1,const Icon(Icons.calendar_month_outlined, color: AppColor.appColorCornflowerBlue),actionIcon),
                          Gap(customHeight(context, percentage: 0.02)),
                          customPicker(
                              context,
                              '   Dropping address',
                              'Ahmed - salmabad building 1234 road 321 block 12',
                              AppColor.appColorCornflowerBlueLight,
                              0.1,
                              2,
                              leadingIcon,actionIcon),
                          Gap(customHeight(context, percentage: 0.02)),
                          customTitleLable('Shipping service type'),
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
                                      fillColor: MaterialStateProperty.all(
                                          AppColor.appColorGreyNormal),
                                      value: true,
                                      toggleable: true,
                                      groupValue: null,
                                      onChanged: (value) {},
                                    ),
                                    AutoSizeText(
                                      index == 0 ? 'kg' : 'lb',
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
                          customTitleLable('Dropping time'),
                          SizedBox(
                            width: customWidth(context),
                            height: customHeight(context, percentage: 0.09),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.only(
                                          right: customWidth(context,
                                              percentage: 0.02),
                                          top: customHeight(context,
                                              percentage: 0.02),
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
                          Gap(customHeight(context, percentage: 0.02)),
                          customRequestButton(context, 'Submit',model.generalRequester()),
                        ])))));
  }
}
