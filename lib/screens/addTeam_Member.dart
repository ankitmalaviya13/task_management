import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/core/color/color.dart';
import 'package:task_management/screens/widgets/common_button.dart';
import 'package:task_management/screens/widgets/common_text.dart';
import 'package:task_management/screens/widgets/common_textfield.dart';
import 'package:task_management/screens/widgets/loading_widget.dart';

import '../model/user.dart';
import '../providers/project/add_member_provider.dart';

class AddTeamMember extends StatelessWidget {
  const AddTeamMember({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddMemberProvider()..getUsers(),
      child: AddTeamMemberWidget(),
    );
  }
}

class AddTeamMemberWidget extends StatefulWidget {
  const AddTeamMemberWidget({
    super.key,
  });

  @override
  State<AddTeamMemberWidget> createState() => _AddTeamMemberWidgetState();
}

class _AddTeamMemberWidgetState extends State<AddTeamMemberWidget> {
  ScrollController _scrollController = ScrollController();
  late final AddMemberProvider addMemberProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addMemberProvider = context.read<AddMemberProvider>();
    });
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        addMemberProvider.isMoreLoading == false) {
      addMemberProvider.getUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        centerTitle: true,
        title: const CommonText(
          text: "Add Team Member",
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      body: Stack(
        children: [
          Padding(
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
                Selector<AddMemberProvider, List<User>>(
                  selector: (context, provider) => provider.userList,
                  builder: (context, userList, _) {
                    print("User List Length: ${userList.length}");
                    return Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: userList.length,
                          itemBuilder: (context, index) {
                            print("fsdjfgsdhf");
                            User user = userList[index];
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
                              title: CommonText(
                                text: "${user.firstName} ${user.lastName}",
                                fontSize: 18,
                              ),
                              subtitle: const Column(
                                children: [
                                  CommonText(
                                    text: "Former Australian Cricketer",
                                    fontSize: 14,
                                    color: AppColor.greyText, // Adjust color as needed
                                  ),
                                  CommonText(
                                    text: "Former Australian Cricketer",
                                    fontSize: 14,
                                    color: AppColor.greyText, // Adjust color as needed
                                  ),
                                  CommonText(
                                    text: "Former Australian Cricketer",
                                    fontSize: 14,
                                    color: AppColor.greyText, // Adjust color as needed
                                  ),
                                  CommonText(
                                    text: "Former Australian Cricketer",
                                    fontSize: 14,
                                    color: AppColor.greyText, // Adjust color as needed
                                  ),
                                  CommonText(
                                    text: "Former Australian Cricketer",
                                    fontSize: 14,
                                    color: AppColor.greyText, // Adjust color as needed
                                  ),
                                  CommonText(
                                    text: "Former Australian Cricketer",
                                    fontSize: 14,
                                    color: AppColor.greyText, // Adjust color as needed
                                  ),
                                ],
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
                    );
                  },
                ),
                Selector<AddMemberProvider, bool>(
                  selector: (context, provider) => provider.isMoreLoading,
                  builder: (context, isLoading, _) {
                    print("Loader rebuilt");
                    return isLoading ? customIndicator() : const SizedBox();
                  },
                ),
              ],
            ),
          ),
          Selector<AddMemberProvider, bool>(
            selector: (context, provider) => provider.isLoading,
            builder: (context, isLoading, _) {
              print("Loader rebuilt");
              return isLoading ? customIndicator() : const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
