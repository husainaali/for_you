part of 'custom_widget_helper.dart';

customAddressDialog({
  required context,
  required CalculatorPageViewModel model,
  required requestName,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AboutDialog(
        children: [
          SizedBox(
            height: customHeight(context, percentage: 0.7),
            width: customWidth(context, percentage: 0.8),
            child: ListView.builder(
                itemCount: model.addresses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: customWidth(context, percentage: 0.02),
                        bottom: customWidth(context, percentage: 0.02),
                        left: customWidth(context, percentage: 0.06),
                        right: customWidth(context, percentage: 0.06)),
                    child: SizedBox(
                      width: customWidth(context, percentage: 0.5),
                      height: customHeight(context, percentage: 0.14),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color:
                                      model.selectedPickUpAdressIndex == index
                                          ? AppColor.appColorAccentRed
                                          : AppColor.appColorGreyNormal)),
                          backgroundColor: MaterialStateProperty.all(
                              model.selectedPickUpAdressIndex == index
                                  ? AppColor.appColorCornflowerBlueLight
                                  : AppColor.appColorWhite),
                        ),
                        onPressed: () {
                          if (requestName == "DropAddress") {

                            model.dropAddresses.addressId = model.addresses[index].addressId;
                          } else if (requestName == "PickupAddress") {
                          
                            model.pickAddresses.addressId = model.addresses[index].addressId;
                        }
                          model.selectedPickUpAdressIndex = index;
                          model.notifyListeners();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: AppColor.appColorCornflowerBlue,
                            ),
                            Gap(customWidth(context, percentage: 0.04)),
                            LimitedBox(
                              maxWidth: customWidth(context, percentage: 0.3),
                              child: AutoSizeText(
                                model.addressLableText(model.addresses[index]),
                                maxFontSize: 18,
                                // 'Ahmed - salmabad building 1234 road 321 block 12',
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color:
                                        model.selectedPickUpAdressIndex == index
                                            ? AppColor.appColorCornflowerBlue
                                            : AppColor.appColorGreyNormal),
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      );
    },
  );
}
