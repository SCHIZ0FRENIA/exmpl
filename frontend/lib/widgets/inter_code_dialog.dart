import 'package:flutter/material.dart';
import 'package:frontend/pages/chat.dart';

class InterDialogExample extends StatefulWidget {
  const InterDialogExample({super.key});

  @override
  State<InterDialogExample> createState() => InterDialogExampleState();
}

class InterDialogExampleState extends State<InterDialogExample> {
  final TextEditingController codeController = TextEditingController();

  String code = '';
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter chat code',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                setState(() {
                  code = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Code',
                errorText: isSubmitted ? validateCode(code) : null,
                hintStyle: TextStyle(color: Color(0x88888888)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: handleCreateChat,
                  child: const Text(
                    'Create chat',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handleCreateChat() {
    setState(() {
      isSubmitted = true;
    });
    final codeError = validateCode(code);
    if (codeError == null) {

      //ЛОГИКА СОЗДАНИЯ ЧАТА

      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatPage()),
      );
    }
  }

  validateCode(String code) {
    if (code == null || code.isEmpty) {
      return 'Enter code';
    }
    if (code.length != 6 ) {
      return 'Code must be 6 characters';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(code)) {
      return 'Code must contain only digits';
    }
    return null;
  }
}