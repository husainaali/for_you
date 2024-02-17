part of 'shipment_details_view.dart';

customShipmentDetailsContainer(context) {
  return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: customWidth(context),
        height: customHeight(context, percentage: 0.3),
        decoration: BoxDecoration(
            color: AppColor.appColorGreylight.withOpacity(0.5),
            border: Border.all(color: AppColor.appColorAccentRed)),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.all(customHeight(context, percentage: 0.0162)),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.appColorCornflowerBlue,
                backgroundColor: AppColor.appColorGreylight,
                value: 0.7,
                semanticsLabel: 'aa',
                minHeight: customHeight(context, percentage: 0.02),
              ),
            ),
            Gap(customHeight(context, percentage: 0.02)),
            Row(
              children: [
                Gap(customHeight(context, percentage: 0.02)),
                SizedBox(
                  width: customHeight(context, percentage: 0.26),
                  child: RichText(
                    textScaleFactor: 1.0,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Type  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'Electronic Device\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: '\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.01),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'Sender  ',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'ForYou Hypermarket\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: '\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.01),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'Out for Delivery - 12 feb 2024 ',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: customWidth(context, percentage: 0.33),
                  child: RichText(
                    textScaleFactor: 1.0,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.01),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'Total Amount\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: '2.8 BHD\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'Status\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                        TextSpan(
                          text: 'Paid by sender\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: customHeight(context, percentage: 0.017),
                            color: AppColor.appColorGreyNormal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Gap(customWidth(context, percentage: 0.043)),
                SizedBox(
                  width: customWidth(context, percentage: 0.37),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'From Address\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: customHeight(context, percentage: 0.017),
                          color: AppColor.appColorGreyNormal,
                        ),
                      ),
                      TextSpan(
                        text: '\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: customHeight(context, percentage: 0.007),
                          color: AppColor.appColorGreyNormal,
                        ),
                      ),
                      TextSpan(
                        text:
                            'ForYou suppermarket - Manama Brunch, building 1234 road 321 block 99',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: customHeight(context, percentage: 0.014),
                          color: AppColor.appColorGreyNormal,
                        ),
                      ),
                    ]),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: customWidth(context, percentage: 0.4),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'To Address\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: customHeight(context, percentage: 0.017),
                          color: AppColor.appColorGreyNormal,
                        ),
                      ),
                      TextSpan(
                        text: '\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: customHeight(context, percentage: 0.007),
                          color: AppColor.appColorGreyNormal,
                        ),
                      ),
                      TextSpan(
                        text:
                            'ForYou suppermarket - Manama Brunch, building 1234 road 321 block 99',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: customHeight(context, percentage: 0.014),
                          color: AppColor.appColorGreyNormal,
                        ),
                      ),
                    ]),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_location_alt_outlined),
                  color: AppColor.appColorCornflowerBlue,
                )
              ],
            )
          ],
        ),
      ));
}

Widget customShipmentHistoryTimeLine(BuildContext context) {
  return SizedBox(
    width: customWidth(context),
    height: customHeight(context),
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 40,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(width: 1.0, color: AppColor.appColorGreyNormal),
            ),
          ),
          height: customHeight(context, percentage: 0.17),
          width: customWidth(context),
          child: Row(
            children: [
              Gap(customWidth(context, percentage: 0.06)),
              Column(
                children: [
                  Container(
                    color: AppColor.appColorGreyNormal,
                    width: customWidth(context, percentage: 0.002),
                    height: customHeight(context, percentage: 0.04),
                  ),
                  Container(
                    width: customHeight(context, percentage: 0.015),
                    height: customHeight(context, percentage: 0.015),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.appColorGreyNormal),
                  ),
                  Container(
                    color: AppColor.appColorGreyNormal,
                    width: customWidth(context, percentage: 0.002),
                    height: customHeight(context, percentage: 0.113),
                  ),
                ],
              ),
              RichText(
                textScaleFactor: 1.0,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Out for Delivery\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: customHeight(context, percentage: 0.017),
                        color: AppColor.appColorGreyNormal,
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: customHeight(context, percentage: 0.01),
                        color: AppColor.appColorGreyNormal,
                      ),
                    ),
                    TextSpan(
                      text: '11 feb 2024\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: customHeight(context, percentage: 0.017),
                        color: AppColor.appColorGreyNormal,
                      ),
                    ),
                                        TextSpan(
                      text: '\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: customHeight(context, percentage: 0.01),
                        color: AppColor.appColorGreyNormal,
                      ),
                    ),
                    TextSpan(
                      text: 'Manama - Bahrain\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: customHeight(context, percentage: 0.017),
                        color: AppColor.appColorGreyNormal,
                      ),
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
