import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final ProfileViewmodel _controller = Get.find<ProfileViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox.expand(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Customtext(
                  title: "Profile",
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.white.withOpacity(0.1),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.white,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: const Center(
                        child: Customtext(
                      title: "Edit Profile",
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Customtext(
                  title:
                      "${_controller.userData.value.firstName} ${_controller.userData.value.lastName}",
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: AppColors.white.withOpacity(0.5),
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Customtext(
                            title: _controller.userData.value.address,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            fontSize: 12,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: AppColors.white.withOpacity(0.5),
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Customtext(
                            // timeformate march 2025

                            title:
                                "Joined ${DateFormat("MMMM yyyy").format(DateTime.now())}",
                            fontSize: 12,
                            overflow: TextOverflow.visible,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
