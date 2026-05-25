import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Flutter Mapp'), centerTitle: true),
          drawer: Drawer(
            child: Column(children: [ListTile(title: const Text('Logout'))]),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  print('Floating Action Button Pressed');
                },
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 10), // Add some spacing between the buttons
              FloatingActionButton(
                onPressed: () {
                  print('Second Floating Action Button Pressed');
                },
                child: const Icon(Icons.edit),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
            onDestinationSelected: (int index) {
              print('Selected index: $index');
            },
            selectedIndex: 0,
          ),
        ),
      ),
    );
  }
}
