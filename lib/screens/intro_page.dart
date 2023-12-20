import 'package:flutter/material.dart';
import 'package:grocery_store/screens/my_home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(
                right: 60, left: 60, top: 150, bottom: 80),
            child: Image.asset('lib/assets/avocado.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'We deliver groceries at your doorstep',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text('Fresh items everyday'),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const MyHomePage();
              }),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.deepPurple,
              ),
              padding: EdgeInsets.symmetric(vertical: 24),
              margin: EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(width: 15),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
