import 'package:ai_chat_bot_app/constant/const.dart';

import 'package:ai_chat_bot_app/utils/button.dart';
import 'package:ai_chat_bot_app/utils/spacer.dart';
import 'package:ai_chat_bot_app/views/homepage_repo.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? controller;
  FocusNode? focusNode;
  final List<String> inputTags = [];
  String response = '';

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Text(
                'Find the best recipe for cooking',
                maxLines: 3,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      autocorrect: true,
                      controller: controller,
                      autofocus: true,
                      focusNode: focusNode,
                      onFieldSubmitted: (value) {
                        controller!.clear();
                        setState(() {
                          String inputvalue = value.trim();
                          if (inputvalue.isNotEmpty) {
                            inputTags.add(inputvalue);
                            focusNode!.requestFocus();
                          }
                          controller!.clear();
                        });
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.5),
                                bottomLeft: Radius.circular(5.5)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          labelText: "Enter the ingredients you have",
                          labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(9),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            String inputvalue = controller!.text.trim();
                            if (inputvalue.isNotEmpty) {
                              inputTags.add(inputvalue);
                              focusNode!.requestFocus();
                            }
                          });
                          print(inputTags);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Wrap(
                  children: [
                    for (int i = 0; i < inputTags.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Chip(
                          backgroundColor: Color(
                                  (math.Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                              .withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.5)),
                          onDeleted: () {
                            setState(() {
                              inputTags.remove(inputTags[i]);
                              print(inputTags);
                            });
                          },
                          label: Text(inputTags[i]),
                          deleteIcon: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                child: Center(
                  child: SingleChildScrollView(
                    child: Text(
                      response,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )),
              HeightSpacer(myHeight: kSpacing / 2),
              Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryBtn(
                    btnChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.auto_awesome),
                        WidthSpacer(myWidth: kSpacing / 2),
                        const Text('Create Recipe'),
                      ],
                    ),
                    btnFun: () async {
                      setState(() => response = 'Thinking...');

                      try {
                        var temp =
                            await HomePageRepo().askAI(inputTags.toString());
                        setState(() => response = temp.toString());
                      } catch (e) {
                        setState(() => response = 'ERROR:$e');
                      }
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
