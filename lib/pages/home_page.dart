import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubic/cubic/app_cubit_state.dart';
import 'package:flutter_cubic/cubic/app_cubits.dart';
import 'package:flutter_cubic/misc/AppColors.dart';
import 'package:flutter_cubic/widgets/app_large_text.dart';
import 'package:flutter_cubic/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Menu
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black54),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(.5)),
                  )
                ],
              ),
            ),

            //Discover
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),

            //Tab bar
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(
                    color: AppColors.mainColor,
                    radius: 4,
                  ),
                  tabs: const [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: info.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage("http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Text("There"),
                  Text("Bye"),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore more",
                    size: 22,
                  ),
                  AppText(
                    text: "See all",
                    color: AppColors.textColor1,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(children: [
                      Container(
                        //margin: const EdgeInsets.only(right: 50),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image:
                            AssetImage("img/${images.keys.elementAt(index)}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                        ),
                      )
                    ]),
                  );
                },
              ),
            )
          ],
        );
      }
      return const Text(
        "Data not loaded. Something wrong I guess...",
        textDirection: TextDirection.ltr,
      );
    }));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true; // for hardware acceleration purpose

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
