part of 'home_page_view.dart';

customHomeButton(BuildContext context) {
  return 
  
  SizedBox(
    height: customHeight(context, percentage: 0.2),
    child: Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: AppColor.appColorMainRed.withOpacity(0.2),
      ),
      padding: EdgeInsets.all(customHeight(context, percentage: 0.007)),
      child: Container(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: AppColor.appColorMainRed.withOpacity(0.4),
        ),
        padding: EdgeInsets.all(customHeight(context, percentage: 0.009)),
        child: Container(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: AppColor.appColorMainRed.withOpacity(0.6),
          ),
          padding: EdgeInsets.all(customHeight(context, percentage: 0.007)),
          child: ElevatedButton(
            onPressed: () {
              context.push(ShipmentsPageViewRoute.path);
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColor.appColorMainRed),
              shape: MaterialStateProperty.all<CircleBorder>(
                CircleBorder(),
              ),
            ),
            child: SizedBox(
              child: SvgPicture.asset('assets/box_icon.svg'),
            ),
          ),
        ),
      ),
    ),
  );
}

customTextFieldTracking(context) {
  return Padding(
    padding: EdgeInsets.all(customHeight(context, percentage: 0.02)),
    child: Stack(children: [
      TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context)),
              right: Radius.circular(customHeight(context)),
            ),
            borderSide: BorderSide(
              width: customHeight(context, percentage: 0.003),
              color: AppColor.appColorMainRed,
            ),
          ),
          hintText: 'Tracking number',
          hintStyle: const TextStyle(color: AppColor.appColorGreylight),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context)),
              right: Radius.circular(customHeight(context)),
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
                left: customWidth(context, percentage: 0.05),
                right: customWidth(context, percentage: 0.05)),
            child: SizedBox(
                height: customHeight(context, percentage: 0.075),
                child: IconButton(
                  icon: SvgPicture.asset('assets/track_icon.svg',color: AppColor.appColorMainRed,),
                  onPressed: () {},
                )),
          ))
    ]),
  );
}

customAdsBanner(context,HomePageViewModel model) {
  return SizedBox(
    width: customWidth(context),
    child: Padding(
      padding: EdgeInsets.only(
          left: customHeight(context, percentage: 0.01),
          right: customHeight(context, percentage: 0.01),
          top: customHeight(context, percentage: 0.03),
          bottom: customHeight(context, percentage: 0.03)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.appColorGreylight,
                borderRadius: BorderRadius.circular(
                    customHeight(context, percentage: 0.014))),
            width: customWidth(context, percentage: 0.8),
            height: customHeight(context, percentage: 0.16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(model.adsList[model.currentAdsIndex],fit: BoxFit.fill,)),
          ),
          Gap(customHeight(context, percentage: 0.02)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Container(
                width: customHeight(context, percentage: 0.01),
                height: customHeight(context, percentage: 0.01),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index != model.currentAdsIndex
                      ? AppColor.appColorGreylight
                      : AppColor.appColorMainBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

