// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable, unused_local_variable
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calcugasliter/Core/Add_Car/controller/updateCar_controller.dart';
import 'package:calcugasliter/Core/AllCars/model/allcars_model.dart';
import 'package:calcugasliter/Core/home/widgets/custom_drawer.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/field_validators.dart';
import 'package:calcugasliter/utils/image_cropper.dart';
import 'package:calcugasliter/utils/network_strings.dart';
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
import 'package:logger/logger.dart';

Logger logger = Logger();

class UpdateCar extends StatefulWidget {
  Cars carDetails;
  UpdateCar(this.carDetails, {Key? key}) : super(key: key);
  @override
  State<UpdateCar> createState() => _UpdateCarState();
}

class _UpdateCarState extends State<UpdateCar> {
  final updateCarController = Get.put(UpdateCarController());
  File? image;
  File? cropImage;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      var tempImage = File(image.path);
      cropImage = await cropGivenImage(image.path);
      if (cropImage != null) {
        setState(
          () => this.image = cropImage,
        );
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
                      CachedNetworkImage(
                        imageUrl: NetworkStrings.imageBaseUrl +
                            widget.carDetails.carImage!,
                        fit: BoxFit.fill,
                        width: 300.w,
                        height: 130.h,
                        placeholder: (context, url) =>
                            shimmerAvatar(300.w, 130.h),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
            key: updateCarController.updateCarFormKey,
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
                  textController: updateCarController.carNameController
                    ..text = widget.carDetails.carName!,
                  fieldValidator: (value) =>
                      FieldValidator.validateEmpty(value!),
                  onSaved: (value) {
                    updateCarController.carName = value!;
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                CustomTextfield(
                  hint_Text: AppStrings.carNumber,
                  textController: updateCarController.carNumberController
                    ..text = widget.carDetails.carNumber!,
                  fieldValidator: (value) =>
                      FieldValidator.validateEmpty(value!),
                  onSaved: (value) {
                    updateCarController.carNumber = value!;
                    return null;
                  },
                ),
                SizedBox(height: 7.h),
                CustomTextfield(
                  hint_Text: AppStrings.modelNUmber,
                  fieldValidator: (value) =>
                      FieldValidator.validateEmpty(value!),
                  textController: updateCarController.modelNumberController
                    ..text = widget.carDetails.carNumber!,
                  onSaved: (value) {
                    updateCarController.modelNumber = value!;
                    return null;
                  },
                ),
                SizedBox(height: 7.h),
                _uploadImage(),
                SizedBox(height: 14.h),
                SimpleButton(
                  button_color: AppColors.blackColor,
                  button_label: AppStrings.editCar,
                  onButtonPressed: () {
                    updateCarController.updateCar(
                        image?.path, widget.carDetails.id!);
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
