import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controllers and selected values
  final TextEditingController _lettersController = TextEditingController();
  final TextEditingController _numbersController = TextEditingController();
  final TextEditingController _multiSelectController = TextEditingController();
  String? _singleSelected;
  List<String> _multiSelectedOptions = [];

  List<String> multiOptions = ['Option A', 'Option B', 'Option C'];
  List<String> singleOptions = ['Choice 1', 'Choice 2', 'Choice 3'];

  void _showMultiSelectDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        List<String> tempSelected = [..._multiSelectedOptions];
        return AlertDialog(
          title: Text('Select Multiple'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    multiOptions
                        .map(
                          (option) => CheckboxListTile(
                            title: Text(option),
                            value: tempSelected.contains(option),
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  tempSelected.add(option);
                                } else {
                                  tempSelected.remove(option);
                                }
                              });
                            },
                          ),
                        )
                        .toList(),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _multiSelectedOptions = tempSelected;
                  _multiSelectController.text = _multiSelectedOptions.join(
                    ', ',
                  );
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSingleSelectDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        String? tempSelected = _singleSelected;
        return AlertDialog(
          title: Text('Select One'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    singleOptions
                        .map(
                          (option) => RadioListTile<String>(
                            title: Text(option),
                            value: option,
                            groupValue: tempSelected,
                            onChanged: (value) {
                              setState(() {
                                tempSelected = value;
                              });
                            },
                          ),
                        )
                        .toList(),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _singleSelected = tempSelected;
                });
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _gradientButton(String text) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.orange, Colors.pink]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 56, 202, 1),
        elevation: 0,
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
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(55, 48, 163, 1)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'AI DevOps Guide',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'The AI DevOps Guide is a powerful tool which gives you a Guide for automating, securing, and optimizing deployments across cloud and hybrid environments according to your requirements. By providing customized, step-by-step strategies, it empowers DevOps teams to achieve high availability, security, and efficiency in their deployment workflows.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 30),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'FREE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '1 Month ago',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(67, 56, 202, 1),
                  border: Border.all(
                    color: Color.fromRGBO(99, 102, 241, 1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Try this App',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Input Variables',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Special Requirements',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: _lettersController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Letters Only',
                        suffixIcon: Icon(Icons.abc, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\s]'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Files to Deploy',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: _numbersController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Numbers Only',
                        suffixIcon: Icon(Icons.numbers, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Target Environment',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: _multiSelectController,
                      readOnly: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Select Multiple',
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onTap: _showMultiSelectDialog,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Deployment Method',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: _singleSelected ?? '',
                      ),
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Select One',
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        _showSingleSelectDialog();
                      },
                    ),
                    SizedBox(height: 16),
                    _gradientButton('Generate ⚡'),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(
                                color: Color.fromRGBO(99, 102, 241, 1),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // Your action here
                            },
                            child: Text(
                              '🪙',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(55, 48, 163, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 60),
                          Center(
                            child: Text(
                              'Running this app will deduct 🪙 from your account.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
