part of 'shipments_page_view.dart';

customForButton(context, ShipmentsPageViewModel model, title) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: customWidth(context,
        percentage: model.isForYouBtnSelected ? 0.38 : 0.34),
    height: customHeight(context,
        percentage: model.isForYouBtnSelected ? 0.06 : 0.05),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(model.isForYouBtnSelected
            ? AppColor.appColorCornflowerBlue
            : AppColor.appColorGreylight),
      ),
      onPressed: () {
        model.isForYouBtnSelected = true;

        print(model.isForYouBtnSelected);
        model.notifyListeners();
      },
      child: AutoSizeText(
        title,
        style: TextStyle(
            fontSize: customHeight(context, percentage: 0.2),
            fontWeight: FontWeight.bold,
            color: AppColor.appColorWhite),
        maxLines: 1,
      ),
    ),
  );
}

customFromButton(context, ShipmentsPageViewModel model, title) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: customWidth(context,
        percentage: !model.isForYouBtnSelected ? 0.38 : 0.34),
    height: customHeight(context,
        percentage: !model.isForYouBtnSelected ? 0.06 : 0.05),
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(!model.isForYouBtnSelected
            ? AppColor.appColorCornflowerBlue
            : AppColor.appColorGreylight),
      ),
      onPressed: () {
        model.isForYouBtnSelected = false;

        print(model.isForYouBtnSelected);
        model.notifyListeners();
      },
      child: AutoSizeText(
        title,
        style: TextStyle(
            fontSize: customHeight(context, percentage: 0.2),
            fontWeight: FontWeight.bold,
            color: AppColor.appColorWhite),
        maxLines: 1,
      ),
    ),
  );
}

customShipmentsList(context, model) {
  return ListView.builder(
      itemCount: model.isForYouBtnSelected ? 1 : 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            
          },
          child: Animate(
            effects: const [FadeEffect()],
            child: GestureDetector(
              onTap: () {
                context.push(ShpmentDetailsViewRoute.path);
              },
              child: Padding(
                padding: EdgeInsets.all(customHeight(context, percentage: 0.01)),
                child: SizedBox(
                  width: customWidth(context),
                  height: customHeight(context, percentage: 0.2),
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: customWidth(context),
                        height: customHeight(context, percentage: 0.2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                customHeight(context, percentage: 0.03)),
                            color: AppColor.appColorCornflowerBlueLight,
                            border: Border.all(
                                width: customHeight(context, percentage: 0.0016),
                                color: model.isForYouBtnSelected
                                    ? AppColor.appColorAccentRed
                                    : AppColor.appColorCornflowerBlue)),
                        child: SizedBox(
                          height: customHeight(context, percentage: 0.02),
                          width: customWidth(context, percentage: 0.4),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: customHeight(context, percentage: 0.07),
                                    right: customWidth(context, percentage: 0.02),
                                    left: customWidth(context, percentage: 0.02)),
                                child: RichText(
                                  textScaleFactor: 1.0,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Type  ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: customHeight(context,
                                              percentage: 0.02),
                                          color: AppColor.appColorGreyNormal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Electronic Device\n',
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
                                        text: 'Sender  ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: customHeight(context,
                                              percentage: 0.02),
                                          color: AppColor.appColorGreyNormal,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'ForYou Hypermarket\n',
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
                                        text: 'Out for Delivery - 12 feb 2024 ',
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
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: customWidth(context),
                        height: customHeight(context, percentage: 0.06),
                        decoration: BoxDecoration(
                            color: AppColor.appColorCornflowerBlueLight,
                            border: Border.all(
                                width: customHeight(context, percentage: 0.0016),
                                color: model.isForYouBtnSelected
                                    ? AppColor.appColorCornflowerBlue
                                    : AppColor.appColorAccentRed)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: customHeight(context, percentage: 0.014),
                                  right: customHeight(context, percentage: 0.014)),
                              child: SvgPicture.asset('assets/package_icon.svg'),
                            ),
                            AutoSizeText(
                              'TR123456789CK',
                              style: TextStyle(
                                  fontSize:
                                      customHeight(context, percentage: 0.027),
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.appColorCornflowerBlue),
                              maxLines: 1,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: customWidth(context, percentage: 0.2),
                              child: AutoSizeText(
                                'OUT FOR DELIVERY',
                                style: TextStyle(
                                    fontSize:
                                        customHeight(context, percentage: 0.027),
                                    fontWeight: FontWeight.w300,
                                    color: AppColor.appColorCornflowerBlue),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        );
      });
}


