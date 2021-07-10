import 'package:events_app_flutter/screens/event-inner-screen.dart';
import 'package:events_app_flutter/screens/home-screen.dart';
import 'package:events_app_flutter/widgets/animated-widgets.dart';
import 'package:events_app_flutter/widgets/full-event-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopularEventsScreen extends StatefulWidget {
  const PopularEventsScreen({Key? key}) : super(key: key);

  @override
  _PopularEventsScreenState createState() => _PopularEventsScreenState();
}

class _PopularEventsScreenState extends State<PopularEventsScreen> {
  double opacity = 1;
  double topPadding = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Hero(
            tag: 'card',
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(30, 60, 0, 0),
              color: Color(0xff212529),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* Heading
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            'MOST POPULAR',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ), //* Arrow Icon
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white54,
                          size: 25,
                        )
                      ],
                    ),
                    onHorizontalDragStart: (details) async {
                      setState(() {
                        opacity = 0;
                        topPadding = 200;
                      });

                      await Future.delayed(const Duration(milliseconds: 200),
                          () {
                        Navigator.pop(context);
                      });

                      await Future.delayed(const Duration(milliseconds: 180),
                          () {
                        throughEventsScreen = true;
                        bottomCardMargin1.value = 100;
                        bottomCardMargin2.value = 200;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          //* Event Cards
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: opacity,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.fromLTRB(30, topPadding, 30, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedWidgets(
                      child: InkWell(
                        child: FullEventCard(
                          imageLocation: 'lib/assets/event-4.jpg',
                          eventName: 'Live in Concert',
                          eventDetails: '28.07.2021 • LKR 12,000',
                          category: 'Musical',
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return ListenableProvider(
                                  create: (context) => animation,
                                  child: EventInnerScreen(),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 300),
                            ),
                          );
                        },
                      ),
                      delay: 300,
                    ),
                    SizedBox(height: 10),
                    AnimatedWidgets(
                      child: FullEventCard(
                        imageLocation: 'lib/assets/event-2.jpg',
                        eventName: 'Vipers Tournament',
                        eventDetails: '03.08.2021 • LKR 8,000',
                        category: 'Sport',
                      ),
                      delay: 300,
                    ),
                    SizedBox(height: 10),
                    AnimatedWidgets(
                      child: FullEventCard(
                        imageLocation: 'lib/assets/event-3.jpg',
                        eventName: 'DJ Night',
                        eventDetails: '12.08.2021 • LKR 6,000',
                        category: 'Musical',
                      ),
                      delay: 300,
                    ),
                    SizedBox(height: 10),
                    AnimatedWidgets(
                      child: FullEventCard(
                        imageLocation: 'lib/assets/fav-event-2.jpg',
                        eventName: 'Musical Show',
                        eventDetails: '28.07.2021 • LKR 8,000',
                        category: 'Musical',
                      ),
                      delay: 300,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
