import 'package:flutter/material.dart';
import 'package:frontend/widgets/chats.dart';
import 'package:frontend/widgets/code_dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> messages = const [
    {
      'name': 'name 1',
      'text': 'High-quality product with amazing features'
    },
    {
      'name': 'name 2',
      'text': 'Premium version with extra benefits'
    },
    {
      'name': 'name 3',
      'text': 'Budget option with good quality'
    },
    {
      'name': 'name 4',
      'text': 'Professional grade equipment'
    },
    {
      'name': 'name 5',
      'text': 'Best seller with great reviews'
    },
    {
      'name': 'name 6',
      'text': 'High-quality product with amazing features High-quality product with amazing features'
    },
    {
      'name': 'name 7',
      'text': 'High-quality product with amazing features High-quality product with amazing features'
    },
    {
      'name': 'name 8',
      'text': 'High-quality product with amazing features High-quality product with amazing features'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'User, Welcome Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 125),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 24,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...messages.map((message) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Message(message: message),
                    )).toList(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF5599FF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => const DialogExample(),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.qr_code_2,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}