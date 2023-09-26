import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubic/cubic/app_cubit_state.dart';
import 'package:flutter_cubic/cubic/app_cubits.dart';
import 'package:flutter_cubic/pages/detail_page.dart';
import 'package:flutter_cubic/pages/home_page.dart';
import 'package:flutter_cubic/pages/nav_pages/main_page.dart';
import 'package:flutter_cubic/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is HomeState) {
          return const HomePage();
        }
        if (state is DetailState) {
          return const DetailPage();
        }

        if(state is LoadingState){
          return const Center(child: CircularProgressIndicator());
        }

        if(state is LoadedState){
          return const  MainPage();
        }


        return Container();
      }),
    );
  }
}
