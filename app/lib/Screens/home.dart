import 'package:app/Screens/viewall.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        _scaffoldKey.currentState?.openDrawer();
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
        child: Text('Profile',
        style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
        ),
        ListTile(
          leading: Icon(Icons.electrical_services),
          title: Text('Services'),
        ),
        ListTile(
          leading: Icon(Icons.contact_emergency),
          title: Text('Contact'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Help'),
        ),
        
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
            fit: BoxFit.cover
            )
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
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
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => print('Home pressed'),
                  style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Color.fromRGBO(67, 56, 202, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
                  child: Text('Home'),
                ),
                TextButton(
                  onPressed: () => print('About pressed'),
                  style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Color.fromRGBO(67, 56, 202, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
                  child: Text('About'),
                ),
                TextButton(
                  onPressed: () => print('Services pressed'),
                  style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Color.fromRGBO(67, 56, 202, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
                  child: Text('Services'),
                ),
                TextButton(
                  onPressed: () => print('Contact pressed'),
                  style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Color.fromRGBO(67, 56, 202, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
                  child: Text('Contact'),
                ),
                TextButton(
                  onPressed: () => print('Blog pressed'),
                  style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Color.fromRGBO(67, 56, 202, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
                  child: Text('Blog'),
                ),
                TextButton(
                  onPressed: () => print('Help pressed'),
                  style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Color.fromRGBO(67, 56, 202, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          width: 150,
          margin: const EdgeInsets.only(right: 16),
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
          Navigator.push(context,
                     MaterialPageRoute(
                      builder:(context)=>const Viewall()));
          print('View All pressed');
        },
        style: TextButton.styleFrom(
          foregroundColor: Color.fromRGBO(67, 56, 202, 1), // Text color
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          width: 150,
          margin: const EdgeInsets.only(right: 16),
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(67, 56, 202, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}