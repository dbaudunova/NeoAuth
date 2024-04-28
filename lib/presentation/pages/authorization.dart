import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/presentation/widgets/error_alert_dialog_widget.dart';
import 'package:neo_auth/presentation/widgets/text_field_widget.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  late bool _passwordVisible;
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  void _passwordVisibility() {
    setState(
      () {
        _passwordVisible = !_passwordVisible;
      },
    );
  }

  void _signIn() {
    String enteredLogin = _loginController.text;
    String enteredPassword = _passwordController.text;

    if (enteredLogin == 'user' && enteredPassword == 'password') {
      Navigator.pushNamed(context, AppRoutes.welcome);
    } else {
      _buildShowDialog(context);
      _passwordController.clear();
      _loginController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
              child: Column(
                children: [
                  Image.asset(AppAssets.auth),
                  const SizedBox(height: 32),
                  Text(
                    AppTexts.ruWelcomeBack,
                    style: AppStyles.s40w500.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 28),
                  TextFieldWidget(
                    hintText: AppTexts.enterLogin,
                    controller: _loginController,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    obscureText: !_passwordVisible,
                    onPressed: _passwordVisibility,
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.hintColor,
                    ),
                    hintText: AppTexts.enterPassword,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: _signIn,
                      child: Text(
                        AppTexts.signIn,
                        style: AppStyles.s16w500.copyWith(
                          color: AppColors.textField,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  //button or text?
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.registration,
                    ),
                    child: Text(
                      AppTexts.noAccount,
                      style: AppStyles.s16w500.copyWith(
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildShowDialog(BuildContext context) {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        _closeAlert(context);
        return const AlertDialogWidget(
          title: AppTexts.incorrectLoginOrPassword,
        );
      },
    );
  }

  void _closeAlert(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pop(context),
    );
  }
}
