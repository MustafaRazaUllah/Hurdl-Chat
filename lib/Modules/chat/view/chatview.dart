import 'package:flutter/material.dart';
import 'package:hurdl_chat/Modules/Home/model/chatmodel.dart';
import 'package:hurdl_chat/Modules/profile/model/usermodel.dart';
import 'package:hurdl_chat/common/theme/color.dart';
import 'package:hurdl_chat/common/theme/custom_textfield.dart';
import 'package:hurdl_chat/common/theme/customtext.dart';

class ChatView extends StatelessWidget {
  final ChatModel chat;
  final UserModel otherUser;
  const ChatView({
    super.key,
    required this.chat,
    required this.otherUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://eu.ui-avatars.com/api/?name=${otherUser.firstName}+${otherUser.lastName}",
                ),
              ),
              const SizedBox(width: 10),
              Customtext(
                title: '${otherUser.firstName} ${otherUser.lastName}',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        body: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount: 10, // Replace with chat.messages.length for dynamic content
                  itemBuilder: (context, index) {
                    // Calculate the correct index for reverse order
                    int reverseIndex = 10 - index - 1; // Replace 10 with chat.messages.length

                    // Replace "Hello ${index}" with dynamic message text if available
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Align(
                        alignment: reverseIndex % 2 == 0
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: reverseIndex % 2 == 0
                                ? AppColors.primaryColor
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Customtext(
                            title: "Hello $reverseIndex",
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextfield(
                        controller: TextEditingController(),
                        hinttext: "Enter Message...",
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
