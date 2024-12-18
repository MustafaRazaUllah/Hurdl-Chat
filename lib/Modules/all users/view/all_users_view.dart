import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/all%20users/viewmodel/alluser_viewmodel.dart';
import 'package:hurdl_chat/Modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';

class AllUsersView extends StatefulWidget {
  const AllUsersView({super.key});

  @override
  State<AllUsersView> createState() => _AllUsersViewState();
}

class _AllUsersViewState extends State<AllUsersView> {
  final AlluserViewmodel _controller = Get.put(AlluserViewmodel());
  final _profileViewmodel = Get.find<ProfileViewmodel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 12),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              const Customtext(
                title: "All Users",
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextfield(
                controller: TextEditingController(),
                hinttext: "Search Friends",
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Expanded(
                child: _controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : _controller.allUsers.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemCount: _controller.allUsers.length,
                            itemBuilder: (context, index) {
                              var user = _controller.allUsers[index];
                              return GestureDetector(
                                onTap: () {
                                  print("Hello  ${user.toFirestore()}");
                                  _controller.onInitiateChat(
                                    context: context,
                                    currentUser: _profileViewmodel.userData.value,
                                    otherUser: user,
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: AppColors.primaryColor
                                              .withOpacity(0.1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            "https://eu.ui-avatars.com/api/?name=${user.firstName}+${user.lastName}",
                                          ),
                                        ),
                                        // "https://avatar.iran.liara.run/public/boy?username=${user.firstName}"),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Customtext(
                                          title:
                                              "${user.firstName} ${user.lastName}",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Customtext(
                              title: "UserNotFound",
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
