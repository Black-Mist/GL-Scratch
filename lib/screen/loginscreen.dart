import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gl_tasks/login_provider.dart';
import 'package:gl_tasks/riverpod.dart';
import 'package:gl_tasks/routes.dart';

import '../auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = false;
  bool isLandscape = false;
  Authentication auth = Authentication();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  login() {
    ref
        .read(loginProvider)
        .login('91${username.text}', password.text.toString());
  }

  Widget loginlist() {
    ref.listen<dynamic>(loginProvider, (previous, next) {
      if (next.status == LoginStatus.success) {
        Navigator.pushNamed(context, AppRoutes.home);
        ref.read(loginProvider).notifyState(LoginStatus.initialize);
      }
      if (next.status == LoginStatus.failed) {
        dialogMessage();
      }
    });
    return const SizedBox.shrink();
  }

  Widget topWidget() => SizedBox(
          child: Column(
        children: [
          Hero(tag: 'logo', child: Image.asset('assets/getlead_logo.png')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Enter your email ID and password to get access \n to your account',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ));

  Widget passwordForm() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: password,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
              suffixIcon: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Flexible(
                      child: Text(
                        '|',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    const Flexible(child: SizedBox(width: 20)),
                    Flexible(
                      child: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              )),
        ),
      );

  Widget numberFrom() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: username,
          decoration: const InputDecoration(
              prefixText: '+91 ',
              prefixStyle: TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              )),
        ),
      );

  dialogMessage() => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: isLandscape ? 220 : double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Incorrect password or username!',
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  Widget buttonLogin() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: InkWell(
          onTap: () {
            login();
            // if (await LoginProvider(auth)
            //     .login('91${username.text}', password.text.toString())) {
            //   Navigator.of(context, rootNavigator: true).pushNamed('home');
            // } else {
            //   dialogMessage();
            // }
          },
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF3649),
                      Color(0xFFFF5733),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );

  Widget bottomWidget() => SizedBox(
        width: isLandscape ? 320 : double.infinity,
        // height: isLandscape ? height - 1000 : 370,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mobile number or Email',
                style: TextStyle(color: Colors.grey),
              ),
              numberFrom(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(color: Colors.grey),
              ),
              passwordForm(),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              buttonLogin()
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    // double height = WidgetsBinding.instance.window.physicalSize.height;
    // double width = WidgetsBinding.instance.window.physicalSize.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              topWidget(),
              bottomWidget(),
              loginlist(),
            ],
          ),
        ),
      ),
    );
  }
}
