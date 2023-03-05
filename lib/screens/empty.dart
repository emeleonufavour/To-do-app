import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class EmptyListPage extends StatelessWidget {
  const EmptyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          SvgPicture.asset(
            'assets/svg/hourglass.svg',
            width: 100,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Add something to your TODO list!')
        ],
      ),
    );
  }
}
