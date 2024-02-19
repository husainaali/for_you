part of 'custom_widget_helper.dart';

customPicker(context, title, address, backgroundColor, height, maxLine,
    leadingIcon, actionIcon) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      title==''?customTitleLable(title):SizedBox(),
    Gap(customHeight(context, percentage: 0.01)),
    SizedBox(
      height: customHeight(context, percentage: height),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: AppColor.appColorCornflowerBlue)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: () {},
        child: Row(
          children: [
            leadingIcon,
            Gap(customWidth(context, percentage: 0.04)),
            LimitedBox(
              maxWidth: customWidth(context, percentage: 0.54),
              child: AutoSizeText(
                address,
                // 'Ahmed - salmabad building 1234 road 321 block 12',
                style: TextStyle(
                    fontSize: customHeight(context, percentage: 0.04),
                    fontWeight: FontWeight.w200,
                    color: AppColor.appColorCornflowerBlue),
                maxLines: maxLine,
              ),
            ),
            Spacer(),
            actionIcon,
          ],
        ),
      ),
    ),
  ]);
}
