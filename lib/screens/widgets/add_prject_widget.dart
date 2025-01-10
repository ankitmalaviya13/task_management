import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/color/color.dart';
import '../../providers/project/add_project_provider.dart';
import '../addTeam_Member.dart';
import 'common_button.dart';
import 'common_text.dart';
import 'common_textfield_border.dart';

class CreateProjectWidget extends StatelessWidget {
  const CreateProjectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _prjectNameController = TextEditingController();
    String _visibility = "Public";
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CommonText(
                text: "Create New Project",
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CommonTextFieldBorder(
            con: _prjectNameController,
            hintText: "Project Name",
            hintTextColor: AppColor.black,
            borderColor: AppColor.greyText,
            fillColor: AppColor.transparent,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: AppColor.primaryColor),
              ),
            ),
            hint: const CommonText(
              text: "Visibility",
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
            value: _visibility,
            items: const [
              DropdownMenuItem(
                value: "Public",
                child: CommonText(
                  text: "Public",
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownMenuItem(
                value: "Private",
                child: CommonText(
                  text: "Private",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            onChanged: (value) {
              _visibility = value!; // Update the selected value
            },
          ),
          const SizedBox(height: 20),
          CommonButtonColor(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTeamMember(),
                  )).then((value) {});
            },
            label: "Add Member",
            buttonBorderColor: AppColor.primaryColor,
            labelColor: AppColor.primaryColor,
            labelSize: 15,
          ),
          const SizedBox(height: 15),
          CommonButton(
            label: "Create Project",
            labelColor: AppColor.white,
            labelSize: 15,
            onPressed: () {
              context.read<AddProjectProvider>().addProject(_prjectNameController.text, _visibility).then((value) {
                if (value == null) {
                  Navigator.pop(context);
                }
              });
            },
          )
        ],
      ),
    );
  }
}
