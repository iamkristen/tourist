import 'package:flutter/material.dart';
import 'package:tourist/misc/colors.dart';

class ResponsiveButon extends StatelessWidget {
  ResponsiveButon({Key? key, this.width, this.isResponsive = false, this.child})
      : super(key: key);
  double? width;
  bool? isResponsive;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child != null ? child! : SizedBox(),
          Image.asset(
            "assets/img/button-one.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
