import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustoDropDown extends StatefulWidget {
  final List<DropdownMenuItem>? dropItems;
  final Function(dynamic val) onChange;
  final String? lable;
  const CustoDropDown({super.key,this.dropItems,required this.onChange,this.lable});

  @override
  State<CustoDropDown> createState() => _CustoDropDownState();
}

class _CustoDropDownState extends State<CustoDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(items:widget.dropItems , onChanged: (val){
      widget.onChange(val);
    },
    decoration: InputDecoration(

          label: Text("${widget.lable}"),
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
