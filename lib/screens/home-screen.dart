import 'dart:ui';

import 'package:events_app_flutter/widgets/event-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4361ee),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Menu Icon
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
            SizedBox(height: 20),
            //* Topic Text
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                'EXLUSIVE EVENTS,\nPRICELESS MEMORIES',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.4,
                ),
              ),
            ),
            Row(
              children: [
                //* Search Section
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(30, 35, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xff3f37c9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                //* Fiter button
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(20, 35, 30, 0),
                  decoration: BoxDecoration(
                    color: Color(0xff3f37c9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.sort_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            //* Favourites
            Container(
              padding: EdgeInsets.fromLTRB(30, 35, 30, 0),
              child: Text(
                'SUGGESTED EVENTS',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            //* Events list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 30),
                  EventCard(
                    imageLocation: 'lib/assets/fav-event-2.jpg',
                    eventName: 'Musical Show',
                    eventDetails: '28.07.2021 • LKR 6,000',
                  ),
                  SizedBox(width: 20),
                  EventCard(
                    imageLocation: 'lib/assets/fav-event-1.jpg',
                    eventName: 'DJ Night',
                    eventDetails: '12.07.2021 • LKR 4,000',
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            SizedBox(height: 50),
            Flexible(
              fit: FlexFit.tight,
              child: Stack(
                children: [
                  //* Popular Events Card
                  Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    height: double.infinity,
                    padding: EdgeInsets.fromLTRB(30, 36, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xff212529),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MOST POPULAR',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_upward_rounded,
                            color: Colors.white54,
                            size: 25,
                          )
                        ],
                      ),
                      onTap: () {
                        print('Tapped');
                      },
                    ),
                  ),
                  //* Newest Events Card
                  Container(
                    height: double.infinity,
                    margin: EdgeInsets.fromLTRB(80, 100, 0, 0),
                    padding: EdgeInsets.fromLTRB(42, 36, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xff3f37c9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NEWEST EVENTS',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.white54,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                  //* Upcoming Events
                  Container(
                    height: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    padding: EdgeInsets.fromLTRB(30, 36, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0xffdee2ff),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UPCOMINGS',
                          style: GoogleFonts.inter(
                            color: Color(0xff212529),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.black38,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
