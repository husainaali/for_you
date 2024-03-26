part of 'custom_widget_helper.dart';

customAddressDialog({
  required context,
  required model,
  required requestName,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    color:
                                        model.selectedPickUpAdressIndex == index
                                            ? AppColor.appColorMainBlack
                                            : AppColor.appColorGreyNormal)),
                            backgroundColor: MaterialStateProperty.all(
                                model.selectedPickUpAdressIndex == index
                                    ? AppColor.appColorCornflowerBlueLight
                                    : AppColor.appColorWhite),
                          ),
                          onPressed: () {
                            if (requestName == "DropAddress") {
                              model.dropAddresses.addressId =
                                  model.addresses[index].addressId;
                            } else if (requestName == "PickupAddress") {
                              model.pickAddresses.addressId =
                                  model.addresses[index].addressId;
                            }
                            model.selectedPickUpAdressIndex = index;
                            model.notifyListeners();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: AppColor.appColorMainRed,
                              ),
                              Gap(customWidth(context, percentage: 0.04)),
                              LimitedBox(
                                maxWidth: customWidth(context, percentage: 0.3),
                                child: AutoSizeText(
                                  model
                                      .addressLableText(model.addresses[index]),
                                  maxFontSize: 18,
                                  // 'Ahmed - salmabad building 1234 road 321 block 12',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      color: model.selectedPickUpAdressIndex ==
                                              index
                                          ? AppColor.appColorMainRed
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
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text("Close"))
        ],
      );
    },
  );
}

customEmployeeDialog({
  required context,
  required MapPageViewModel model,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          children: [
            SizedBox(
              height: customHeight(context, percentage: 0.7),
              width: customWidth(context, percentage: 0.8),
              child: ListView.builder(
                  itemCount:
                      model.employee != null ? model.employee!.length : 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        model.selectedEmployee(
                            model.employee![index].employeeId);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: customWidth(context),
                          height: customHeight(context, percentage: 0.2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  customHeight(context, percentage: 0.03)),
                              color: AppColor.appColorCornflowerBlueLight,
                              border: Border.all(
                                  width:
                                      customHeight(context, percentage: 0.0016),
                                  color: model.selectedEmployeeList.contains(
                                          model.employee![index].employeeId)
                                      ? AppColor.appColorMainRed
                                      : AppColor.appColorGreylight)),
                          child: SizedBox(
                            height: customHeight(context, percentage: 0.02),
                            width: customWidth(context, percentage: 0.4),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: customHeight(context,
                                          percentage: 0.04),
                                      right: customWidth(context,
                                          percentage: 0.02),
                                      left: customWidth(context,
                                          percentage: 0.02)),
                                  child: RichText(
                                    textScaleFactor: 1.0,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Name  ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${model.employee![index].fullName}\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Contact  ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${model.employee![index].contactNo1}\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              'Status: ${model.employee![index].isEmployeeActive}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: customHeight(context,
                                                percentage: 0.01),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Number of package rest: 55 ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: customHeight(context,
                                                percentage: 0.02),
                                            color: AppColor.appColorGreyNormal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text("Close"))
        ],
      );
    },
  );
}
