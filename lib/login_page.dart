// import 'package:ark_power_login/google_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Test-Report-Sign-In-Page', style: TextStyle(fontSize: 23)),
        centerTitle: true,
      ),
      body: loginUI(),
      backgroundColor: Colors.grey[200],
    );
  }

  loginUI() {
    return Consumer<GoogleSignInController>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return Center(
            child:
                LoggedInUI(model)); //Test report main page App should come here
      } else {
        return loginControl(context);
      }
    });
  }

  LoggedInUI(GoogleSignInController model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage:
                Image.network(model.googleAccount!.photoUrl ?? '').image,
            radius: 30,
          ),
          Text(model.googleAccount!.displayName ?? ''),
          Text(model.googleAccount!.email),
          ActionChip(
            avatar: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: (() {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .logout();
            }),
          )
        ],
      ),
    );
  }

  loginControl(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('images/google-logo.png', width: 200),
            onTap: () {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .login();
            },
          ),
          Divider(height: 30),
          Image.asset('images/fb-logo.png', width: 200),
        ],
      ),
    );
  }
}
