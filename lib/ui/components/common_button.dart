import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/helper/helper.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.prefixPath,
      required this.textStyle,
      required this.title})
      : super(key: key);

  final String? prefixPath;
  final Function() onPress;
  final String? title;
  final TextStyle? textStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 315,
      child: ElevatedButton(
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          children: [
            SvgPicture.asset(
              prefixPath ?? '',
              color: MyColor.white,
              height: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            )
          ],
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(
            0.0,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => color ?? Colors.white),
        ),
      ),
    );
  }
}
