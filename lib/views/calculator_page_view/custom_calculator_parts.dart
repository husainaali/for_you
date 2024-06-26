part of 'calculator_page_view.dart';

customDropDownMenuCalculatorPage(context, list, listName, CalculatorPageViewModel model,
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
          color: AppColor.appColorMainRed,
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
              color: AppColor.appColorMainRed,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context, percentage: 0.04)),
              right: Radius.circular(customHeight(context, percentage: 0.04)),
            ),
            borderSide: BorderSide(
              width: customHeight(context, percentage: 0.003),
              color: AppColor.appColorMainRed,
            ),
          ),
          hoverColor: AppColor.appColorMainRed,
          focusColor: AppColor.appColorMainRed,
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
        style: TextStyle(color: AppColor.appColorMainRed),
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
          int? itemID;
          if (listName == 'FromCountry' || listName == 'ToCountry') {
            itemID = list
                .firstWhere((element) => element.countryName == value)
                .countryId;
          } else {
            itemID =
                list.firstWhere((element) => element.cityName == value).cityId;
          }
          model.selectCountry(listName, value);
          print(value);
          print(listName);
          if (listName == 'FromCountry') {
            model.shipmentInformation(itemID, 'countryFromId');
          } else if (listName == 'ToCountry') {
            model.shipmentInformation(itemID, 'countryToId');
          } else if (listName == 'FromCity') {
            model.shipmentInformation(itemID, 'cityFromID');
          } else if (listName == 'ToCity') {
            model.shipmentInformation(itemID, 'cityToId');
          }
        },
      ),
    ),
  ]);
}


customDropDownMenuAddressesPage(context, list, listName, CalculatorPageViewModel model,
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
          color: AppColor.appColorMainRed,
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
              color: AppColor.appColorMainRed,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(customHeight(context, percentage: 0.04)),
              right: Radius.circular(customHeight(context, percentage: 0.04)),
            ),
            borderSide: BorderSide(
              width: customHeight(context, percentage: 0.003),
              color: AppColor.appColorMainRed,
            ),
          ),
          hoverColor: AppColor.appColorMainRed,
          focusColor: AppColor.appColorMainRed,
          hintText: listName=='AddressCountry'?'Select a country':'Select a city',
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
        style: TextStyle(color: AppColor.appColorMainRed),
        items: listName == 'AddressCountry'
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
          int? itemID;
          if (listName == 'AddressCountry') {
            itemID = list
                .firstWhere((element) => element.countryName == value)
                .countryId;

                model.addressData['countryId']='$itemID';
          } else {
            itemID =
                list.firstWhere((element) => element.cityName == value).cityId;
                model.addressData['cityId']='$itemID';
          }
          model.selectCountry(listName, value);
                                     
        },
      ),
    ),
  ]);
}