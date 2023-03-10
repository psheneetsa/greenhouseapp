import 'dart:async';
import 'package:greenhouseapp/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:greenhouseapp/logreg/aclog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dcdg/dcdg.dart';
import "package:flutter/services.dart";

//void main() => runApp(AppWidget());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  late StreamSubscription<User?> user;

  user = FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      runApp(AppLogin());

    } else {
      runApp(AppWidget());
    }
  });

}



class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Nav Bar with Nested Routing',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

class AppLogin extends StatelessWidget {
  const AppLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Aclog());
  }
}
