import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_dimensions.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:neo_auth/features/registration/presentation/widgets/app_bar_widget.dart';
import 'package:neo_auth/features/auth/presentation/widgets/text_field_widget.dart';

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
  bool _isPasswordValid = false;
  bool _isSpecialValid = false;
  bool _isDigitalValid = false;
  bool _isNumberValid = false;
  String? errorTextEmail;
  bool _repeatPasswordValid = false;

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
      appBar: AppBarStyle(
        onIconPressed: () => Navigator.pop(context),
        title: AppTexts.registration,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.d16)
                .copyWith(top: AppDimensions.d40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${AppTexts.createAccount}\n${AppTexts.lorby}',
                  style: AppStyles.s40w500.copyWith(
                    fontSize: AppDimensions.d24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.d40),
                TextFieldWidget(
                  onChanged: (value) {
                    if (value.contains(
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
                      setState(() {
                        errorTextEmail = null;
                      });
                    } else {
                      setState(() {
                        errorTextEmail = 'Неверный формат почты';
                      });
                    }
                  },
                  errorText: errorTextEmail,
                  hintText: AppTexts.enterEmail,
                  controller: _emailController,
                ),
                const SizedBox(height: AppDimensions.d16),
                TextFieldWidget(
                  hintText: AppTexts.createLogin,
                  controller: _loginController,
                ),
                const SizedBox(height: AppDimensions.d16),
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
                  onChanged: (value) {
                    setState(() {
                      _isPasswordValid = _isPasswordCompliant(value);
                      _isDigitalValid = _isDigitalCompliant(value);
                      _isNumberValid = _isCountCompliant(value);
                      _isSpecialValid = _isSpecialCompliant(value);
                    });
                  },
                ),
                const SizedBox(height: AppDimensions.d8),
                _buildHelperText(AppTexts.countOfSymbols,
                    _isNumberValid ? AppColors.green : AppColors.red),
                _buildHelperText(AppTexts.lowerAndUpperCase,
                    _isPasswordValid ? AppColors.green : AppColors.red),
                _buildHelperText(AppTexts.min1digital,
                    _isDigitalValid ? AppColors.green : AppColors.red),
                _buildHelperText(AppTexts.min1specialCharacter,
                    _isSpecialValid ? AppColors.green : AppColors.red),
                const SizedBox(height: AppDimensions.d16),
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
                  onChanged: (value) {
                    _repeatPasswordValid = (_passwordController.text == value);
                  },
                ),
                const SizedBox(height: AppDimensions.d24),
                BlocListener<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                    if (state is RegistrationDone) {
                      Navigator.pushNamed(context, AppRoutes.authorization);
                    } else if (state is RegistrationError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${state.error}'),
                        ),
                      );
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return AppColors.unButton;
                          }
                          return AppColors.buttonColor;
                        }),
                      ),
                      onPressed: _isFormValid()
                          ? () =>
                              BlocProvider.of<RegistrationBloc>(context).add(
                                MakeRegister(
                                  email: _emailController.text,
                                  username: _loginController.text,
                                  password: _passwordController.text,
                                ),
                              )
                          : null,
                      child: Text(
                        AppTexts.next,
                        style: AppStyles.s16w500.copyWith(
                          color: AppColors.hintColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _isPasswordValid &&
        _isDigitalValid &&
        _isNumberValid &&
        _isSpecialValid &&
        _repeatPasswordValid;
  }

  bool _isPasswordCompliant(String password) {
    RegExp regExp = RegExp(r'(?=.*?[A-Za-z])');
    return regExp.hasMatch(password);
  }

  bool _isSpecialCompliant(String password) {
    RegExp regExp = RegExp(r'(?=.*?[!@#\$&*~])');
    return regExp.hasMatch(password);
  }

  bool _isDigitalCompliant(String password) {
    RegExp regExp = RegExp(r'(?=.*?[0-9])');
    return regExp.hasMatch(password);
  }

  bool _isCountCompliant(String password) {
    RegExp regExp = RegExp(r'.{8,15}');
    return regExp.hasMatch(password);
  }

  Text _buildHelperText(String text, Color color) {
    return Text(
      text,
      style:
          AppStyles.s16w500.copyWith(fontSize: AppDimensions.d12, color: color),
    );
  }

  IconData _buildIcon(bool password) {
    return password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }
}
