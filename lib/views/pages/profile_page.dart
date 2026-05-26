import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
            ElevatedButton(
              onPressed: () {
                print('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text('Submit'),
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
    );
  }
}
