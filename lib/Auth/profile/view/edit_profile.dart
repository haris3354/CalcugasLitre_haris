// ignore_for_file: non_constant_identifier_names, unused_element, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:calcugasliter/Auth/login/model/login_model.dart';
import 'package:calcugasliter/Auth/login/model/social_login_response.dart';
import 'package:calcugasliter/Auth/profile/controller/update_profile_controller.dart';
import 'package:calcugasliter/screens/splash_screen.dart';
import 'package:calcugasliter/utils/app_colors.dart';
import 'package:calcugasliter/utils/app_strings.dart';
import 'package:calcugasliter/utils/asset_path.dart';
import 'package:calcugasliter/utils/field_validators.dart';
import 'package:calcugasliter/utils/loader.dart';
import 'package:calcugasliter/utils/network_strings.dart';
import 'package:calcugasliter/widgets/Custom_SnackBar.dart';
import 'package:calcugasliter/widgets/custom_appbar.dart';
import 'package:calcugasliter/widgets/custom_textfield.dart';
import 'package:calcugasliter/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

Logger log = Logger();

class _EditProfileState extends State<EditProfile> {
  File? image;
  TextEditingController cc = TextEditingController();
  final editcontroller = Get.find<updateProfileController>();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final tempImage = File(image.path);
      setState(() => this.image = tempImage);
    } on PlatformException catch (_) {
      customSnackBar('Failed to load Image');
    }
  }

  Future<void> uploadImage(String val) async {
    showLoading();
    var token = box.read('token');
    Map<String, String> header = {"Authorization": 'Bearer $token'};
    var uri = Uri.parse(NetworkStrings.apiBaseUrl + 'updateprofile');
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(header);
    request.fields['full_name'] = val;
    log.e(val);
    if (image != null) {
      var multipart = http.MultipartFile.fromPath('image', image!.path);
      request.files.add(await multipart);
    }
    var streamResponse = await request.send();
    var response = await http.Response.fromStream(streamResponse);
    if (response.statusCode == 200) {
      box.write('name', val);

      stopLoading();
      if (box.read('isSocial') == false) {
        var obj = LoginResponseModel.fromJson(jsonDecode(response.body));
        editcontroller.setFields(
            obj.user?.fullName, obj.user?.image, obj.user?.userEmail);
        box.write('image', obj.user?.image);
        customSnackBar('Profile Updated successfully');
      } else {
        var obj = SocialLoginResponse.fromJson(jsonDecode(response.body));
        editcontroller.setFields(obj.user?.fullName, obj.user?.image, null);
        box.write('image', obj.user?.image);
        customSnackBar('Profile Updated successfully');
      }
    } else {
      customSnackBar('Failed To load image in Server');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          appBar: const CustomAppBar(title: 'Edit Profile'),
          body: SingleChildScrollView(
            child: Form(
              key: editcontroller.updateProfileFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        child: image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: editcontroller.image,
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                        // Image.network(
                        //     editcontroller.image,
                        //     fit: BoxFit.cover,
                        //   ),
                      ),
                      Positioned(
                        right: -5,
                        bottom: -5,
                        child: GestureDetector(
                          child: Container(
                            color: Colors.red,
                            width: 30,
                            height: 30,
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              color: Colors.black,
                              child: Image.asset(AssetPath.upload),
                            ),
                          ),
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: (Context) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        Get.back();
                                        pickImage(ImageSource.camera);
                                      }),
                                  ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        Get.back();
                                        pickImage(ImageSource.gallery);
                                      }),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  CustomTextfield(
                    isReadOnly: true,
                    initialVal: box.read('email'),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextfield(
                    textController: cc..text = box.read('name'),
                    fieldValidator: (value) {
                      return FieldValidator.validateEmpty(value!);
                    },
                  ),
                  SizedBox(height: 20.h),
                  SimpleButton(
                    button_color: AppColors.blackColor,
                    button_label: AppStrings.continuee.toUpperCase(),
                    onButtonPressed: () {
                      // editcontroller.updateProfile();
                      // controller.name = editcontroller.name;
                      uploadImage(cc.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
