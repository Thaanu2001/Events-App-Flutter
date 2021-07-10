import 'package:events_app_flutter/screens/event-purchase-screen.dart';
import 'package:events_app_flutter/widgets/detail-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool throughEventPurchaseScreen = false;

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  List<double> dateCard = [80, 600, 0, 0];
  List<double> detailsCard = [0, 700, 0, 0];
  bool animationStarted = false;
  bool animationTwoStarted = false;

  @override
  void initState() {
    super.initState();
    cardAnimation();
  }

  cardAnimation() async {
    await Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        dateCard = [0, 350, MediaQuery.of(context).size.width - 42];
        detailsCard = [MediaQuery.of(context).size.width, 450];
        animationStarted = true;
        if (throughEventPurchaseScreen) animationTwoStarted = true;
      });
    });
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        animationTwoStarted = true;
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
              height: (!animationStarted) ? 700 : 400,
              child: Image.asset(
                'lib/assets/event-4.jpg',
                fit: BoxFit.cover,
                height: 700,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: (!animationStarted) ? 1 : 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.fromLTRB(
                    30, (!animationStarted) ? 65 : 0, 30, 0),
                child: InkWell(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: (!animationStarted) ? 1 : 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.fromLTRB(
                    30, (!animationStarted) ? 120 : 0, 30, 0),
                child: Text(
                  'ARIANA GRANDE,\nLIVE IN CONCERT',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            //* Header Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: (!animationStarted) ? 0 : 100,
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
            //* Event Date Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(dateCard[0], dateCard[1], 0, 0),
              padding: EdgeInsets.fromLTRB(42, 32, 0, 0),
              decoration: BoxDecoration(
                color: Color(0xff212529),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy > 0) {
                    setState(() {
                      dateCard = [80, 600, 0, 0];
                      detailsCard = [0, 700, 0, 0];
                      animationStarted = false;
                      animationTwoStarted = false;
                    });
                    Navigator.pop(context);
                  }
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: (dateCard[2] == 0)
                        ? MediaQuery.of(context).size.width - 122
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
            ),
            //* More Details Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
              padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
              width: (detailsCard[0] == 0)
                  ? MediaQuery.of(context).size.width * 0.7
                  : detailsCard[0],
              decoration: BoxDecoration(
                color: Color(0xff4361ee),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
              child: GestureDetector(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedCrossFade(
                          firstChild: Text(
                            'More Details',
                            style: GoogleFonts.inter(
                              color: Color(0xffdee2ff),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          secondChild: Text(
                            'Event Details',
                            style: GoogleFonts.inter(
                              color: Color(0xffdee2ff),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          duration: Duration(milliseconds: 200),
                          crossFadeState: !animationStarted
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                        ),
                        SizedBox(width: 10),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: (!animationStarted) ? 1 : 0,
                          child: Icon(
                            Icons.arrow_upward_rounded,
                            color: Color(0x88dee2ff),
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: (!animationTwoStarted) ? 0 : 1,
                      child: Container(
                        padding: EdgeInsets.only(top: 10, right: 30),
                        child: Column(
                          children: [
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              style: TextStyle(
                                color: Color(0xffdee2ff),
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 20),
                            DetailCard(),
                            SizedBox(height: 20),
                            DetailCard(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                onPanUpdate: (details) {
                  if (!(details.delta.dy > 0)) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            EventPurchaseScreen(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  } else {
                    print('aa');
                    // setState(() {
                    //   dateCard = [80, 600, 0, 0];
                    //   detailsCard = [0, 700, 0, 0];
                    //   animationStarted = false;
                    //   animationTwoStarted = false;
                    // });
                  }
                },
              ),
            ),
            //* Ticket Price
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(150, 780, 0, 0),
              padding: EdgeInsets.fromLTRB(45, 40, 0, 0),
              decoration: BoxDecoration(
                color: Color(0xffdee2ff),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width - 195,
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
            ),
          ],
        ),
      ),
    );
  }
}
