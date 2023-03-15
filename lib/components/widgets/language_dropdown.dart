import 'package:flutter/material.dart';

import '../constant/constant.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.arrow_drop_down,
          color: appBlueColor,
        ),
        PopupMenuButton<String>(
          icon: Icon(
            Icons.language,
            color: appBlueColor,
            size: width * 0.09,
          ),
          onSelected: choiceAction,
          itemBuilder: (BuildContext context) {
            return Constants.choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}

class Constants {
  static const String english = 'English';
  static const String arabic = 'Arabic';

  static const List<String> choices = <String>[
    english,
    arabic,
  ];
}


void choiceAction(String choice) {
  if (choice == Constants.english) {
    print('english');
  } else if (choice == Constants.arabic) {
    print('Arabic');
  }
}
