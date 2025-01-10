import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../model/edit_profile_model.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/project_api_service.dart';
import '../Authentication/auth_provider.dart';

class AddProjectProvider extends ChangeNotifier {
  final ProjectApiService _projectApiService = GetIt.instance<ProjectApiService>();
  final authProvider = GetIt.instance<AuthProvider>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future addProject(String name, String visibility) async {
    setLoading(true);

    final response = await _projectApiService.addProject(
      data: {
        'name': name,
        'visibility': visibility,
        // 'members': '6774eb8ddf8836c061202c20',
      },
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
