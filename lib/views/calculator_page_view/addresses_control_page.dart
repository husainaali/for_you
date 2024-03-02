import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

import '../../constants/constants_helper.dart';
import 'calculator_page_view.dart';
import 'calculator_page_view_model.dart';
import '../../widgets/custom_widget_helper.dart';

class AddressesControlPageView extends StatelessWidget {
  const AddressesControlPageView({super.key, this.addressId = -1});

  final int addressId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculatorPageViewModel>.reactive(
        viewModelBuilder: () => CalculatorPageViewModel(),
        onViewModelReady: (model) =>
            model.addressesControlPageInitialize(context, addressId),
        builder: (context, model, child) => Scaffold(
              appBar: model.addEditNewAddress == true
                  ? null
                  : customShortAppBar(context),
              body: SafeArea(
                child: model.addEditNewAddress == true
                    ? ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: customWidth(context, percentage: 0.06),
                                right: customWidth(context, percentage: 0.06),
                                bottom: customWidth(context, percentage: 0.06),
                                top: customWidth(context, percentage: 0.06)),
                            child: Column(
                              children: [
                                Gap(customWidth(context, percentage: 0.04)),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    'Add an address',
                                    maxFontSize: 24,
                                    minFontSize: 18,
                                    style: TextStyle(
                                        color: AppColor.appColorCornflowerBlue),
                                  ),
                                ),
                                Gap(customWidth(context, percentage: 0.04)),
                                TextField(
                                  controller: model.textControllerAddressName,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            customHeight(context)),
                                        right: Radius.circular(
                                            customHeight(context)),
                                      ),
                                      borderSide: BorderSide(
                                        width: customHeight(context,
                                            percentage: 0.003),
                                        color: AppColor.appColorCornflowerBlue,
                                      ),
                                    ),
                                    hintText: 'Address name',
                                    hintStyle: const TextStyle(
                                        color: AppColor.appColorGreyNormal),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            customHeight(context)),
                                        right: Radius.circular(
                                            customHeight(context)),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(customWidth(context, percentage: 0.04)),
                                TextField(
                                  controller: model.textControllerAddressLine1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            customHeight(context)),
                                        right: Radius.circular(
                                            customHeight(context)),
                                      ),
                                      borderSide: BorderSide(
                                        width: customHeight(context,
                                            percentage: 0.003),
                                        color: AppColor.appColorCornflowerBlue,
                                      ),
                                    ),
                                    hintText: 'Address line 1',
                                    hintStyle: const TextStyle(
                                        color: AppColor.appColorGreyNormal),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            customHeight(context)),
                                        right: Radius.circular(
                                            customHeight(context)),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(customWidth(context, percentage: 0.04)),
                                TextField(
                                  controller: model.textControllerAddressLine2,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            customHeight(context)),
                                        right: Radius.circular(
                                            customHeight(context)),
                                      ),
                                      borderSide: BorderSide(
                                        width: customHeight(context,
                                            percentage: 0.003),
                                        color: AppColor.appColorCornflowerBlue,
                                      ),
                                    ),
                                    hintText: 'Address line 2',
                                    hintStyle: const TextStyle(
                                        color: AppColor.appColorGreyNormal),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(
                                            customHeight(context)),
                                        right: Radius.circular(
                                            customHeight(context)),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(customWidth(context, percentage: 0.04)),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    'Select Country and City',
                                    maxFontSize: 24,
                                    minFontSize: 18,
                                    style: TextStyle(
                                        color: AppColor.appColorCornflowerBlue),
                                  ),
                                ),
                                customDropDownMenuAddressesPage(context,
                                    model.countryList, 'AddressCountry', model),
                                Gap(customWidth(context, percentage: 0.04)),
                                customDropDownMenuAddressesPage(context,
                                    model.fromCities, 'AddressCity', model),
                                Gap(customWidth(context, percentage: 0.04)),
                                FilledButton(
                                  onPressed: () {
                                    model.addressData['requestName'] =
                                        addressId == -1
                                            ? 'newAddress'
                                            : 'updateAddress';
                                    model.addressData['addressId'] =
                                        '$addressId';
                                    model.addressData['addressName'] =
                                        model.textControllerAddressName.text;
                                    model.addressData['addressLine1'] =
                                        model.textControllerAddressLine1.text;
                                    model.addressData['addressLine2'] =
                                        model.textControllerAddressLine1.text;
                                    model.saveAddress();
                                    model.changeToEditAddress();
                                  },
                                  child: Text('Save'),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AppColor.appColorCornflowerBlue)),
                                ),
                                IconButton(
                                    onPressed: () {
                                      model.changeToEditAddress();
                                    },
                                    icon: Icon(Icons.arrow_back)),
                              ],
                            ),
                          ),
                        ],
                      )
                    : model.addresses.isEmpty
                        ? ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top:
                                        customHeight(context, percentage: 0.3)),
                                child: const AutoSizeText(
                                  'No addresses you add, please add new one',
                                  maxFontSize: 24,
                                  minFontSize: 18,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColor.appColorCornflowerBlue,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount: model.addresses.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: customWidth(context, percentage: 0.02),
                                    bottom:
                                        customWidth(context, percentage: 0.02),
                                    left:
                                        customWidth(context, percentage: 0.06),
                                    right:
                                        customWidth(context, percentage: 0.06)),
                                child: SizedBox(
                                  width: customWidth(context, percentage: 0.5),
                                  height:
                                      customHeight(context, percentage: 0.14),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      side: MaterialStateProperty
                                          .all<BorderSide>(BorderSide(
                                              color:
                                                  model.selectedPickUpAdressIndex ==
                                                          index
                                                      ? AppColor
                                                          .appColorAccentRed
                                                      : AppColor
                                                          .appColorGreyNormal)),
                                      backgroundColor: MaterialStateProperty.all(
                                          model.selectedPickUpAdressIndex ==
                                                  index
                                              ? AppColor
                                                  .appColorCornflowerBlueLight
                                              : AppColor.appColorWhite),
                                    ),
                                    onPressed: () {
                                      model.selectedPickUpAdressIndex = index;
                                      model.notifyListeners();
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color:
                                              AppColor.appColorCornflowerBlue,
                                        ),
                                        Gap(customWidth(context,
                                            percentage: 0.04)),
                                        LimitedBox(
                                          maxWidth: customWidth(context,
                                              percentage: 0.3),
                                          child: AutoSizeText(
                                            model.addressLableText(model.addresses[index]),
                                            maxFontSize: 18,
                                            // 'Ahmed - salmabad building 1234 road 321 block 12',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                color: model.selectedPickUpAdressIndex ==
                                                        index
                                                    ? AppColor
                                                        .appColorCornflowerBlue
                                                    : AppColor
                                                        .appColorGreyNormal),
                                            maxLines: 4,
                                          ),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              // model.textControllerAddressLine1.text=
                                              model.changeToEditAddress();
                                            },
                                            icon: SvgPicture.asset(
                                                'assets/edit_icon.svg')),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
              ),
              floatingActionButton: model.addEditNewAddress
                  ? null
                  : FloatingActionButton(
                      elevation: 30,
                      backgroundColor: AppColor.appColorCornflowerBlue,
                      child: Icon(Icons.add, color: AppColor.appColorWhite),
                      onPressed: () {
                        model.changeToEditAddress();
                      },
                    ),
            ));
  }
}
