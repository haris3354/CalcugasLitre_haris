import 'dart:io';
import 'package:calcugasliter/Core/Add_Car/controller/Addcar_controller.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/utils/field_validators.dart';
import 'package:calcugasliter/utils/image_cropper.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:calcugasliter/widgets/background_image_widget.dart';
import 'package:calcugasliter/widgets/center_logo.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class AddCar extends StatefulWidget {
  AddCar({Key? key}) : super(key: key);
  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  @override
  void dispose() {
    addCarController.carNameController.clear();
    addCarController.carNumberController.clear();
    addCarController.modelNumberController.clear();
    addCarController.addCarFormKey.currentState?.dispose();

    super.dispose();
  }

  final addCarController = Get.put(AddCarController());
  File? image;
  File? cropImage;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      var tempImg = File(image.path);
      cropImage = await cropGivenImage(image.path);
      if (cropImage != null) {
        setState(
          () => this.image = cropImage,
        );
      } else {
        setState(() {
          this.image = tempImg;
        });
      }
    } on PlatformException catch (_) {
      customSnackBar('Failed to load Image');
    }
  }

  Future<Widget?> imageOptionsBottomSheet() => showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
  Widget _uploadImage() => Container(
        color: Colors.black.withOpacity(0.3),
        child: GestureDetector(
          onTap: () async {
            imageOptionsBottomSheet();
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 130.h,
            width: double.infinity,
            child: DottedBorder(
              padding: const EdgeInsets.all(0),
              color: AppColors.whiteColor.withOpacity(0.5),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (image != null) ...[
                      Image.file(
                        fit: BoxFit.fill,
                        width: 300.w,
                        image!,
                        height: 130.h,
                      ),
                    ] else ...[
                      Image(
                        width: 50.w,
                        height: 50.h,
                        image: const AssetImage(AssetPath.upload),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: addCarController.addCarFormKey,
            child: Column(
              children: [
                SizedBox(height: 120.h),
                CenterLogo(
                  logoWidth: 150.w,
                  logoHeight: 150.w,
                ),
                SizedBox(height: 30.h),
                CustomTextfield(
                  hint_Text: AppStrings.carName,
                  textController: addCarController.carNameController,
                  fieldValidator: (value) =>
                      FieldValidator.validateEmpty(value!),
                  onSaved: (value) {
                    addCarController.carName = value!;
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  hint_Text: AppStrings.carNumber,
                  textController: addCarController.carNumberController,
                  fieldValidator: (value) =>
                      FieldValidator.validateEmpty(value!),
                  onSaved: (value) {
                    addCarController.carNumber = value!;
                    return null;
                  },
                ),
                SizedBox(height: 7.h),
                CustomTextfield(
                  hint_Text: AppStrings.modelNUmber,
                  fieldValidator: (value) =>
                      FieldValidator.validateEmpty(value!),
                  textController: addCarController.modelNumberController,
                  onSaved: (value) {
                    addCarController.modelNumber = value!;
                    return null;
                  },
                ),
                SizedBox(height: 7.h),
                _uploadImage(),
                SizedBox(height: 14.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.continuee.toUpperCase(),
                  onButtonPressed: () {
                    if (image != null) {
                      addCarController.addCar(image!.path);
                    }
                    if (image == null) {
                      customSnackBar('Add Car Image');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
