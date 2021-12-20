import 'package:flutter/material.dart';
import 'package:test_project/helper/helper.dart';

class Header extends StatelessWidget {
  const Header({required this.title, required this.context});

  final String title;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: MyColor.coreBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        boxShadow: [
          BoxShadow(
            color: MyColor.black!.withOpacity(0.1),
            blurRadius: 9,
            spreadRadius: -8,
            offset: Offset(-3, 5),
          ),
          BoxShadow(
            color: MyColor.black!.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: -8,
            offset: Offset(3, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: MyColor.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
