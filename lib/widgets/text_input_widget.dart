import 'package:flutter/material.dart';

import '../const/colors.dart';

class TextInputWidget extends StatelessWidget {
  final String hintText;
  const TextInputWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: _deviceSize.width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: greyColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: TextField(
        key: ValueKey(hintText),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
