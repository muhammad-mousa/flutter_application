import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded & Flexible')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal,
                  height: 20,
                  width: double.infinity,
                  child: Text('Expanded'),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.orange,
                  height: 20,
                  width: double.infinity,
                  child: Text('This is the Flexible'),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Flexible(
                child: Container(color: Colors.orange, child: Text('box')),
              ),
              Expanded(
                child: Container(
                  color: Colors.teal,
                  child: Text('This is second Expanded box'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
