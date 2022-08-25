// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:calcugasliter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  String? hint_Text;
  TextEditingController? textController;
  bool? isPasswordField;
  bool? isSuffixIcon;
  bool isReadOnly;
  bool isCenterText;

  String? Function(String?)? fieldValidator;
  String? Function(String?)? onSaved;
  String? initialVal;
  TextInputType? fieldType;

  void Function(String)? onChanged;
  CustomTextfield({
    this.hint_Text,
    this.isReadOnly = false,
    this.textController,
    this.initialVal,
    this.isSuffixIcon,
    this.fieldType = TextInputType.text,
    this.fieldValidator,
    this.onSaved,
    this.isPasswordField = false,
    this.isCenterText = false,
    this.onChanged,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.black.withOpacity(0.4),
          ),
          height: 50.h,
        ),
        TextFormField(
          readOnly: widget.isReadOnly,
          initialValue: widget.initialVal,
          textAlign: widget.isCenterText ? TextAlign.center : TextAlign.left,
          keyboardType: widget.fieldType,
          validator: widget.fieldValidator,
          obscureText: widget.isPasswordField!,
          controller: widget.textController,
          onSaved: widget.onSaved,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.whiteColor,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isSuffixIcon ?? false
                ? IconButton(
                    icon: Icon(
                      isvisible ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        isvisible = !isvisible;
                        widget.isPasswordField = !(widget.isPasswordField)!;
                      });
                    },
                  )
                : null,
            contentPadding:
                EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
            border: InputBorder.none,
            hintText: widget.hint_Text,
            errorStyle: const TextStyle(color: Colors.orangeAccent),
            hintStyle: TextStyle(
              color: AppColors.dimWhiteColor,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
