import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/services/Api/profile_api_service.dart';

import '../../core/constant/image_picker.dart';
import '../../model/logout_model.dart';
import '../../screens/widgets/toast.dart';
import '../Authentication/auth_provider.dart';

class EditProfileProvider extends ChangeNotifier {
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

    final response = await _profileApiService.editProfile(
      data: {
        'firstName': firstName,
        'lastName': lastName,
      },
      headers: {'Authorization': '${authProvider.authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      LogoutModel data = LogoutModel.fromJson(response.data);
      if (data.status == 1) {
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
