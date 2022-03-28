import 'package:flutter/material.dart';

class ArticlePlaceholder extends StatelessWidget {
  const ArticlePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.7,
        ),
      )),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            ClipOval(
              child: Container(
                width: 10,
                height: 10,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 60,
              height: 8,
              color: Colors.grey,
            ),
            const Spacer(),
            Container(
              width: 40,
              height: 8,
              color: Colors.grey,
            )
          ]),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Container(
                    width: 250,
                    height: 8,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 200,
                    height: 8,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 160,
                    height: 8,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 8,
                color: Colors.grey,
              ),
              Container(
                width: 10,
                height: 10,
                color: Colors.grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
