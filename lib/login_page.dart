import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testreportsignin/google_login_controller.dart';
import 'package:testreportsignin/injection_container.dart';

class LoginPage extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final model = watchOnly((GoogleSignInController x) => x.googleAccount);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Test-Report-Sign-In-Page', style: TextStyle(fontSize: 23)),
        centerTitle: true,
      ),
      // body: loginUI(GoogleSignInController()),
      body: loginUI(model),
      backgroundColor: Colors.grey[200],
    );
  }

  // loginUI(GoogleSignInController model) {
  //   return Consumer<GoogleSignInController>(builder: (context, model, child) {
  //     if (model.googleAccount != null) {
  //       return Center(
  //           child:
  //               LoggedInUI(model)); //Test report main page App should come here
  //     } else {
  //       return loginControl(context);
  //     }
  //   });
  //   model.googleAccount;
  // }
  loginUI(GoogleSignInAccount? model) {
    if (model != null) {
      return Center(child: LoggedInUI(model));
    } else {
      return loginControl();
    }
  }

  ///////////////////////////////////////////
  LoggedInUI(GoogleSignInAccount? model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(model!.photoUrl ?? '').image,
            radius: 30,
          ),
          Text(model.displayName ?? ''),
          Text(model.email),
          ActionChip(
            avatar: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: (() {
              sl<GoogleSignInController>().logout();
            }),
          )
        ],
      ),
    );
  }

  ////////////////////////////////////
  loginControl() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('images/google-logo.png', width: 200),
            onTap: () {
              // getX((GoogleSignInController x) => x.login());
              sl<GoogleSignInController>().login();
            },
          ),
          Divider(height: 30),
          Image.asset('images/fb-logo.png', width: 200),
        ],
      ),
    );
  }
}
