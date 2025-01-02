import 'package:chateo/core/constants/constants.dart';
import 'package:chateo/core/themes/app_theme.dart';
import 'package:chateo/core/widgets/button_widget.dart';
import 'package:chateo/core/widgets/textfield_widget.dart';
import 'package:chateo/features/auth/controller/auth_controller.dart';
import 'package:chateo/features/auth/view/pages/signup_page.dart';
import 'package:chateo/features/auth/view/widgets/forgot_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final constants = ref.watch(constantsProvider);
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;

    final FormKey = useMemoized(() => GlobalKey<FormState>());

    void onLoginButtonClicked() {
      if (FormKey.currentState!.validate()) {
        ref
            .read(authControllerProvider.notifier)
            .login(emailController.text, passwordController.text);
      }
    }

    return Scaffold(
      backgroundColor: colors.secondary,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width / 11),
            child: Form(
              key: FormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 5,
                  ),
                  Text(
                    constants.txtLoginHeading,
                    style: typography.h800,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width / 8),
                    child: Text(
                      textAlign: TextAlign.center,
                      constants.txtLoginSubHeading,
                      style: typography.h100.copyWith(color: colors.text),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 13,
                  ),

                  TextfieldWidget(
                    label: constants.txtEmail,
                    controller: emailController,
                    validator:
                        ref.read(authControllerProvider.notifier).validateEmail,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 40,
                  ),
                  TextfieldWidget(
                    label: constants.txtPassword,
                    controller: passwordController,
                    validator: ref
                        .read(authControllerProvider.notifier)
                        .validatePassword,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 150,
                  ),
                  const Row(
                    children: [
                      ForgotPasswordButtonWidget(),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 13,
                  ),
                  ButtonWidget(onPressed: onLoginButtonClicked),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 40,
                  ),
                  // Already have an account part

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        constants.txtDontHaveAccount,
                        style: typography.h100.copyWith(color: colors.text),
                      ),
                      SizedBox(
                        width: spacer.space_25,
                      ),
                      InkWell(
                        child: Text(
                          constants.txtSignup,
                          style: typography.h200.copyWith(
                              color: colors.primary,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          context.push(SignupPage.routePath);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
