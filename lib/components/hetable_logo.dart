import 'package:flutter/material.dart';

import '../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox.HeatableLogo({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 top and bottom
      ),
      child: Image.asset('assets/images/heatable-removebg-preview.png'),
      height: 55,
    );
  }
}
