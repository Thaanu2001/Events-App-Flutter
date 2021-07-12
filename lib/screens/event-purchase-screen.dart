import 'package:events_app_flutter/screens/event-details-screen.dart';
import 'package:events_app_flutter/widgets/animated-widgets.dart';
import 'package:events_app_flutter/widgets/detail-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventPurchaseScreen extends StatefulWidget {
  const EventPurchaseScreen({Key? key}) : super(key: key);

  @override
  _EventPurchaseScreenState createState() => _EventPurchaseScreenState();
}

class _EventPurchaseScreenState extends State<EventPurchaseScreen> {
  List<double> dateCard = [0, 350, 0, 0];
  List<double> detailsCard = [0, 450, 0, 0];
  bool animationStarted = false;
  bool animationStarted2 = false;
  bool animationStarted3 = false;
  bool animationStarted4 = false;
  bool animationStarted5 = false;
  // List<double> ticketCard = [500, 900];

  @override
  void initState() {
    super.initState();
    cardAnimation();
  }

  cardAnimation() async {
    await Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        dateCard = [0, 0, MediaQuery.of(context).size.width - 42];
        detailsCard = [MediaQuery.of(context).size.width, 0, 120];
        animationStarted = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        animationStarted2 = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        animationStarted3 = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        animationStarted4 = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        animationStarted5 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width,
              height: (!animationStarted) ? 400 : 0,
              child: Image.asset(
                'lib/assets/event-4.jpg',
                fit: BoxFit.cover,
                height: 700,
              ),
            ),
            //* Event Date Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(dateCard[0], dateCard[1], 0, 0),
              padding: EdgeInsets.fromLTRB(42, 32, 0, 0),
              decoration: BoxDecoration(
                color: Color(0xff212529),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: (dateCard[2] == 0)
                      ? MediaQuery.of(context).size.width - 42
                      : dateCard[2],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              color: Color(0xff879dff),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '28.07.2021',
                            style: TextStyle(
                                color: Color(0xffdee2ff),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: TextStyle(
                              color: Color(0xff879dff),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '7.00PM',
                            style: TextStyle(
                                color: Color(0xffdee2ff),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            style: TextStyle(
                              color: Color(0xff879dff),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '11.00PM',
                            style: TextStyle(
                                color: Color(0xffdee2ff),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //* More Details Card
            GestureDetector(
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: double.infinity,
                    margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
                    padding: EdgeInsets.fromLTRB(
                        40, (detailsCard[2] == 0) ? 30 : detailsCard[2], 0, 0),
                    width: (detailsCard[0] == 0)
                        ? MediaQuery.of(context).size.width
                        : detailsCard[0],
                    decoration: BoxDecoration(
                      color: Color(0xff4361ee),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  // child: ListView(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   padding: EdgeInsets.zero,
                  //   children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                        left: 30, top: (animationStarted2) ? 118 : 480),
                    child: Text(
                      'Event Details',
                      style: GoogleFonts.inter(
                        color: Color(0xffdee2ff),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 30),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                              left: 30, top: (animationStarted2) ? 140 : 505),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(
                              color: Color(0xffdee2ff),
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        // SizedBox(height: 20),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                              left: 30, top: (animationStarted3) ? 320 : 678),
                          child: DetailCard(),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(
                              left: 30, top: (animationStarted4) ? 460 : 818),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              DetailCard(),
                            ],
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: (animationStarted5) ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            padding: EdgeInsets.only(
                                left: 30, top: (animationStarted5) ? 600 : 958),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                DetailCard(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              onPanUpdate: (details) {
                if (details.delta.dy > 0) {
                  setState(() {
                    animationStarted = false;
                    animationStarted2 = false;
                    animationStarted3 = false;
                    animationStarted4 = false;
                    animationStarted5 = false;
                    dateCard = [0, 350, 0, 0];
                    detailsCard = [0, 450, 0, 0];
                    Navigator.pop(context);
                  });
                }
              },
            ),
            //* Ticket Price
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(
                  (!animationStarted5) ? 150 : 40,
                  (!animationStarted5) ? 780 : 760,
                  (!animationStarted5) ? 0 : 30,
                  (!animationStarted5) ? 0 : 70),
              padding: EdgeInsets.fromLTRB((!animationStarted5) ? 45 : 0,
                  (!animationStarted5) ? 40 : 0, 0, 0),
              decoration: BoxDecoration(
                color: Color(0xffdee2ff),
                borderRadius: (!animationStarted5)
                    ? BorderRadius.only(topLeft: Radius.circular(50))
                    : BorderRadius.circular(50),
              ),
              child: AnimatedAlign(
                duration: Duration(milliseconds: 200),
                alignment:
                    (!animationStarted5) ? Alignment.topLeft : Alignment.center,
                child: Text(
                  'BUY • LKR 12,000',
                  style: GoogleFonts.inter(
                    color: Color(0xff3f37c9),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            //* Header Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 100,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: EdgeInsets.fromLTRB(30, 55, 0, 0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffdee2ff),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xaa3f37c9),
                        size: 20,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'ARIANA GRANDE - LIVE IN CONCERT',
                      style: GoogleFonts.inter(
                        color: Color(0xff3f37c9),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
