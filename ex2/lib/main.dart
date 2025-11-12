import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final ButtonType type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    this.type = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    if (type == ButtonType.primary) {
      buttonColor = Colors.blue;
    } else if (type == ButtonType.secondary) {
      buttonColor = Colors.green;
    } else {
      buttonColor = Colors.grey;
    }

    bool isDisabled = type == ButtonType.disabled;

    return Opacity(
      opacity: isDisabled ? 0.6 : 1,
      child: GestureDetector(
        onTap: isDisabled ? null : () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$text button pressed')),
          );
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: iconPosition == IconPosition.left
                ? [
                    Icon(icon, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ]
                : [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(icon, color: Colors.white),
                  ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Buttons')),
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomButton(
                text: 'Submit',
                icon: Icons.check,
                type: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Time',
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Account',
                icon: Icons.person,
                type: ButtonType.disabled,
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
