import 'package:flutter/material.dart';
import 'package:flutter_application/views/widgets/container_widget.dart';
import 'package:flutter_application/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'Flutter  Mapp'),
            ContainerWidget(
              title: 'Basic Layout',
              description:
                  'You can add more widgets here to create a more complex card design.',
            ),
            ContainerWidget(
              title: 'Basic Layout',
              description:
                  'You can add more widgets here to create a more complex card design.',
            ),
            ContainerWidget(
              title: 'Basic Layout',
              description:
                  'You can add more widgets here to create a more complex card design.',
            ),
          ],
        ),
      ),
    );
  }
}
