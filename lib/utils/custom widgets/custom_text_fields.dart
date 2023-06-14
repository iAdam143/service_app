import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:intl/intl.dart';

class IconTextField extends StatelessWidget {
  final String svgPath;
  final String hintText;

  const IconTextField(
      {super.key, required this.svgPath, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        String name = value;
      },
      decoration: InputDecoration(
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset(
            svgPath,
          ),
        ),
        hintText: hintText,
        hintStyle: paragraph_2,
        enabledBorder: const UnderlineInputBorder(
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
  const PasswordTextField({super.key});

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
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: mygreyColor,
            width: 1.0,
          ),
        ),
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset('assets/images/man-1.svg'),
        ),
        hintText: 'your password here',
        hintStyle: paragraph_2,
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
  const FourDigitTextField({super.key});

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
        return SizedBox(
          width: 50,
          height: 60,
          child: TextField(
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
            focusNode: focusNodes[index],
            onChanged: (value) {
              digitList[index] = value;
              if (value.isNotEmpty && index < 3) {
                focusNodes[index + 1].requestFocus();
              }
              setState(() {});
            },
            decoration: const InputDecoration(
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

class DatePickerTextField extends StatefulWidget {
  final Function(DateTime) onDateSelected; // Callback function

  const DatePickerTextField({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  late TextEditingController _dateController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text =
            DateFormat('EEEE - dd MMM yyyy').format(_selectedDate);
      });

      widget.onDateSelected(_selectedDate); // Invoke the callback function
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      onTap: () {
        _selectDate(context);
      },
      decoration: InputDecoration(
        hintText: 'Select date',
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset('assets/images/calendar.svg'),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: mygreyColor,
            width: 1.0,
          ),
        ),
      ),
      readOnly: true,
    );
  }
}

class TimePickerTextField extends StatefulWidget {
  const TimePickerTextField({super.key});

  @override
  _TimePickerTextFieldState createState() => _TimePickerTextFieldState();
}

class _TimePickerTextFieldState extends State<TimePickerTextField> {
  late TextEditingController _timeController;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController();
    _selectedTime = TimeOfDay.now();
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = DateFormat('hh:mm a')
            .format(DateTime(1, 1, 1, pickedTime.hour, pickedTime.minute));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _timeController,
      onTap: () {
        _selectTime(context);
      },
      decoration: InputDecoration(
        hintText: 'Select time',
        prefixIcon: Transform.scale(
          scale: 0.5,
          child: SvgPicture.asset('assets/images/time.svg'),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: mygreyColor,
            width: 1.0,
          ),
        ),
      ),
      readOnly: true,
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  String _formattedText = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_formatInput);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _formatInput() {
    final unformattedText = _controller.text.replaceAll(RegExp(r'[^0-9/]'), '');

    if (unformattedText.length <= 4) {
      final formattedText = StringBuffer();

      if (unformattedText.length >= 2) {
        formattedText.write(unformattedText.substring(0, 2));
      } else {
        formattedText.write(unformattedText);
      }

      if (unformattedText.length >= 4) {
        formattedText.write('/${unformattedText.substring(2, 4)}');
      }

      setState(() {
        _formattedText = formattedText.toString();
      });
    } else {
      _controller.value = _controller.value.copyWith(
        text: _formattedText,
        selection: TextSelection.collapsed(offset: _formattedText.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'MM/YY',
        hintStyle: paragraph_2,
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

class SimpleTextField extends StatelessWidget {
  final String hintText;

  const SimpleTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        String name = value;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: paragraph_2,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: mygreyColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
