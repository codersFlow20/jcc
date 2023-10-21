import 'package:flutter/material.dart';

class ComplaintList extends StatelessWidget {
  const ComplaintList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          "This is a Complaints list Page",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
