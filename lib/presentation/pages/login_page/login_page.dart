import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zlix_id/presentation/extension/build_context_extension.dart';
import 'package:zlix_id/presentation/misc/methods.dart';
import 'package:zlix_id/presentation/providers/router/router_provider.dart';
import 'package:zlix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:zlix_id/presentation/widget/zlix_text_filed.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          } else if (next is AsyncError) {
            context.showSnackbar(next.error.toString());
          }
        }
      },
    );
    return Scaffold(
      body: ListView(
        children: [
          verticalSpace(100),
          Center(
            child: Image.asset(
              'assets/flix_logo.png',
              width: 150,
            ),
          ),
          verticalSpace(100),
          ZlixTextField(
            labelText: 'email',
            controller: emailController,
          ),
          verticalSpace(24),
          ZlixTextField(
            labelText: 'password',
            controller: passwordController,
            obscureText: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password ?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          verticalSpace(24),
          switch (ref.watch(userDataProvider)) {
            AsyncData(:final value) => value == null
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(userDataProvider.notifier).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                        //.login(email: 'jeni@black.com', password: '123456',);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            _ => const Center(
                child: CircularProgressIndicator(),
              )
          },
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account"),
              TextButton(
                  onPressed: () {
                    ref.read(routerProvider).goNamed('register');
                  },
                  child: Text(
                    'Register here',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dashboard"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Column(
//               children: [
//               Container(
//               height: 100.0,
//               color: Colors.red,
//               ),
//               Container(
//               height: 100.0,
//               color: Colors.blue,
//               ),
//               ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
