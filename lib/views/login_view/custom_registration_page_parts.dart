part of 'registration_page_view.dart';

customRegistrationTextFeild(context, label,controller,LoginPageViewModel model) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.name,
onChanged: (value) {
  model.fillRegistrationForm(value,label);
},
    // obscureText: true,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColor.appColorCornflowerBlue),
      hintText: 'Enter your $label',
      hintStyle: const TextStyle(color: AppColor.appColorGreyNormal),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColorGreyNormal),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColorCornflowerBlue),
      ),
    ),
  );
}

customUserForm(context,LoginPageViewModel model) {
  return Column(
    children: [
      customRegistrationTextFeild(context, 'Full Name',model.textControllerUserFullName,model),
      customRegistrationTextFeild(context, 'Personal ID',model.textControllerUserCPR,model),
      customRegistrationTextFeild(context, 'Occupation',model.textControllerUserOccupation,model),
      customRegistrationTextFeild(context, 'Date of Birth',model.textControllerUserDOB,model),
      customRegistrationTextFeild(context, 'Address',model.textControllerUserAddress,model),
      customRegistrationTextFeild(context, 'Contact No. 1',model.textControllerUserContactNo1,model),
      customRegistrationTextFeild(context, 'Contact No. 2',model.textControllerUserContactNo2,model)
    ],
  );
}

customManagerForm(context,LoginPageViewModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customRegistrationTextFeild(context,'Commercial Name',model.textControllerManagerCommercialName,model),
      customRegistrationTextFeild(context,'Commercial ID',model.textControllerManagerCommercialID,model),
      customRegistrationTextFeild(context,'Business Type',model.textControllerManagerBusinessType,model),
      Gap(customHeight(context,percentage: 0.01)),
      Text('Size of company/employee ',style: TextStyle(color: AppColor.appColorGreyNormal),),
      Row(
        children: List.generate(
          3,
          (index) => SizedBox(
            child: Row(
              children: [
                Radio(
                  focusColor: AppColor.appColorGreyNormal,
                  activeColor: AppColor.appColorGreyNormal,
                  overlayColor:
                      MaterialStateProperty.all(AppColor.appColorGreyNormal),
                  fillColor:
                      MaterialStateProperty.all(AppColor.appColorGreyNormal),
                  value: true,
                  groupValue: null,
                  onChanged: (value) {


                  },
                ),
                AutoSizeText(
                  index == 0
                      ? '1-10'
                      : index == 1
                          ? '11-99'
                          : '100+',
                  maxFontSize: 14,
                  minFontSize: 14,
                  style: TextStyle(color: AppColor.appColorGreyNormal),
                )
              ],
            ),
          ),
        ),
      ),
      customRegistrationTextFeild(context,'Address'      ,model.textControllerManagerAddress,model),
      customRegistrationTextFeild(context,'Contact No. 1',model.textControllerManagerContactNo1,model),
      customRegistrationTextFeild(context,'Contact No. 2',model.textControllerManagerContactNo2,model)
    ],
  );
}
