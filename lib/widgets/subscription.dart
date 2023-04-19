import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/subscriptions.dart';

class SubscriptionsWidget extends StatelessWidget {
  const SubscriptionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var item = subscriptionsList[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 14),
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0.01,
                        blurRadius: 16,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white, Colors.white.withOpacity(0.1)],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Image.asset(
                                item['logo'],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                item['name'],
                                style: const TextStyle(
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${item['price']}',
                                    style: const TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 17),
                                  ),
                                  const Text(
                                    '/mo',
                                    style: TextStyle(
                                        fontFamily: 'Avenir',
                                        color: Colors.black,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: subscriptionsList.length,
      ),
    );
  }
}
