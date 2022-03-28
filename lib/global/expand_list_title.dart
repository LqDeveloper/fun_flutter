import 'package:flutter/material.dart';

class ExpandListTitle extends StatelessWidget {
  final bool isExpand;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? expandWidget;

  const ExpandListTitle(
      {Key? key,
      required this.isExpand,
      required this.title,
      required this.icon,
      this.expandWidget,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            trailing: AnimatedRotation(
              turns: isExpand ? -0.5 : 0,
              duration: const Duration(milliseconds: 100),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
        Offstage(
          offstage: !isExpand,
          child: expandWidget,
        )
      ],
    );
  }
}
