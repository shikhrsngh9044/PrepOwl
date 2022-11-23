import 'package:flutter/material.dart';
import 'dart:math';

import '../../../_utils/res/dimen.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimen.size10),
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onLongPress: () {},
          child: Stack(
            children: [
              Container(
                height: AppDimen.size100,
                width: MediaQuery.of(context).size.width - AppDimen.size100,
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)]
                      .withOpacity(0.8),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppDimen.size14)),
                ),
                child: Center(
                  child: Text(
                    "Category ${index + 1}",
                    style: const TextStyle(
                      fontSize: AppDimen.size25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimen.size14)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: AppDimen.size50,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
