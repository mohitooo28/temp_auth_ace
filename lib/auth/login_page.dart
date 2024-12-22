import 'package:auth_ui/auth/widget/email_field.dart';
import 'package:auth_ui/auth/widget/loading_bar.dart';
import 'package:auth_ui/auth/widget/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      key: _scaffoldKey,
      body: _isLoading
          ? const CustomCircularLoading()
          : SafeArea(
              child: GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //*-------------------------------------------------------------
                              GestureDetector(
                                onLongPress: () {
                                  HapticFeedback.heavyImpact();
                                },
                                child: Image.network(
                                  // App LOGO
                                  'https://img.icons8.com/stencil/256/tower.png',
                                  height: 100,
                                ),
                              ),
                              //*-------------------------------------------------------------
                              const SizedBox(height: 15),
                              Text(
                                'Login',
                                style: GoogleFonts.museoModerno(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600),
                              ),
                              //*-------------------------------------------------------------
                              const SizedBox(height: 5),
                              Text(
                                'Welcome Back to ACE Broadcast',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              //*-------------------------------------------------------------
                              Text(
                                'Explore, Apply, and Engage',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              //!-----------------------------------------------------
                              const SizedBox(height: 28),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    //*-----------------------------------------------
                                    EmailTextField(
                                        emailController: _emailController,
                                        emailFocusNode: f1,
                                        nextFocusNode: f2),
                                    //*-----------------------------------------------
                                    PasswordTextField(
                                        passwordController: _passwordController,
                                        passwordFocusNode: f2,
                                        nextFocusNode: f3),
                                    //*-----------------------------------------------
                                  ],
                                ),
                              ),
                              //*-----------------------------------------------------
                              const SizedBox(height: 60),
                              InkWell(
                                focusNode: f3,
                                onTap: () async {
                                  HapticFeedback.mediumImpact();
                                  if (_formKey.currentState!.validate()) {
                                    // show loading
                                    // function to email & password sign in
                                    // no need of validation as its already done
                                    // Navigate to home page
                                  }
                                },
                                child: Container(
                                  width: screenSize,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              //*-------------------------------------------------------------
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  // show loading
                                  // Navigate to function for direct google sign in
                                  // Navigate to home page
                                },
                                child: Container(
                                  width: screenSize,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          "https://img.icons8.com/fluency/240/google-logo.png",
                                          height: 25,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'SIGN IN WITH GOOGLE',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // const Spacer(),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don't have an account? ",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary),
                                      children: [
                                        TextSpan(
                                          text: "Create One",
                                          style: GoogleFonts.lato(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary, // Custom color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
