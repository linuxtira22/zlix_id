
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zlix_id/presentation/extension/build_context_extension.dart';
import 'package:zlix_id/presentation/misc/methods.dart';
import 'package:zlix_id/presentation/providers/router/router_provider.dart';
import 'package:zlix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:zlix_id/presentation/widget/zlix_text_filed.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed('main');
        } else if (next is AsyncError) {
          context.showSnackbar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              verticalSpace(50),
              Center(
                child: Image.asset(
                  'assets/flix_logo.png',
                  width: 150,
                ),
              ),
              verticalSpace(50),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.add_a_photo,
                  size: 50,
                ),
              ),
              verticalSpace(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    ZlixTextField(
                        labelText: 'Email', controller: emailController),
                    verticalSpace(24),
                    ZlixTextField(
                        labelText: 'Name', controller: nameController),
                    verticalSpace(24),
                    ZlixTextField(
                        labelText: 'Password',
                        controller: passwordController,
                        obscureText: true),
                    verticalSpace(24),
                    ZlixTextField(
                        labelText: 'Retype Password',
                        controller: retypePasswordController,
                        obscureText: true),
                    verticalSpace(24),
                    switch (ref.watch(userDataProvider)) {
                      AsyncData(:final value) => value == null
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (passwordController.text ==
                                        retypePasswordController.text) {
                                      ref
                                          .read(userDataProvider.notifier)
                                          .register(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text);
                                    } else {
                                      context.showSnackbar(
                                          'Please retype your password with the same value');
                                    }
                                  },
                                  child: const Text(
                                    'Register',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
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
                      children: [
                        Text('Already have account ?'),
                        TextButton(
                            onPressed: () {
                              ref.read(routerProvider).goNamed('login');
                            },
                            child: Text('Login here'))
                      ],
                    ),
                    verticalSpace(24),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
