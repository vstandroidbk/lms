import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/colors.dart';

class CustoTextFieldWithLable extends StatefulWidget {
  final TextEditingController? controller;
  final String? lable;
  final int? maxLines;
  final bool? obscure;
  final bool? hidePtandDot;
  final TextInputType? ktype;
  final Widget? suficIcon;
  final Widget? prefix;
  const CustoTextFieldWithLable({super.key,this.controller,this.lable,this.suficIcon,this.prefix,this.obscure,this.ktype,this.hidePtandDot,this.maxLines});

  @override
  State<CustoTextFieldWithLable> createState() => _CustoTextFieldWithLableState();
}

class _CustoTextFieldWithLableState extends State<CustoTextFieldWithLable> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure??false,
      controller: widget.controller,
      keyboardType:widget.ktype ,
      inputFormatters:widget.hidePtandDot==true? [FilteringTextInputFormatter.digitsOnly]:null,
      decoration: InputDecoration(

          label: Text("${widget.lable}"),
          suffixIcon: widget.suficIcon,
          prefixIcon: widget.prefix,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: clrBlack.withOpacity(0.3))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: clrBlack.withOpacity(0.3))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(color: clrBlack.withOpacity(0.3)))),
    );
  }
}
