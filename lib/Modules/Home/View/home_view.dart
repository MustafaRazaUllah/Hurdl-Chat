import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/Home/Viewmodal/home_viewmodel.dart';
import 'package:hurdl_chat/Modules/all%20users/view/all_users_view.dart';
import 'package:hurdl_chat/Modules/auth/view/login_view.dart';
import 'package:hurdl_chat/Modules/chat/view/chatview.dart';
import 'package:hurdl_chat/Modules/profile/viewmodel/profile_viewmodel.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';
import 'package:hurdl_chat/db%20and%20cache/cache.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _homeController = Get.find<HomeViewModel>();
  final _profileViewmodel = Get.put(ProfileViewmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leadingWidth: 150,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10, top: 12),
          child: Customtext(
            title: "Messages",
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Get.to(() => const AllUsersView());
              // await CacheHandle.logout();
              // Get.offAll(() => LoginView());
            },
            icon: const Icon(
              Icons.contacts_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomTextfield(
              controller: TextEditingController(),
              hinttext: "Search Chat",
            ),
          ),
          const SizedBox(height: 10),
          // Listview Builder
          Obx(
            () => Expanded(
              child: _homeController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : _homeController.allChats.isNotEmpty
                      ? ListView.builder(
                          itemCount: _homeController.allChats.length,
                          itemBuilder: (context, index) {
                            var chat = _homeController.allChats[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => ChatView(
                                    chat: chat,
                                    otherUser: _profileViewmodel
                                                .userData.value.userID !=
                                            chat.participants[0].userID
                                        ? chat.participants[0]
                                        : chat.participants[1],
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Customtext(
                                  title: _profileViewmodel
                                              .userData.value.userID !=
                                          chat.participants[0].userID
                                      ? "${chat.participants[0].firstName} ${chat.participants[0].lastName}"
                                      : "${chat.participants[1].firstName} ${chat.participants[1].lastName}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: Customtext(
                                  title: chat.lastMessage,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      // Image.network("src")
                                      NetworkImage(
                                    "https://eu.ui-avatars.com/api/?name=${_profileViewmodel.userData.value.userID != chat.participants[0].userID ? "${chat.participants[0].firstName}+${chat.participants[0].lastName}" : "${chat.participants[1].firstName}+${chat.participants[1].lastName}"}",
                                  ),
                                ),
                                trailing: Customtext(
                                  title: DateFormat("hh:mm:a").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      chat.createdAt * 1000,
                                    ),
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Customtext(title: "Chat Not Found."),
                        ),
            ),
          ),
        ],
      )),
    );
  }
}
