import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:for_you/constants/constants_helper.dart';
import 'package:flutter/material.dart';
import 'package:for_you/models/send_shipment_details.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/custom_widget_helper.dart';
import 'calculator_page_view_model.dart';

class SendShipmentPageView extends StatelessWidget {
  SendShipmentPageView({super.key, required this.sendShipmentDetails});
  final SendShipmentDetails sendShipmentDetails;
  final Icon leadingIcon =
      const Icon(Icons.home, color: AppColor.appColorMainRed);
  final IconButton actionIcon = IconButton(
      onPressed: () {}, icon: SvgPicture.asset('assets/edit_icon.svg'));
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorPageViewModel>.reactive(
        viewModelBuilder: () => CalculatorPageViewModel(),
        onViewModelReady: (model) =>
            model.sendShipmentInitialize(context, sendShipmentDetails),
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
                      Center(
                        child: AutoSizeText(
                          '${model.totalPrice(model.sendShipmentDetails.rate!)}00 BHD',
                          maxFontSize: 42,
                          minFontSize: 40,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.appColorMainRed),
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
                        leadingIcon,
                        model,
                        'pickUpAddress',
                        actionButton: IconButton(
                            onPressed: () {

                              customAddressDialog(context: context, model: model,requestName: "PickupAddress");
                              // context.push(AddressesControlPageViewRoute.path,extra: {'addressId':null});
                            },
                            icon: SvgPicture.asset('assets/edit_icon.svg')),
                      ),
                      Gap(customHeight(context, percentage: 0.02)),
                      customPicker(
                        context,
                        '   Pick up date and time',
                        '08:30 am - 02 Feb 2024',
                        AppColor.appColorWhite,
                        0.07,
                        1,
                        const Icon(Icons.calendar_month_outlined,
                            color: AppColor.appColorMainRed),
                        model,
                        'pickupDateTime',
                        actionButton: IconButton(
                            onPressed: () {
                              // context.push(AddressesControlPageViewRoute.path,extra: {'addressId':null});
                            },
                            icon: SvgPicture.asset('assets/edit_icon.svg')),
                      ),
                      Gap(customHeight(context, percentage: 0.02)),
                      customPicker(
                        context,
                        '   Dropping address',
                        'Ahmed - salmabad building 1234 road 321 block 12',
                        AppColor.appColorCornflowerBlueLight,
                        0.1,
                        2,
                        leadingIcon,
                        model,
                        'DropAddress',
                        actionButton: IconButton(
                            onPressed: () {
                              customAddressDialog(context: context, model: model,requestName:'DropAddress');
                            },
                            icon: SvgPicture.asset('assets/edit_icon.svg')),
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
                                  child: customHorizontalListItem(
                                      context,
                                      index == 1
                                          ? AppColor.appColorMainRed
                                          : AppColor.appColorGreyNormal,
                                      '08:30 am 03 Feb 2024',
                                      index,
                                      model,
                                      'droppingTime'));
                            }),
                      ),
                      Gap(customHeight(context, percentage: 0.02)),
                      customRequestButton(
                          context,
                          'Submit',
                          () =>
                              model.generalRequester(pagename: 'SendShipment')),
                    ]))));
  }
}
