import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsafira/app/helper/theme.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final bool? enabled;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final bool useObscure;
  final Stream<String>? streamValidation;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autofillHints;
  final Color? fillColor;
  final OutlineInputBorder? border;
  final bool? readOnly;
  final bool? useToggle;
  final VoidCallback? ontap;
  final TextAlign? textAlign;

  const CustomTextField(
      {Key? key,
      this.enabled,
      this.labelText,
      this.hintText,
      this.errorText,
      this.keyboardType,
      this.maxLines,
      this.maxLength,
      this.controller,
      this.onChanged,
      required this.useObscure,
      this.streamValidation,
      this.validator,
      this.onSaved,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputAction,
      this.inputFormatters,
      this.autofillHints,
      this.fillColor,
      this.border,
      this.readOnly,
      this.useToggle,
      this.ontap,
      this.textAlign})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  FocusNode myFocusNode = new FocusNode();
  void initState() {
    if (widget.useObscure) {
      _obscureText = true;
    }
    super.initState();
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? suffixIcon;

    if (widget.useObscure) {
      suffixIcon = IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
            color: AppTheme.brokenWhiteColor,
            size: 20,
          ),
          onPressed: () => _toggleObscure());
    }

    if (widget.suffixIcon != null) {
      suffixIcon = widget.suffixIcon;
    }

    return TextFormField(
      onTap: widget.ontap,
      onSaved: widget.onSaved,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      style: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),
      textAlignVertical: TextAlignVertical.bottom,
      textAlign: widget.textAlign ?? TextAlign.left,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly ?? false,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        fillColor: AppTheme.whiteColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: AppTheme.accentColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: AppTheme.brokenWhiteColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: AppTheme.redColor),
        ),
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        disabledBorder: widget.border,
        errorText: widget.errorText,
        errorStyle: TextStyle(color: AppTheme.redColor),
        hintText: widget.hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        ),
        hintMaxLines: widget.maxLines,
        labelStyle: TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
