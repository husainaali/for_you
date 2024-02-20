part of 'registration_page_view.dart';

customRegistrationTextFeild(context, label) {
  return TextField(
    keyboardType: TextInputType.name,
    obscureText: true,
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

customUserForm(context) {
  return Column(
    children: [
      customRegistrationTextFeild(context, 'Full Name'),
      customRegistrationTextFeild(context, 'Personal ID'),
      customRegistrationTextFeild(context, 'Occupation'),
      customRegistrationTextFeild(context, 'Date of Birth '),
      customRegistrationTextFeild(context, 'Address'),
      customRegistrationTextFeild(context, 'Contact No. 1'),
      customRegistrationTextFeild(context, 'Contact No. 2')
    ],
  );
}

customManagerForm(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customRegistrationTextFeild(context, 'Commercial Name'),
      
      customRegistrationTextFeild(context, 'Commercial ID'),
      customRegistrationTextFeild(context, 'Business Type'),
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
                  onChanged: (value) {},
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
      customRegistrationTextFeild(context, 'Address'),
      customRegistrationTextFeild(context, 'Contact No. 1'),
      customRegistrationTextFeild(context, 'Contact No. 2')
    ],
  );
}
