import 'package:case_study/constant.dart';
import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({
    Key? key,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.press,
  }) : super(key: key);

  final String firstName, lastName, avatar, email;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: width * 0.02),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor:
                  Theme.of(context).colorScheme.primaryContainer,
            ),
            onPressed: press,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.1,
                  height: width * 0.1,
                  child: Image.network(avatar, fit: BoxFit.cover),
                ),
                SizedBox(width: width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$firstName $lastName",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: width * 0.035,
                        ),
                      ),
                      SizedBox(height: 5), // Adjust the spacing between name and email
                      Text(
                        email,
                        style: TextStyle(
                          color:kSecondaryColor,
                          fontSize: width * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
