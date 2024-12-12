import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';

class AllUsersView extends StatelessWidget {
  const AllUsersView({super.key});

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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.primaryColor.withOpacity(0.1),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Customtext(
                            title: "User Name $index",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
