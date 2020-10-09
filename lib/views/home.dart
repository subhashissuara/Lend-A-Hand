import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reports'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),  
            onPressed: () {
              
            }
            )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            
          },
          tooltip: 'Report',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}