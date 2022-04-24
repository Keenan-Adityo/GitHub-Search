import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class IssuesCard extends StatelessWidget {
  const IssuesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 75,
              color: mainColor,
            ),
            // Image.asset(place.imageAsset),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Issues Title',
                    style: kHeading5,
                  ),
                  Text(
                    'Update Dates',
                    style: kSubtitle,
                  ),
                ],
              ),
            ),
          ),
          Text('Issues State')
        ],
      ),
    );
  }
}
