import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLabel("Title"),
                buildTextField("Name your task"),

                const SizedBox(height: 24),
                buildLabel("Project"),
                buildDropdown("Assign project"),

                const SizedBox(height: 24),
                buildLabel("Date"),
                buildDateField("Set starting and deadline dates", context),

                const SizedBox(height: 24),
                buildLabel("Starting time"),
                buildTextField("00:00"),

                const SizedBox(height: 24),
                buildLabel("Team"),
                buildDropdown("Choose who’s participating"),

                const SizedBox(height: 24),
                buildLabel("Description"),
                buildTextField("Write a short description", maxLines: 3),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.deepPurple,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
    );
  }

  Widget buildDropdown(String hint) {
    return DropdownButtonFormField<String>(
      value: null,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
      ),
      items: const [],
      onChanged: (value) {},
    );
  }

  Widget buildDateField(String hint, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add date picker logic if needed
      },
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.deepPurple),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
          ),
        ),
      ),
    );
  }
}