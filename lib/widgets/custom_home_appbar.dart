part of 'custom_widget_helper.dart';

AppBar customHomeAppBar(context) {
  return AppBar(
      toolbarHeight: customHeight(context, percentage: 0.23),
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(customHeight(context,percentage: 0.2)),
              bottomRight: Radius.circular(customHeight(context,percentage: 0.2)))),
      backgroundColor: AppColor.appColorCornflowerBlue,
      leading: 
      
        IconButton(icon:Icon( Icons.notifications), onPressed: () {  },),
      
      actions: [
        SizedBox(
          width: customWidth(context,percentage: 0.7),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/logo.svg',
                    height: customHeight(context, percentage: 0.09)),
                    SizedBox(height:20),
                SvgPicture.asset('assets/app_name.svg',
                    height: customHeight(context, percentage: 0.04))
              ],
            ),
          ),
        ),
        IconButton(icon:Icon( Icons.notifications), onPressed: () {  },),
      ]);
}