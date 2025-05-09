import 'package:app/Screens/info.dart';
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
       body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.person, size: 40, color: Colors.grey),
        ),

        const SizedBox(width: 12),

        // Name and greeting
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi, there!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'Thomas Geoffries',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Good morning!',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),

        // Edit button
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blueAccent),
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Info(),
                          ),
                        );
                        print('Edit is pressed');
          },
        ),
      ],
    ),
          ],
        ),
       )

    );
  }
}