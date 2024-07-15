import 'package:flutter/material.dart';
import 'package:kickoff/ui/common/app_colors.dart';
import 'package:kickoff/ui/common/ui_helpers.dart';

class InfoField extends StatelessWidget {
  const InfoField({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: kblack.withOpacity(0.7)),
        ),
        verticalSpace(6),
        SizedBox(
          height: 44,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              hintText: text,
              hintStyle: TextStyle(
                color: kblack.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color(0xffD0D5DD), // Border color
                  width: 1, // Border width
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color(0xffD0D5DD), // Border color
                  width: 1.0, // Border width
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color(0xffD0D5DD), // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
