import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lms/ui/components/custoappbar.dart';
import 'package:lms/ui/components/custoelevatbut.dart';

class QuizzeUi extends StatefulWidget {
  const QuizzeUi({super.key});

  @override
  State<QuizzeUi> createState() => _QuizzeUiState();
}

class _QuizzeUiState extends State<QuizzeUi> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: custoAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. Which is the animal referred as the ship of the desert?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(child: Text("(A) Cheetah")),
                            Radio(value: 1, groupValue: 2, onChanged: (val) {})

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(child: Text("(B) Cheetah")),
                            Radio(value: 1, groupValue: 2, onChanged: (val) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(child: Text("(C) Camel")),
                            Radio(value: 1, groupValue: 1, onChanged: (val) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(child: Text("(D) Cheetah")),
                            Radio(value: 1, groupValue: 2, onChanged: (val) {})
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              CustoElevatButton(
                textWidget: Text(
                  "Submit",
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                horiPad: 30,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
