import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_auth/configs/constants/app_assets.dart';
import 'package:neo_auth/configs/constants/app_colors.dart';
import 'package:neo_auth/configs/constants/app_dimensions.dart';
import 'package:neo_auth/configs/constants/app_styles.dart';
import 'package:neo_auth/configs/constants/app_texts.dart';
import 'package:neo_auth/configs/routes/app_routes.dart';
import 'package:neo_auth/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:neo_auth/features/auth/presentation/widgets/text_field_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.d16)
                  .copyWith(top: AppDimensions.d24),
              child: Column(
                children: [
                  Image.asset(AppAssets.auth),
                  const SizedBox(height: AppDimensions.d32),
                  Text(
                    AppTexts.ruWelcomeBack,
                    style: AppStyles.s40w500.copyWith(
                      fontSize: AppDimensions.d24,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.d28),
                  TextFieldWidget(
                    hintText: AppTexts.enterLogin,
                    controller: _loginController,
                  ),
                  const SizedBox(height: AppDimensions.d16),
                  TextFieldWidget(
                    obscureText: !_passwordVisible,
                    onSuffixPressed: _passwordVisibility,
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.hintColor,
                    ),
                    hintText: AppTexts.enterPassword,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: AppDimensions.d24),
                  _buildBlocListener(context),

                  const SizedBox(height: AppDimensions.d40),
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

  BlocListener<AuthorizationBloc, AuthorizationState> _buildBlocListener(
      BuildContext context) {
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state is AuthorizationDone) {
          Navigator.pushNamed(context, AppRoutes.welcome);
        } else if (state is AuthorizationError) {
          _buildShowDialog(context);
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthorizationBloc>(context).add(
              MakeAuthorization(
                username: _loginController.text,
                password: _passwordController.text,
              ),
            );
          },
          child: Text(
            AppTexts.signIn,
            style: AppStyles.s16w500.copyWith(
              color: AppColors.textField,
            ),
          ),
        ),
      ),
    );
  }

  void _buildShowDialog(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        AppTexts.incorrectLoginOrPassword,
        style: AppStyles.s16w500.copyWith(color: AppColors.red),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100, left: 10, right: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
