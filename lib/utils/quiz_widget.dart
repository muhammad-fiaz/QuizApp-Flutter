import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quiz/utils/app_widget.dart';
import 'package:quiz/utils/quiz_colors.dart';

import 'quiz_constant.dart';

TextFormField quizEditTextStyle(var hintText, {isPassword = true}) {
  return TextFormField(
    style:const TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    decoration: InputDecoration(
      contentPadding:const EdgeInsets.fromLTRB(16, 22, 16, 22),
      hintText: hintText,
      border: InputBorder.none,
      hintStyle:const TextStyle(color: quiztextColorSecondary),
    ),
  );
}

Divider quizDivider() {
  return const Divider(
    height: 1,
    color: t8viewcolor,
    thickness: 1,
  );
}

// ignore: must_be_immutable, camel_case_types
class quizButton extends StatefulWidget {
final String textContent;

  //   var icon;
  VoidCallback onPressed;

  quizButton({super.key, 
    required this.textContent,
    required this.onPressed,
    //   @required this.icon,
  });

  @override
  quizButtonState createState() => quizButtonState();
}

// ignore: camel_case_types
class quizButtonState extends State<quizButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          decoration: boxDecoration(bgColor: quizcolorPrimary, radius: 16),
          padding:const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: text(widget.textContent, textColor: t8white, fontFamily: fontMedium, textAllCaps: false),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration:const BoxDecoration(shape: BoxShape.circle, color: quizcolorPrimaryDark),
                  width: 35,
                  height: 35,
                  child:const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: t8white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class quizTopBar extends StatefulWidget {
  final String titleName;

  const quizTopBar(this.titleName, {super.key});

  @override
  State<StatefulWidget> createState() {
    return quizTopBarState();
  }
}

// ignore: camel_case_types
class quizTopBarState extends State<quizTopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            IconButton(
              icon:const Icon(Icons.arrow_back),
              color: t8colorPrimary,
              onPressed: () {
                finish(context);
              },
            ),
            Center(
              child: Text(
                widget.titleName,
                maxLines: 2,
                style:const TextStyle(fontFamily: fontBold, fontSize: 22, color: t8textColorPrimary),
              ).center(),
            )
          ],
        ),
      ),
    );
  }
}

Container quizHeaderText(var text) {
  return Container(
    margin:const EdgeInsets.only(top: 16),
    child: Text(
      text,
      maxLines: 2,
      style:const TextStyle(fontFamily: fontBold, fontSize: 22, color: t8textColorPrimary),
    ),
  );
}

class PinEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final String? onSubmit;
  final double fieldWidth;
  final double fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;

   const PinEntryTextField({super.key, this.lastPin, this.fields = 4, this.onSubmit, this.fieldWidth = 40.0, this.fontSize = 16.0, this.isTextObscure = false, this.showFieldAsBox = false}) : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(widget.fields, null, growable: false);
    _focusNodes = List<FocusNode?>.filled(widget.fields, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.fields, null, growable: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    _textControllers.forEach((TextEditingController? t) => t!.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, verticalDirection: VerticalDirection.down, children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach((TextEditingController? tEditController) => tEditController!.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i]!.text = widget.lastPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    return Container(
      width: widget.fieldWidth,
      margin:const EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(color: Colors.black, fontFamily: fontMedium, fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(counterText: "", border: widget.showFieldAsBox ? const OutlineInputBorder(borderSide: BorderSide(width: 2.0)) : null),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}

showToast(String caption) {
  Fluttertoast.showToast(msg: caption, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, backgroundColor: getColorFromHex("5362FB"), textColor: quizwhite, fontSize: 16.0);
}
