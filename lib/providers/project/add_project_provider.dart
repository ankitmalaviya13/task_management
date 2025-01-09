import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/services/Api/profile_api_service.dart';

import '../../core/constant/image_picker.dart';
import '../../model/edit_profile_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/api_service.dart';
import '../Authentication/auth_provider.dart';

class AddProjectProvider extends ChangeNotifier {
  final ProfileApiService _profileApiService = GetIt.instance<ProfileApiService>();
  final authProvider = GetIt.instance<AuthProvider>();
  String? _image;

  String? get image => _image;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future pickimage(ImageSource source) async {
    final pickedFile = await pickImage(source);

    if (pickedFile != null) {
      _image = pickedFile;
      notifyListeners();
    }
  }

  Future editProfile(String firstName, String lastName) async {
    setLoading(true);
    var data = {
      'firstName': firstName,
      'lastName': lastName,
    };
    var formdata = await wrapFromData(data);
    if (_image != null) {
      formdata = await wrapMultiPartImages(File(_image!), formdata, "profilepic");
    }
    final response = await _profileApiService.editProfile(
      data: formdata,
      headers: {'Authorization': '${authProvider.authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      EditProfileModel data = EditProfileModel.fromJson(response.data);
      if (data.status == 1) {
        await authProvider.loggedIn(
          userId: data.user?.id ?? "",
          email: data.user?.email ?? "",
          firstName: data.user?.firstName ?? "",
          lastName: data.user?.lastName ?? "",
          profilePic: data.user?.profilepic ?? "",
        );
        setLoading(false);
        Toasty.showtoast(data.message.toString());
        return null;
      } else {
        setLoading(false);
        Toasty.showtoast(data.message.toString());
        return data.message.toString();
      }
    } else {
      setLoading(false);
      Toasty.showtoast(response.statusMessage.toString());
      return response.statusMessage.toString();
    }
  }
}

class ImageWithSource {
  final String image;
  final String source;
  ImageWithSource({required this.image, required this.source});
}
