// import 'package:call_log/call_log.dart';
// import 'package:calltracker/main.dart';
// import 'package:calltracker/models/call_log_model.dart';
// import 'package:calltracker/screens/add_lead/add_lead.dart';
// import 'package:calltracker/screens/call_logs/call_log.dart';
// import 'package:calltracker/screens/home/home.dart';
// import 'package:calltracker/screens/login/login.dart';
// import 'package:calltracker/screens/testing/testing.dart';
import 'package:flutter/material.dart';

import 'screen/loginscreen.dart';
import 'main.dart';
import 'screen/myhomepage.dart';

class AppRoutes {
  static const init = '/';
  static const login = 'login';
  static const home = 'home';
  static const addLead = 'add_lead';
  static const callLogs = 'call_logs';
  static const testing = 'testing';
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.init:
      return MaterialPageRoute(builder: (context) => const AppInit());

    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());

    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const MyHomePage());
    // case AppRoutes.addLead:
    //   return MaterialPageRoute(
    //     builder: (context) => AddLeadScreen(
    //       lastEntry: settings.arguments as CallLogEntry,
    //     ),
    //   );
    // case AppRoutes.callLogs:
    //   return MaterialPageRoute(
    //     builder: (context) =>
    //         CallLogHistory(history: settings.arguments as List<CallLogModel>),
    //   );

    // case AppRoutes.testing:
    //   return MaterialPageRoute(
    //     builder: (context) => const Testing(),
    //   );

    default:
      const SizedBox();
  }
  return null;
}
