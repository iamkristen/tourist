import 'package:flutter/material.dart';
import 'package:tourist/misc/colors.dart';
import 'package:tourist/pages/detail_page.dart';
import 'package:tourist/widgets/app_large_text.dart';
import 'package:tourist/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Ballon",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              radius: 27,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/img/welcome-three.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 15,
            ),
            const AppLargeText(text: "Discover"),
            const SizedBox(
              height: 15,
            ),
            TabBar(
                controller: _tabController,
                labelColor: AppColors.mainColor,
                unselectedLabelColor: AppColors.mainColor.withOpacity(.3),
                indicatorColor: AppColors.mainColor,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                tabs: const [
                  Tab(
                    child: Text("Places"),
                  ),
                  Tab(
                    child: Text("Inspirations"),
                  ),
                  Tab(
                    child: Text("Emotions"),
                  )
                ]),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DetailPage(
                                        name: "Mountain",
                                        place: "Namche Bazaar, Nepal",
                                        coverPhoto: "assets/img/mountain.jpeg",
                                      ))),
                          child: Container(
                            height: 300,
                            width: 200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/img/mountain.jpeg"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DetailPage(
                                        name: "Mountain",
                                        place: "Namche Bazaar, Nepal",
                                        coverPhoto:
                                            "assets/img/welcome-one.png",
                                      ))),
                          child: Container(
                            height: 300,
                            width: 200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/img/welcome-one.png"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const DetailPage(
                                        name: "Mountain",
                                        place: "Namche Bazaar, Nepal",
                                        coverPhoto:
                                            "assets/img/welcome-three.png",
                                      ))),
                          child: Container(
                            height: 300,
                            width: 200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/img/welcome-three.png"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLargeText(
                  text: "Explore more",
                  size: 22,
                ),
                AppText(
                  text: "see all",
                  color: AppColors.textColor1,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage("assets/img/" +
                                    images.keys.elementAt(index)),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                        )
                      ],
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
