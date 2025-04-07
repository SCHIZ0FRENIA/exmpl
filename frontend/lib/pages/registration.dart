import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String username = '';
  String password = '';
  String confirmPassword = '';
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Text(
                  'Registration',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Username',
                    errorText: isSubmitted ? validateUsername(username) : null,
                    hintStyle: TextStyle(color: Color(0x88888888)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: isSubmitted ? validatePassword(password) : null,
                    hintStyle: TextStyle(color: Color(0x88888888)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  onChanged: (value) {
                    setState(() {
                      confirmPassword = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    errorText: isSubmitted ? validateConfirmPassword(password, confirmPassword) : null,
                    hintStyle: TextStyle(color: Color(0x88888888)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: handleRegistration,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5599FF),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Registration'),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('Back'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleRegistration() {
    setState(() {
      isSubmitted = true;
    });
    final usernameError = validateUsername(username);
    final passwordError = validatePassword(password);
    final confirmPasswordError = validateConfirmPassword(password, confirmPassword);
    if (usernameError == null && passwordError == null && confirmPasswordError == null) {

      //ЛОГИКА РЕГИСТРАЦИИ

      Navigator.pop(context);
    }
  }

  validateUsername(String username) {
    if (username == null || username.isEmpty) {
      return 'Enter Username';
    }
    if (username.length < 3 || username.length > 15) {
      return 'Username must be 3-15 characters';
    }
    return null;
  }

  validatePassword(String password) {
    if (password == null || password.isEmpty) {
      return 'Enter Password';
    }
    if (password.length < 3 || password.length > 10) {
      return 'Password must be 3-10 characters';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least 1 digit';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least 1 uppercase letter';
    }
    return null;
  }

  validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Enter Confirm Password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}