import 'package:app/Screens/login.dart';
import 'package:app/Screens/signup.dart';
import 'package:app/common.dart';
import 'package:flutter/material.dart';

class Entryscreen extends StatelessWidget {
  const Entryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration:const BoxDecoration(
          image:DecorationImage(
            image: AssetImage('assets/images/bg_screen.png'),
            fit: BoxFit.cover),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Image(image: AssetImage('assets/images/white_p.png'),height: 100, width: 60,),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'RentPrompts',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'RentPrompts',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            whitebutton('Log In', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LogInPage();
                  },
                ),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            bluebutton('Sign Up', () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpPage();
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}