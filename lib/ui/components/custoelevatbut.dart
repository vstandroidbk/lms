import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/utils/sharepreference.dart';

import '../../utils/colors.dart';

class CustoElevatButton extends StatefulWidget {
  final Function()? onTap;
  final Widget? textWidget;
  final double? horiPad;
  final double? vertiPad;
  const CustoElevatButton({super.key,this.onTap,this.textWidget,this.horiPad,this.vertiPad});

  @override
  State<CustoElevatButton> createState() => _CustoElevatButtonState();
}

class _CustoElevatButtonState extends State<CustoElevatButton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: widget.onTap, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),padding: EdgeInsets.symmetric(horizontal: widget.horiPad??10,vertical: widget.vertiPad??3),backgroundColor:clrSecondary,foregroundColor: clrForground),child: widget.textWidget);
  }
}
