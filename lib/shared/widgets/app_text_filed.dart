import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_shot/core/style/colors.dart';
import 'package:snap_shot/core/style/fonts.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.onSaved,
    this.isPasswordField,
    required this.keyboardType,
    this.suffix,
    this.onFocusChange,
    this.prefix,
    this.foucsedBorderColor,
    this.filedTextStyle,
  });
  final String hintText;
  final void Function(String?) onSaved;
  final bool? isPasswordField;
  final TextInputType keyboardType;
  final Widget? suffix, prefix;
  final ValueChanged<bool>? onFocusChange;
  final Color? foucsedBorderColor;
  final TextStyle? filedTextStyle;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool isVisable;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {});
      widget.onFocusChange?.call(_focusNode.hasFocus);
    });

    isVisable = false;
  }

  @override
  dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onSaved: widget.onSaved,
      cursorColor: AppColors.instance.black,
      cursorHeight: 20.h,
      style: AppTextStyle.instance.text16W400.copyWith(
        color: widget.foucsedBorderColor ?? AppColors.instance.black,
        fontWeight: FontWeight.w900,
      ),
      keyboardType: widget.keyboardType,
      obscureText: widget.isPasswordField == null
          ? false
          : widget.isPasswordField == true
          ? !isVisable
          : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
            widget.filedTextStyle ?? AppTextStyle.instance.textFieldStyle,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        suffixIcon: widget.isPasswordField != null
            ? Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisable = !isVisable;
                    });
                  },

                  icon: Icon(
                    isVisable == true ? Icons.visibility : Icons.visibility_off,
                    size: 16.h,
                    color: AppColors.instance.darkGrey,
                  ),
                ),
              )
            : widget.suffix,
        prefixIcon: widget.prefix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: widget.foucsedBorderColor ?? AppColors.instance.black,
            width: 3.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.foucsedBorderColor != null
                ? Colors.grey[200]!
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
