part of 'custom_widget_helper.dart';

Widget bottomNavigationBar(context, WrapperViewModel model) {
  final WrapperViewModel wrapperViewModel = locator.get<WrapperViewModel>();
  return BottomNavigationBar(
      iconSize: customHeight(context, percentage: 0.043),
      currentIndex: model.selectedItem,
      showSelectedLabels: false,
      onTap: (value) async {
        model.onNavigationBarTapped(value);
        if (value == 0) {
          model.selectedPage = HomePageView();
          model.selectedItem = 0;
          model.notifyListeners();
        } else if (value == 1) {
          model.selectedPage = HomePageView();
          model.selectedItem = 1;
          model.notifyListeners();
        } else if (value == 2) {
          model.selectedPage = CalculatorPageView();
          model.selectedItem = 2;
          model.notifyListeners();
        } else if (value == 3) {
          model.selectedPage = SettingPageView();
          model.selectedItem = 3;
          model.notifyListeners();
        }
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: model.selectedItem == 0
                  ? AppColor.appColorAccentRed
                  : AppColor.appColorGreylight,
            ),
            backgroundColor: AppColor.appColorCornflowerBlue,
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.pin_drop,
              color: model.selectedItem == 1
                  ? AppColor.appColorAccentRed
                  : AppColor.appColorGreylight,
            ),
            backgroundColor: AppColor.appColorCornflowerBlue,
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
              color: model.selectedItem == 2
                  ? AppColor.appColorAccentRed
                  : AppColor.appColorGreylight,
            ),
            backgroundColor: AppColor.appColorCornflowerBlue,
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: model.selectedItem == 3
                  ? AppColor.appColorAccentRed
                  : AppColor.appColorGreylight,
            ),
            backgroundColor: AppColor.appColorCornflowerBlue,
            label: ''),
      ]);

//   Container(
//     height: customHeight(context,percentage: 0.2),
//     width: customWidth(context),
//     child: Stack(children: [

//       Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           color: AppColor.appColorCornflowerBlue,
//           height: customHeight(context,percentage: 0.12),
//           width: customWidth(context),
//           child: Row(children: [],)),
//       ),

// Align(
//   alignment: Alignment.topCenter,
//   child: SizedBox(
//     height: customHeight(context,percentage: 0.15),
//     width: customHeight(context,percentage: 0.15),
//     child: SizedBox(
//     height: customHeight(context,percentage: 0.10),
//     width: customHeight(context,percentage: 0.10),
//     child: Transform.rotate(
//         angle: 40.08,
//         child: Container(
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color :AppColor.appColorGrey),
//           child:Center(
//             child: Transform.rotate(
//               angle: -40.08,
//               child: Diamond(onTap: () {
//                 print('object');
//               },),
//             ),
//           ),

//         ),
//       ),
//           ),
//   ),
// ),

//     ]),
//   );
}
