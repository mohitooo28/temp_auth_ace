import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.nextFocusNode,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final FocusNode nextFocusNode;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late ValueNotifier<bool> _passwordVisibleNotifier;

  @override
  void initState() {
    super.initState();
    _passwordVisibleNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _passwordVisibleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: ValueListenableBuilder<bool>(
                  valueListenable: _passwordVisibleNotifier,
                  builder: (context, passwordVisible, child) {
                    return TextFormField(
                      controller: widget.passwordController,
                      focusNode: widget.passwordFocusNode,
                      cursorColor: Theme.of(context).colorScheme.primary,
                      obscureText: !passwordVisible,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a password.";
                        }

                        if (value.length < 8) {
                          return "At least 8 characters.";
                        }

                        if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                          return "Include an uppercase letter.";
                        }

                        if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                          return "Include a lowercase letter.";
                        }

                        if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                          return "Include a number.";
                        }

                        if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                          return "Include a special character.";
                        }

                        return null;
                      },
                      onFieldSubmitted: (value) {
                        widget.passwordFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(widget.nextFocusNode);
                      },
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        errorStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Iconsax.password_check4,
                          color: Theme.of(context).colorScheme.surfaceDim,
                          size: 23,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.surfaceDim,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _passwordVisibleNotifier.value =
                                !_passwordVisibleNotifier.value;
                          },
                          child: Icon(
                            passwordVisible ? Iconsax.eye_slash4 : Iconsax.eye,
                            color: Theme.of(context).colorScheme.surfaceDim,
                            size: 23,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14), // Adjust padding
                        isDense: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Forgot Password?',
            style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.surfaceDim),
          ),
        ],
      ),
    );
  }
}
