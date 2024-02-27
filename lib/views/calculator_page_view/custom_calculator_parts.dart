part of 'calculator_page_view.dart';

customDropDownMenu(context, list, listName, CalculatorPageViewModel model,
    {action}) {
  return Stack(children: [
    Padding(
      padding: EdgeInsets.only(
        left: customWidth(context, percentage: 0.02),
        right: customWidth(context, percentage: 0.02),
        top: customHeight(context, percentage: 0.02),
      ),
      child: DropdownButtonFormField<String>(
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: customHeight(context, percentage: 0.042),
          color: AppColor.appColorCornflowerBlue,
        ),
        decoration: InputDecoration(
          fillColor: AppColor.appColorGreyNormal,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context, percentage: 0.04)),
              right: Radius.circular(customHeight(context, percentage: 0.04)),
            ),
            borderSide: BorderSide(
              width: customHeight(context, percentage: 0.003),
              color: AppColor.appColorCornflowerBlue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context, percentage: 0.04)),
              right: Radius.circular(customHeight(context, percentage: 0.04)),
            ),
            borderSide: BorderSide(
              width: customHeight(context, percentage: 0.003),
              color: AppColor.appColorCornflowerBlue,
            ),
          ),
          hoverColor: AppColor.appColorCornflowerBlue,
          focusColor: AppColor.appColorCornflowerBlue,
          hintText: 'Select a country',
          hintStyle: const TextStyle(color: AppColor.appColorGreyNormal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context, percentage: 0.04)),
              right: Radius.circular(customHeight(context, percentage: 0.04)),
            ),
          ),
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(customHeight(context, percentage: 0.04)),
          right: Radius.circular(customHeight(context, percentage: 0.04)),
        ),

        style: TextStyle(color: AppColor.appColorCornflowerBlue),
        items: listName == 'FromCountry' || listName == 'ToCountry'
            ? list.map<DropdownMenuItem<String>>((Country country) {
                return DropdownMenuItem<String>(
                  value: country.countryName ?? '',
                  child: Text(country.countryName!),
                );
              }).toList()
            : list.map<DropdownMenuItem<String>>((City city) {
                return DropdownMenuItem<String>(
                  value: city.cityName,
                  child: Text(city.cityName!),
                );
              }).toList(),
        onChanged: (String? value) {
          model.selectCountry(listName, value);
          print(value);
          print(listName);
        },
      ),
    ),
  ]);
}
