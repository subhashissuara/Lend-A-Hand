import 'package:Lend_A_Hand/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reports'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),  
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            }
            )
        ],
      ),
      // Work In Progress
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            "My Reports Page Work in Progress...",
            style: TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          )
        ],),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/form');
          },
          tooltip: 'Report',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}