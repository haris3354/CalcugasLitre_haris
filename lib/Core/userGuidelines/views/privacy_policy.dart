import 'package:calcugasliter/Core/userGuidelines/guidelines_controller.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/asset_path.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final contentController = Get.put(ContentController());

  @override
  void initState() {
    contentController.fetchGuideLine(NetworkStrings.privacyPolicy);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContentController>(builder: (context) {
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(title: AppStrings.privacyPolicy),
            body: Column(
              children: [
                Container(
                  color: AppColors.blackColor.withOpacity(0.2),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 20.h,
                  ),
                  width: double.infinity,
                  height: 500.h,
                  child: Text(
                    (contentController.data?[0].content) ?? 'Loading...',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SimpleButton(
                  button_label: AppStrings.continuee,
                  button_color: AppColors.blackColor,
                  onButtonPressed: () {
                    // Get.to(PrivacyPolicy());
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
