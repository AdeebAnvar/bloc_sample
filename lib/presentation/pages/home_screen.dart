import 'package:bloc_sample_app/constants/constants.dart';
import 'package:bloc_sample_app/presentation/animation/animations.dart';
import 'package:bloc_sample_app/presentation/widgets/mobile_home_ui.dart';
import 'package:bloc_sample_app/presentation/widgets/web_home_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    profileAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    filterAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    profileAnimation =
        Tween<double>(begin: -500, end: 0).animate(profileAnimationController);
    filterAnimation =
        Tween<double>(begin: 600, end: 0).animate(filterAnimationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: isMobile(context)
            ? AppBar(
                backgroundColor: customTeal,
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: customTeal),
                    onPressed: () {
                      if (profileAnimationController.status ==
                          AnimationStatus.completed) {
                        profileAnimationController.reverse();
                      }
                      if (filterAnimationController.status ==
                          AnimationStatus.completed) {
                        filterAnimationController.reverse();
                      } else {
                        filterAnimationController.forward();
                      }
                    },
                    child: const Text(
                      'FILTER',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
                elevation: 0,
                leading: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    if (filterAnimationController.status ==
                        AnimationStatus.completed) {
                      filterAnimationController.reverse();
                    }
                    if (profileAnimationController.status ==
                        AnimationStatus.completed) {
                      profileAnimationController.reverse();
                    } else {
                      profileAnimationController.forward();
                    }
                  },
                  icon: const Icon(Icons.dashboard),
                ),
              )
            : null,
        body: isMobile(context) ? const MobileHomeUI() : const WebHomeUI(),
      ),
    );
  }
}
