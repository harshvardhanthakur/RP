import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () {
                // Save action
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20,),
              const Text('Complete your profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
              ),

              const SizedBox(height: 20,),
              const Text("Title"),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name your task",
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),
              const Text("Project"),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: "project1", child: Text("Project 1")),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Assign project",
                ),
              ),

              const SizedBox(height: 20),
              const Text("Date"),
              TextField(
                decoration: InputDecoration(
                  hintText: "Set starting and deadline dates",
                  suffixIcon: Icon(Icons.calendar_today),
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),

               const SizedBox(height: 20),
              const Text("Starting time"),
              TextField(
                decoration: InputDecoration(
                  hintText: "00:00",
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),
              const Text("Team"),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: "member1", child: Text("Member 1")),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: "Choose who’s participating",
                ),
              ),

              const SizedBox(height: 20),
              const Text("Description"),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Write a short description",
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}