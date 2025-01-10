import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../model/get_user_model.dart';
import '../../model/user.dart';
import '../../screens/widgets/toast.dart';
import '../../services/Api/auth_api_service.dart';
import '../Authentication/auth_provider.dart';

class AddMemberProvider extends ChangeNotifier {
  final AuthApiService _authApiService = GetIt.instance<AuthApiService>();
  final authProvider = GetIt.instance<AuthProvider>();

  bool _isLoading = false;
  bool _isMoreLoading = false;
  int offset = 0;
  int limit = 5;
  int totalCOunt = 0;

  bool get isLoading => _isLoading;
  bool get isMoreLoading => _isMoreLoading;

  List<User> userList = <User>[];

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setMoreLoading(bool value) {
    _isMoreLoading = value;
    notifyListeners();
  }

  Future getUsers() async {
    if (userList.length == 0) {
      setLoading(true);
    } else {
      setMoreLoading(true);
    }
    notifyListeners();
    final response = await _authApiService.getAllUsers(
      data: {
        'offset': userList.length,
        'limit': limit,
      },
      headers: {'Authorization': '${authProvider.authToken}'},
    );
    print("Gdsflgdgkljhf");
    print(response);
    if (response.statusCode == 200) {
      print(response.data);
      GetUsersModel data = GetUsersModel.fromJson(response.data);
      if (data.status == 1) {
        if (userList.length == 0) {
          userList = data.info!;
        } else {
          userList.addAll(data.info!);
        }
        setLoading(false);
        setMoreLoading(false);

        notifyListeners();

        // Toasty.showtoast(data.message.toString());
        return null;
      } else {
        setLoading(false);
        setMoreLoading(false);
        Toasty.showtoast(data.message.toString());
        notifyListeners();
        return data.message.toString();
      }
    } else {
      setLoading(false);
      setMoreLoading(false);
      Toasty.showtoast(response.statusMessage.toString());
      notifyListeners();
      return response.statusMessage.toString();
    }
  }
}

class ImageWithSource {
  final String image;
  final String source;
  ImageWithSource({required this.image, required this.source});
}
