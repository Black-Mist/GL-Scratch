// import 'package:calltracker/models/call_log_model.dart';
// import 'package:calltracker/networking/riverpod/auth_provider.dart';
// import 'package:calltracker/networking/riverpod/riverpod.dart';
// import 'package:calltracker/screens/home/home.dart';
// import 'package:calltracker/screens/home/widgets/overlay_window.dart';
// import 'package:calltracker/screens/login/login.dart';
// import 'package:calltracker/screens/splash/splash_screen.dart';
// import 'package:calltracker/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gl_tasks/riverpod.dart';
import 'package:gl_tasks/routes.dart';

import 'auth_provider.dart';
import 'screen/loginscreen.dart';
import 'screen/myhomepage.dart';
import 'screen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GL Dialer',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Poppins'),
      onGenerateRoute: generateRoute,
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class AppInit extends ConsumerStatefulWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  ConsumerState<AppInit> createState() => _AppInitState();
}

class _AppInitState extends ConsumerState<AppInit> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        // DeviceOrientation.landscapeLeft,
        // DeviceOrientation.landscapeRight
      ],
    );
    return Consumer(
      builder: (context, ref, _) {
        final data = ref.watch(authProvider);
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: curretnScreen(data.state),
        );
      },
    );
  }

  Widget curretnScreen(AuthState state) {
    switch (state) {
      case AuthState.initialize:
        return const SplashScreen();
      case AuthState.authenticated:
        return const MyHomePage();
      case AuthState.unauthenticated:
        return const LoginScreen();
      default:
        return const SplashScreen();
      // return const MyHomePage();
    }
  }
}
