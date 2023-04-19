import 'package:finance_app_flutter/constants/assets.dart';
import 'package:flutter/material.dart';

import '../data/friends.dart';

class FriendsMoneyWidget extends StatefulWidget {
  const FriendsMoneyWidget({
    super.key,
  });

  @override
  State<FriendsMoneyWidget> createState() => _FriendsMoneyWidgetState();
}

class _FriendsMoneyWidgetState extends State<FriendsMoneyWidget> {
  double _currentSliderVaule = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var friendIndex = friends[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  children: [
                    ClipOval(
                      child: GestureDetector(
                        onTap: () {
                          print('send money');
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            barrierColor: Colors.black.withOpacity(0.4),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 400,
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 40, right: 20, left: 14),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.asset(
                                                    friendIndex['profileUrl'],
                                                    width: 50,
                                                    height: 50,
                                                    fit: BoxFit.cover),
                                              ),
                                              const SizedBox(width: 20),
                                              Text(friendIndex['name'],
                                                  style: const TextStyle(
                                                      fontFamily: 'Avenir',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                '\$1,5',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Avenir',
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                'Commission 0.5\$',
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    fontFamily: 'Avenir',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState) {
                                        return Slider(
                                          value: _currentSliderVaule,
                                          min: 0,
                                          max: 100,
                                          inactiveColor: Color(0xffE0E3E9),
                                          activeColor: Color(0xff4FE49D),
                                          label: _currentSliderVaule
                                              .round()
                                              .toString(),
                                          onChanged: (double value) {
                                            _currentSliderVaule = value;
                                            setState(() {
                                              _currentSliderVaule = value;
                                            });
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 50),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14,
                                          top: 15,
                                          right: 14,
                                          bottom: 20),
                                      child: Container(
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              masterCard,
                                              width: 45,
                                            ),
                                            const SizedBox(width: 15),
                                            const Text(
                                              '****',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            const Text(
                                              '1211',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const Spacer(),
                                            Image.asset(
                                              'assets/images/down-icon.png',
                                              width: 14,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14,
                                          top: 15,
                                          right: 14,
                                          bottom: 20),
                                      child: Container(
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Send Money',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          friendIndex['profileUrl'],
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      friendIndex['name'],
                      style: const TextStyle(
                          fontFamily: 'Avenir', fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: friends.length,
      ),
    );
  }
}
