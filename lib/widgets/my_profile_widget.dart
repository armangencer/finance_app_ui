import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              myProfile,
              width: 70,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Total Balance',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w700,
              fontSize: 58,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          const Text(
            '\$ 120.000,10',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: Colors.black),
          ),
          const SizedBox(height: 20),
          const Text(
            'Send Money',
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
