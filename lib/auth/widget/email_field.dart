import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.nextFocusNode,
  });

  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8))),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              cursorColor: Theme.of(context).colorScheme.primary,
              validator: (value) {
                bool isEmailValid =
                    RegExp(r'^[a-zA-Z0-9]+-[a-zA-Z0-9]+@atharvacoe\.ac\.in$')
                        .hasMatch(value!);

                if (value.isEmpty) {
                  return "Please Enter Your Email ID";
                } else if (!isEmailValid) {
                  return "Please Enter a Valid Atharva Email ID";
                }
                return null;
              },
              onFieldSubmitted: (value) {
                emailFocusNode.unfocus();
                FocusScope.of(context).requestFocus(nextFocusNode);
              },
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                errorStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Iconsax.sms4,
                  color: Theme.of(context).colorScheme.surfaceDim,
                  size: 23,
                ),
                hintText: 'Email',
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14), // Adjust padding
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
