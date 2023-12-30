import 'package:flutter/material.dart';

class CustomPinInputField extends StatefulWidget {
  final ValueChanged<String>? onComplete;

  const CustomPinInputField({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<CustomPinInputField> createState() => _CustomPinInputFieldState();

}

class _CustomPinInputFieldState extends State<CustomPinInputField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(6, (index) => FocusNode());
    _controllers = List.generate(6, (index) => TextEditingController());

    for (int i = 0; i < _controllers.length - 1; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
            (index) => Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,

            maxLength: 1,
            onChanged: (value) {
              if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }

              if (index == 5 && value.isNotEmpty) {
                // Notify onComplete when all digits are entered
                String pin = _controllers.map((controller) => controller.text).join();
                widget.onComplete?.call(pin);
              }
            },
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
