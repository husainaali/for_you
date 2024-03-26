part of 'custom_widget_helper.dart';

Container imagePickerWidget(BuildContext context, SettingPageViewModel model) =>
    Container(
      height: customHeight(context, percentage: 0.35),
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 5),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: customHeight(context, percentage: 0.05),
                width: customWidth(context, percentage: 0.9),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    const SizedBox(width: 15),
                    const Text(
                      "Picture/Video",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColor.appColorMainRed,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: SizedBox(
              height: customHeight(context, percentage: 0.25),
              width: customHeight(context, percentage: 0.8),
              child: Card(
                elevation: 3,
                child: GestureDetector(
                  onTap: () {
                    model.pickImage();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: AppColor.appColorMainRed,
                      child: Padding(
                        padding: model.mediaFile != null &&
                                model.mediaFile!.path != ''
                            ? const EdgeInsets.all(0)
                            : const EdgeInsets.only(
                                left: 30, right: 30, top: 40),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                model.pickImage();
                              },
                              child: model.mediaFile != null &&
                                      model.mediaFile!.path != ''
                                  ? SizedBox(
                                      height: customHeight(context,
                                          percentage: 0.22),
                                      width: customHeight(context,
                                          percentage: 0.8),
                                      child: Image.file(
                                        File(model.mediaFile!.path),
                                        fit: BoxFit.contain,
                                        alignment: Alignment.center,
                                      ))
                                  : Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              model.pickImage();
                                            },
                                            icon: Icon(
                                              Icons.upload,
                                              size: 65,
                                            )),
                                        Container(
                                          height: customHeight(context,
                                              percentage: 0.03),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "Upload your Ads",
                                            style: TextStyle(
                                                color: AppColor.appColorWhite),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
