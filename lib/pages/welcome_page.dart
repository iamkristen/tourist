import 'package:flutter/material.dart';
import 'package:tourist/misc/colors.dart';
import 'package:tourist/pages/navigation_page.dart';
import 'package:tourist/widgets/app_large_text.dart';
import 'package:tourist/widgets/app_text.dart';
import 'package:tourist/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List image = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (
            _,
            index,
          ) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img/" + image[index]))),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 150,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: "Trips"),
                        const AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text:
                                "Mountain hikes give you an incredible sense of freedom along with endurance test",
                            size: 14,
                            color: AppColors.textColor2,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => NavigationPage())),
                            child: ResponsiveButon())
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        3,
                        (indexdots) => Container(
                          margin: const EdgeInsets.all(2),
                          width: 8,
                          height: index == indexdots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexdots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(.3)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
