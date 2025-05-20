import 'package:app/Screens/viewall.dart';
import 'package:app/repository/auth_repository.dart';
import 'package:app/repository/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/profile.dart';
import 'package:app/Screens/info.dart';
import 'package:app/Screens/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Key to control drawer

  int _selectedIndex = 0; // Track the current tab index

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Detail()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void initialise() async {}

  initState() {
    super.initState();
    initialise(); // Call the function to fetch posts
    // Initialize any data or state here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 56, 202, 1),
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

      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(67, 56, 202, 1)),
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ListTile(leading: Icon(Icons.info), title: Text('About')),
            ListTile(
              leading: Icon(Icons.electrical_services),
              title: Text('Services'),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('Contact'),
            ),
            ListTile(leading: Icon(Icons.settings), title: Text('Setting')),
            ListTile(leading: Icon(Icons.help), title: Text('Help')),
          ],
        ),
      ),

      extendBodyBehindAppBar: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(14.0),
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
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Color.fromRGBO(79, 70, 229, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () => print('Home pressed'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Color.fromRGBO(79, 70, 229, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Home'),
                      ),

                      SizedBox(width: 10),

                      TextButton(
                        onPressed: () => print('About pressed'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Color.fromRGBO(79, 70, 229, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('About'),
                      ),

                      SizedBox(width: 10),

                      TextButton(
                        onPressed: () => print('Services pressed'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Color.fromRGBO(79, 70, 229, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Services'),
                      ),

                      SizedBox(width: 10),

                      TextButton(
                        onPressed: () => print('Contact pressed'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Color.fromRGBO(79, 70, 229, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Contact'),
                      ),

                      SizedBox(width: 10),

                      TextButton(
                        onPressed: () => print('Blog pressed'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Color.fromRGBO(79, 70, 229, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Blog'),
                      ),

                      SizedBox(width: 10),

                      TextButton(
                        onPressed: () => print('Help pressed'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Color.fromRGBO(79, 70, 229, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Help'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 250,
                width: double.infinity,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: 150,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              // Background image
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/images/architect_card.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Text at bottom-left
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  color: Colors.black.withOpacity(0.6),
                                  child: Text(
                                    " Contents ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Viewall(),
                          ),
                        );
                        print('View All pressed');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromRGBO(
                          67,
                          56,
                          202,
                          1,
                        ), // Text color
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text('View All'),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                width: double.infinity,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: 150,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            children: [
                              // Background image
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/images/architect_card.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // Text at bottom-left
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  color: Colors.black.withOpacity(0.6),
                                  child: Text(
                                    " Contents ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(67, 56, 202, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
