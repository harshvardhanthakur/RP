import 'package:flutter/material.dart';

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}
class _ViewallState extends State<Viewall> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Key to control drawer

  int _selectedIndex = 0; // Track the current tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    
    // Optional: handle navigation logic here
    // For example: navigate to different screens or update content
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    backgroundColor: Color.fromRGBO(67, 56, 202, 1), // or your custom color
    elevation: 0, // removes shadow
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.white, size: 40),
      onPressed: () {
        
      },
    ),
    centerTitle: true,
    title: Image.asset(
      'assets/images/full.png', 
      height: 60,
      width: 150,
    ),
  ),

  key: _scaffoldKey,
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(decoration: BoxDecoration(color: Color.fromRGBO(67, 56, 202, 1)),
        child: Text('Header',
        style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  ),

  extendBodyBehindAppBar: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover
            )
        ),
        child: Column(
  children: [
    const SizedBox(height: 100),
    // 🔍 Search Bar
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(67, 56, 202, 1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
      ),
    ),

    const SizedBox(height: 20),

    Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.image, color: Color.fromRGBO(67, 56, 202, 1)),
                  ),
                  title: const Text("Rentpromts"),
                  subtitle: const Text("Location"),
                  trailing: IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Text('3'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  
                ),
              ],
            ),
          );
        },
      ),
    ),
  ],
)
      )
    );
  }
}
