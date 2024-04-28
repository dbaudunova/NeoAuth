import 'package:flutter/material.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/presentation/widgets/text_field_widget.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _emailController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  late bool _passwordVisible;
  late bool _repeatPasswordVisible;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _repeatPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${AppTexts.createAccount}\n${AppTexts.lorby}',
              style: AppStyles.s40w500.copyWith(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextFieldWidget(
              hintText: AppTexts.enterEmail,
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              hintText: AppTexts.createLogin,
              controller: _loginController,
            ),
            const SizedBox(height: 16),
            TextFieldWidget(
              obscureText: !_passwordVisible,
              onPressed: () => setState(
                () => _passwordVisible = !_passwordVisible,
              ),
              icon: Icon(
                _buildIcon(_passwordVisible),
                color: AppColors.hintColor,
              ),
              hintText: AppTexts.createPassword,
              controller: _passwordController,
            ),
            const SizedBox(height: 8),
            _buildHelperText(AppTexts.countOfSymbols),
            _buildHelperText(AppTexts.lowerAndUpperCase),
            _buildHelperText(AppTexts.min1digital),
            _buildHelperText(AppTexts.min1specialCharacter),
            const SizedBox(height: 16),
            TextFieldWidget(
              obscureText: !_repeatPasswordVisible,
              onPressed: () => setState(
                () => _repeatPasswordVisible = !_repeatPasswordVisible,
              ),
              icon: Icon(
                _buildIcon(_repeatPasswordVisible),
                color: AppColors.hintColor,
              ),
              hintText: AppTexts.repeatPassword,
              controller: _repeatPasswordController,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColors.unButton,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  AppTexts.next,
                  style: AppStyles.s16w500.copyWith(
                    color: AppColors.hintColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildHelperText(String text) {
    return Text(
      text,
      style: AppStyles.s16w500.copyWith(fontSize: 12),
    );
  }

  IconData _buildIcon(bool password) {
    return password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      toolbarHeight: 56,
      titleTextStyle: AppStyles.s16w500.copyWith(
        color: AppColors.buttonColor,
      ),
      title: const Text(AppTexts.registration),
    );
  }
}
