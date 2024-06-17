import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final bool autofocus;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String obscuringCharacter;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final dynamic maxLines;
  final dynamic action;
  final dynamic errorText;

  TextFormFieldCustom({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    required this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.hintStyle,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.obscuringCharacter = '*',
    this.height = 60,
    this.width = 320,
    this.maxLines = 1,
    this.action,
    this.errorText,
    this.backgroundColor,
  }) : super(key: key);
  bool obscured = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        obscuringCharacter: obscuringCharacter,
        controller: controller,
        autofocus: autofocus,
        onTap: onTap,
        enabled: enabled,
        obscureText: obscureText,
        validator: validator,
        keyboardType: action != null ? TextInputType.multiline : keyboardType,
        maxLines: maxLines,
        textInputAction: action,
        decoration: InputDecoration(
          isDense: false,
          contentPadding: EdgeInsets.only(
              left: prefixIcon == null ? 20 : 10, top: 12, bottom: 12),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 17,
                color: Color(0xff828282),
              ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: const OutlineInputBorder(
            // gapPadding: 3,
            borderSide: BorderSide(
              color: Color(0xff828282),
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          errorText: errorText,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Color(0xff828282),
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Color(0xff828282),
              width: 1,
            ),
          ),
          filled: true,
          fillColor: backgroundColor ?? Colors.white,
        ),
        onSaved: (newValue) => onSaved,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

class TextFormFieldCustomPass extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final bool autofocus;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String obscuringCharacter;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final dynamic maxLines;
  final dynamic action;
  final dynamic errorText;

  const TextFormFieldCustomPass({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    required this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.hintStyle,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.obscuringCharacter = '*',
    this.height = 60,
    this.width = 320,
    this.maxLines = 1,
    this.action,
    this.errorText,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<TextFormFieldCustomPass> createState() =>
      _TextFormFieldCustomPassState();
}

class _TextFormFieldCustomPassState extends State<TextFormFieldCustomPass> {
  bool obscured = false;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        obscured = widget.obscureText;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        obscuringCharacter: widget.obscuringCharacter,
        controller: widget.controller,
        autofocus: widget.autofocus,
        onTap: widget.onTap,
        enabled: widget.enabled,
        obscureText: obscured,
        validator: widget.validator,
        keyboardType: widget.action != null
            ? TextInputType.multiline
            : widget.keyboardType,
        maxLines: widget.maxLines,
        textInputAction: widget.action,
        decoration: InputDecoration(
          isDense: false,
          contentPadding: EdgeInsets.only(
              left: widget.prefixIcon == null ? 20 : 10, top: 12, bottom: 12),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              TextStyle(
                fontSize: 17,
                color: Color(0xff828282),
              ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.obscureText) {
                    obscured = !obscured;
                  }
                });
              },
              child: widget.suffixIcon),
          focusedBorder: const OutlineInputBorder(
            // gapPadding: 3,
            borderSide: BorderSide(
              color: Color(0xff828282),
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          errorText: widget.errorText,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Color(0xff828282),
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Color(0xff828282),
              width: 1,
            ),
          ),
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
        ),
        onSaved: (newValue) => widget.onSaved,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
