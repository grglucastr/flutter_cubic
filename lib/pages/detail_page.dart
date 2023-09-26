import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubic/cubic/app_cubits.dart';
import 'package:flutter_cubic/misc/AppColors.dart';
import 'package:flutter_cubic/widgets/app_buttons.dart';
import 'package:flutter_cubic/widgets/app_large_text.dart';
import 'package:flutter_cubic/widgets/app_text.dart';
import 'package:flutter_cubic/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final int rate = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("img/mountain.jpeg"),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Yosemite",
                            color: Colors.black54,
                          ),
                          AppLargeText(
                            text: "\$ 250",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          const SizedBox(width: 5),
                          AppText(
                            text: "USA, California",
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < rate
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          AppText(
                            text: "(4.0)",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          5,
                          (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: selectedIndex == index
                                    ? _SelectedButton(index)
                                    : _UnselectedButton(index),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque volutpat odio id sapien mattis, nec sollicitudin nisl viverra.",
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ), // GPM
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 10,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor2,
                    icon: Icons.favorite_border,
                    size: 60,
                  ),
                  const SizedBox(width: 20,),
                  const ResponsiveButton(
                    isResponsive: true,
                    width: double.maxFinite,
                    text: "Cair na gandaia agora!",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedButton extends StatelessWidget {
  final int index;

  const _SelectedButton(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButtons(
      text: (index + 1).toString(),
      size: 50,
      color: Colors.white,
      backgroundColor: Colors.black,
      borderColor: Colors.black,
    );
  }
}

class _UnselectedButton extends StatelessWidget {
  final int index;

  const _UnselectedButton(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButtons(
      text: (index + 1).toString(),
      size: 50,
      color: Colors.black,
      backgroundColor: Colors.black12,
      borderColor: Colors.black12,
    );
  }
}
