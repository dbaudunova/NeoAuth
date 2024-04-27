import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/presentation/widgets/text_field_widget.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void _passwordVisibility() {
    setState(
      () {
        _passwordVisible = !_passwordVisible;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
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
              const TextFieldWidget(
                hintText: AppTexts.enterLogin,
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
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
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
                onTap: () => Navigator.pushNamed(context, '/registration'),
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
    );
  }
}
