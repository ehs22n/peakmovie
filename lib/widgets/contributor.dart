import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Contributor {

  final String name;
  final String username;
  final String role;
  final String social;

  const Contributor({
    required this.name,
    required this.username,
    required this.role,
    required this.social,
  });

}

class ContributorChip extends StatelessWidget {

  final Contributor contributor;

  const ContributorChip({
    super.key,
    required this.contributor,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return GestureDetector(

      onTap: () {
        _showContributorDialog(context);
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 80,

        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.dividerColor.withOpacity(0.25),
          ),
        ),

        alignment: Alignment.center,

        child: Text(
          contributor.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showContributorDialog(BuildContext context) {

    final theme = Theme.of(context);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dialogBorderRadius: BorderRadius.circular(18),
      width: 320,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// Avatar
            CircleAvatar(
              radius: 30,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
              child: Text(
                contributor.name[0],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// Name
            Text(
              contributor.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            /// Role
            Text(
              contributor.role,
              style: TextStyle(
                fontSize: 13,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),

            const SizedBox(height: 18),

            /// Username
            _infoRow(
              icon: Icons.person_outline,
              title: "Username",
              value: contributor.username,
            ),

            const SizedBox(height: 10),

            /// Social
            _infoRow(
              icon: Icons.link,
              title: "Social",
              value: contributor.social,
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),

      btnOkText: "بستن",
      btnOkColor: theme.colorScheme.primary,
      btnOkOnPress: () {},

    ).show();
  }

  Widget _infoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {

    return Row(
      children: [

        Icon(icon, size: 18),

        const SizedBox(width: 6),

        Text(
          "$title:",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(width: 6),

        Expanded(
          child: Text(value),
        ),

      ],
    );
  }
}
