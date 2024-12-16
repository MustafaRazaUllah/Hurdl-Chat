import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/View/home_view.dart';
import 'package:hurdl_chat/Modules/profile/view/profile_view.dart';
import 'package:hurdl_chat/Modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:hurdl_chat/common/theme/color.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  ProfileViewmodel _profileViewmodel = Get.put(ProfileViewmodel());
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
_profileViewmodel.getProfile();
  }

  var viewList = [
    const HomeView(),
     ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: viewList[selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Container(
                  height: 60,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.chat,
                    color: selectedIndex == 0
                        ? AppColors.white
                        : AppColors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Container(
              width: 1.5,
              height: 35,
              color: AppColors.white,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Container(
                  height: 60,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.person,
                    color: selectedIndex == 1
                        ? AppColors.white
                        : AppColors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
