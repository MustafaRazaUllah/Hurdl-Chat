import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/Modules/all%20users/view/all_users_view.dart';
import 'package:hurdl_chat/Modules/auth/view/login_view.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';
import 'package:hurdl_chat/db%20and%20cache/cache.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Customtext(
                    title: "User Name $index",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  subtitle: const Customtext(
                    title: "Last Message",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  trailing: const Customtext(
                    title: "12:00",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
