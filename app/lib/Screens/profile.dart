import 'package:flutter/material.dart';
import 'package:app/Screens/home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 56, 202, 1), // or your custom color
        elevation: 0, // removes shadow
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 40),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: Image.asset('assets/images/full.png', height: 60, width: 150),
      ),

    );
  }
}