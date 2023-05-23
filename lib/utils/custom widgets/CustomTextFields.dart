import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/textstyles.dart';

class IconTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;

  IconTextField({required this.icon, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        hintStyle: Paragraph_2,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mygreyColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mygreyColor,
            width: 1.0,
          ),
        ),
        prefixIcon: Icon(Icons.lock),
        hintText: 'your password here',
        hintStyle: Paragraph_2,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: myDarkGreyColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}

class FourDigitTextField extends StatefulWidget {
  @override
  _FourDigitTextFieldState createState() => _FourDigitTextFieldState();
}

class _FourDigitTextFieldState extends State<FourDigitTextField> {
  List<String> digitList = List.filled(4, '');
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Container(
          width: 50,
          height: 60,
          child: TextField(
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
            focusNode: focusNodes[index],
            onChanged: (value) {
              digitList[index] = value;
              if (value.isNotEmpty && index < 3) {
                focusNodes[index + 1].requestFocus();
              }
              setState(() {});
            },
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mygreyColor),
              ),
            ),
          ),
        );
      }),
    );
  }
}
