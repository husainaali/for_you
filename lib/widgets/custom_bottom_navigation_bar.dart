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
          model.selectedPage = model.userData!.role == 'User'
              ? HomePageView()
              : model.userData!.role == 'Manager'
                  ? HomeManagerPageView()
                  : HomeEmployeePageView();
          model.selectedItem = 0;
          model.notifyListeners();
        } else if (value == 1) {
          model.selectedPage = model.userData!.role == 'User'
              ? MapPageView()
              : model.userData!.role == 'Manager'
                  ? EmployeesPageView()
                  : ManagerPageView();
          model.selectedItem = 1;
          model.notifyListeners();
        } else if (value == 2) {
          model.selectedPage = model.userData!.role == 'User'
              ? CalculatorPageView()
              : MapPageView();
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
            icon: model.userData?.role == 'User'
                ? Icon(
                    Icons.pin_drop,
                    color: model.selectedItem == 1
                        ? AppColor.appColorAccentRed
                        : AppColor.appColorGreylight,
                  )
                : model.userData?.role == 'Manager'
                    ? SvgPicture.asset(
                        'assets/employees_icon.svg',
                        color: model.selectedItem == 1
                            ? AppColor.appColorAccentRed
                            : AppColor.appColorGreylight,
                      )
                    : SvgPicture.asset(
                        'assets/manager_icon.svg',
                        color: model.selectedItem == 1
                            ? AppColor.appColorAccentRed
                            : AppColor.appColorGreylight,
                      ),
            backgroundColor: AppColor.appColorCornflowerBlue,
            label: ''),
        BottomNavigationBarItem(
            icon: model.userData?.role == 'User'
                ? Icon(
                    Icons.calculate,
                    color: model.selectedItem == 2
                        ? AppColor.appColorAccentRed
                        : AppColor.appColorGreylight,
                  )
                : SvgPicture.asset(
                    'assets/map.svg',
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
}
