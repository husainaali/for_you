part of 'custom_widget_helper.dart';

AppBar customLongAppBar(context) {
  return 
  
  
  AppBar(
      toolbarHeight: customHeight(context, percentage: 0.23),
      shape: RoundedRectangleBorder(),
      backgroundColor: AppColor.appColorMainRed,
      actions: [
        SizedBox(
          width: customWidth(context, percentage: 0.7),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: customHeight(context,percentage: 0.14),
                  child: const RiveAnimation.asset(
                    animations: ['foryou'],
                    'assets/foryou.riv',
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(height: 20),
                SvgPicture.asset('assets/foryousmallwhite.svg',
                    height: customHeight(context, percentage: 0.06))
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: AppColor.appColorWhite,
              onPressed: () {},
            )),
      ]);
}

AppBar customShortAppBar(BuildContext context, {parentPage, resources}) {
  return AppBar(
      bottom: parentPage == 'shipments_page_view'
          ? PreferredSize(
              child:
                  ColoredBox(color: AppColor.appColorWhite, child: resources),
              preferredSize: Size(customWidth(context),
                  customHeight(context, percentage: 0.11)))
          : null,
      toolbarHeight: customHeight(context, percentage: 0.08),
      shape: RoundedRectangleBorder(),
      backgroundColor: AppColor.appColorMainRed,
      foregroundColor: AppColor.appColorWhite,
      actions: [
        SizedBox(
          width: customWidth(context, percentage: 0.7),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/foryousmallwhite.svg',
                    height: customHeight(context, percentage: 0.04))
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: AppColor.appColorWhite,
              onPressed: () {},
            )),
      ]);
}

AppBar customShipmentDatailsAppBar(BuildContext context, {parentPage}) {
  return AppBar(
      toolbarHeight: customHeight(context, percentage: 0.18),
      shape: RoundedRectangleBorder(),
      backgroundColor: AppColor.appColorCornflowerBlueLight,
      foregroundColor: AppColor.appColorMainRed,
      actions: [
        SizedBox(
          height: customHeight(context, percentage: 0.15),
          width: customWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/package_icon.svg',color: AppColor.appColorMainRed,
                  height: customHeight(context, percentage: 0.06)),
              AutoSizeText(
                'TR123456789CK',
                style: TextStyle(
                    fontSize: customHeight(context, percentage: 0.027),
                    fontWeight: FontWeight.w300,
                    color: AppColor.appColorMainRed),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ]);
}

AppBar customShortAppBarForManager(BuildContext context,
    {parentPage, resources}) {
  return AppBar(
      bottom: parentPage == 'home_manager'
          ? PreferredSize(
              child:
                  ColoredBox(color: AppColor.appColorWhite, child: resources),
              preferredSize: Size(customWidth(context),
                  customHeight(context, percentage: 0.11)))
          : null,
      toolbarHeight: customHeight(context, percentage: 0.08),
      shape: RoundedRectangleBorder(),
      backgroundColor: AppColor.appColorMainRed,
      foregroundColor: AppColor.appColorWhite,
      actions: [
        SizedBox(
          width: customWidth(context, percentage: 0.7),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/foryousmallwhite.svg',
                    height: customHeight(context, percentage: 0.04))
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: AppColor.appColorWhite,
              onPressed: () {},
            )),
      ]);
}
