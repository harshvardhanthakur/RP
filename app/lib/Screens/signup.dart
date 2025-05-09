import 'package:app/Screens/login.dart';
import 'package:app/common.dart';
import 'package:app/models/user_model.dart';
import 'package:app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void onTap() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    user = await AuthRepository().signup(
      _emailController.text,
      _passwordController.text,
      0,
      "user",
      0,
    );
    if (user != null) {
      Navigator.of(context).pop(); // Close the loading dialog
      print("User created successfully: ${user?.toJson()}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Signup Success')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LogInPage();
          },
        ),
      );
    } else {
      // Handle signup error
      Navigator.of(context).pop(); // Close the loading dialog
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Signup failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(55, 48, 163, 1),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sign_up_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create \n Account',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const Spacer(),
              const Spacer(),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  focusColor: Colors.blue,
                  icon: Icon(Icons.person_outline, color: Colors.blue),
                  fillColor: Colors.grey,
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  focusColor: Colors.blue,
                  icon: Icon(Icons.mail_outline, color: Colors.blue),
                  fillColor: Colors.grey,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                  focusColor: Colors.blue,
                  icon: const Icon(Icons.lock_outline, color: Colors.blue),
                  suffixIcon:
                      isPasswordVisible
                          ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: const Icon(Icons.visibility_off),
                          )
                          : GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: const Icon(Icons.visibility),
                          ),
                  fillColor: Colors.grey,
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),
              bluebutton("SignUp", () {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  onTap();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              }),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, width: 100, color: Colors.grey),
                  ),
                  const SizedBox(width: 20),
                  const Text('or'),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(height: 1, width: 100, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              whitebutton('LogIn', () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LogInPage();
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
