part of 'calculator_page_view.dart';

customDropDownMenu(context,model,action) {
  return Padding(
    padding: EdgeInsets.all(customHeight(context, percentage: 0.02)),
    child: Stack(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: DropdownButtonFormField<String>(
          icon: Icon(Icons.keyboard_arrow_down,size: customHeight(context,percentage: 0.042),color: AppColor.appColorCornflowerBlue,),
          
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
          items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {},
        ),
      ),
    ]),
  );
}
