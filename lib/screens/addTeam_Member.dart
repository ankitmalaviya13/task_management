import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield.dart';

class AddTeamMember extends StatelessWidget {
  const AddTeamMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        centerTitle: true,
        title: const CommonText(
          text: "Add Team Member",
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CommonTextField(
              fillColor: AppColor.white,
              prefix: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(CupertinoIcons.search, color: AppColor.greyText),
              ),
              hintText: "Search",
              hintTextFontSize: 16,
              borderColor: AppColor.searchColor,
              isDense: true,
              borderOutline: true,
              onChanged: (v) {},
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBNFUwQmH640OafdOvh-eIPRcB9ZeIBbYfew&s'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: const CommonText(
                        text: "Shane Watson",
                        fontSize: 18,
                      ),
                      subtitle: const CommonText(
                        text: "Former Australian Cricketer",
                        fontSize: 14,
                        color: AppColor.greyText, // Adjust color as needed
                      ),
                      trailing: CommonButton(
                        onPressed: () {},
                        height: 30,
                        width: 65,
                        label: "Invite",
                        labelColor: AppColor.white,
                      ),
                      onTap: () {},
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
