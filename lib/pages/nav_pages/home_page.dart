import 'package:flutter/material.dart';
import 'package:flutter_cubic/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),

          //Tab bar
          const SizedBox(height: 40,),
          Container(
            child: TabBar(
              tabs: [
                Tab(text: "Places",),
                Tab(text: "Inspiration",),
                Tab(text: "Emotions",),
              ],
            ),
          ),
          Container(
            child: TabBarView(
              children: [
                Text("Hi"),
                Text("There"),
                Text("Bye"),
              ],
            ),
          )

        ],
      ),
    );
  }
}
