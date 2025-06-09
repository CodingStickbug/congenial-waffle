import 'package:flutter/material.dart';
import 'package:fluttery/data/constants.dart';
import 'package:fluttery/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Basic Layout:", style: HTextStyle.titleText),
                      Text(
                        "Attack the D point!",
                        style: HTextStyle.basicDescriptionText,
                      ),
                      Text(
                        "The Lobotomite R E T U R N S",
                        style: HTextStyle.lobotomiteText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(child: HeroWidget(title: '',)),
          ],
        ),
      ),
    );
  }
}
