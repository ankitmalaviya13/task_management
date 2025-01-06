import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Authentication/logout_provider.dart';
import 'loading_widget.dart';

class LogoutPopup extends StatelessWidget {


  const LogoutPopup({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        Selector<LogoutProvider, bool>(
          selector: (context, provider) => provider.isLoading,
          builder: (context, isLoading, _) {
            print("Loader rebuilt");
            return isLoading ? customIndicatorMore() :    ElevatedButton(

              onPressed: () {
                final provider = Provider.of<LogoutProvider>(context, listen: false);
                provider.logOut().then((v) {

                  if(v==null){
                    Navigator.of(context).pop();

                  }

                });




              },
              child: const Text('Logout'),
            );
          },
        ),


      ],
    );
  }
}
