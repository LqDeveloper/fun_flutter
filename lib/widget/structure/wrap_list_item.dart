import 'package:flutter/material.dart';

typedef ItemTap = void Function(int index, int childIndex);

class WrapListItem extends StatelessWidget {
  final String title;
  final List<String> children;
  final int index;
  final ItemTap onTap;

  const WrapListItem(
      {Key? key,
      required this.title,
      required this.children,
      required this.index,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Wrap(
              spacing: 10,
              children: List.generate(children.length, (i) {
                return ActionChip(
                    label: Text(
                      children[i],
                      maxLines: 1,
                    ),
                    onPressed: () {
                      onTap(index, i);
                    });
              })),
          const Divider(color: Colors.grey)
        ],
      ),
    );
  }
}
