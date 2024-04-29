import 'package:flutter/material.dart';
import 'package:tourist/misc/colors.dart';
import 'package:tourist/widgets/app_button.dart';
import 'package:tourist/widgets/app_large_text.dart';
import 'package:tourist/widgets/app_text.dart';
import 'package:tourist/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, this.name, this.place, this.coverPhoto})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();

  final String? name;
  final String? place;
  final String? coverPhoto;
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 3;
  int selectedPeople = 1;

  _DetailPageState();
  void onTap(index) {
    setState(() {
      selectedPeople = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            widget.coverPhoto ?? "assets/img/mountain.jpeg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 250,
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: widget.name ?? "Name",
                          color: Colors.black.withOpacity(.8),
                        ),
                        AppLargeText(
                          text: "\$ 230",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: AppColors.textColor1,
                        ),
                        AppText(
                            text: widget.place ?? "San Francisco, USA",
                            color: AppColors.textColor1)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStar
                                  ? AppColors.starColor
                                  : AppColors.buttonBackground,
                            );
                          }),
                        ),
                        AppText(text: " (${gottenStar.toString()}.0)")
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppLargeText(
                        text: "People",
                        size: 20,
                        color: Colors.black.withOpacity(.8)),
                    const SizedBox(height: 5),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () => onTap(index),
                          child: AppButton(
                            size: 60,
                            backgroundColor: index < selectedPeople
                                ? AppColors.mainColor
                                : AppColors.buttonBackground,
                            child: Text(
                              (index + 1).toString(),
                              // style: TextStyle(color: AppColors.textColor1),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppLargeText(
                        text: "Description",
                        size: 20,
                        color: Colors.black.withOpacity(.8)),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: AppText(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed varius, orci non ultrices consequat, metus enim fermentum dui, et sollicitudin turpis nisl at augue. Pellentesque vehicula pharetra risus, ut vehicula sem finibus ut. Aliquam pharetra condimentum dolor, vestibulum fringilla libero feugiat sed. Maecenas erat elit, imperdiet ut risus vel, auctor varius nisl. ",
                        color: AppColors.mainTextColor,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.mainColor, width: 1)),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 30,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ResponsiveButon(
                            child: AppText(
                              text: "Book Trip Now",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
