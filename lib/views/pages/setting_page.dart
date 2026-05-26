import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.title});

  final String title;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = 'data 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Snackbar opened!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text('Open Snackbar'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert Dialog'),
                        content: Text('This is an alert dialog.'),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Show Alert'),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'data 1', child: Text('data 1')),
                  DropdownMenuItem(value: 'data 2', child: Text('data 2')),
                  DropdownMenuItem(value: 'data 3', child: Text('data 3')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  setState(() {});
                  print('Hello ');
                },
              ),
              Text(controller.text),
              Checkbox.adaptive(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                tristate: true,
                title: Text('Accept Terms and Conditions'),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text('Enable Notifications'),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                max: 100,
                value: sliderValue,
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                    print('Slider Value: $value');
                  });
                },
              ),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print('Image Tapped');
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  print('Icon Button Pressed');
                },
                icon: Icon(Icons.send),
                label: Text('Send'),
              ),
              FilledButton(
                onPressed: () {
                  print('Filled Button Pressed');
                },
                child: Text('Filled Button'),
              ),
              TextButton(
                onPressed: () {
                  print('Text Button Pressed');
                },
                child: Text('Text Button'),
              ),
              OutlinedButton(
                onPressed: () {
                  print('Outlined Button Pressed');
                },
                child: Text('Outlined Button'),
              ),
              CloseButton(
                onPressed: () {
                  print('Close Button Pressed');
                },
              ),
              BackButton(
                onPressed: () {
                  print('Back Button Pressed');
                },
              ),
              CupertinoButton(
                onPressed: () {
                  print('Cupertino Button Pressed');
                },
                color: Colors.teal,
                child: Text('Cupertino Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
