import 'package:events_app_flutter/screens/event-details-screen.dart';
import 'package:events_app_flutter/widgets/animated-widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventInnerScreen extends StatefulWidget {
  const EventInnerScreen({Key? key}) : super(key: key);

  @override
  _EventInnerScreenState createState() => _EventInnerScreenState();
}

class _EventInnerScreenState extends State<EventInnerScreen> {
  List<double> dateCard = [500, 900];
  List<double> detailsCard = [0, 900];
  List<double> ticketCard = [500, 900];

  @override
  void initState() {
    super.initState();
    bottomCardAnimation();
  }

  bottomCardAnimation() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        dateCard = [80, 600];
        detailsCard = [MediaQuery.of(context).size.width * 0.7, 700];
        ticketCard = [150, 780];
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
            Hero(
              tag: 'Live in Concert',
              child: Image.asset(
                'lib/assets/event-4.jpg',
                fit: BoxFit.cover,
                height: 700,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 65, 30, 0),
              child: InkWell(
                child: AnimatedWidgets(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  delay: 200,
                ),
                onTap: () async {
                  setState(() {
                    dateCard = [500, 900];
                    detailsCard = [0, 900];
                    ticketCard = [500, 900];
                  });
                  await Future.delayed(const Duration(milliseconds: 200), () {
                    Navigator.pop(context);
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 120, 30, 0),
              child: AnimatedWidgets(
                child: Text(
                  'ARIANA GRANDE,\nLIVE IN CONCERT',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    height: 1.4,
                  ),
                ),
                delay: 200,
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
                  width: MediaQuery.of(context).size.width - 122,
                  child: GestureDetector(
                    child: SingleChildScrollView(
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
                    onPanUpdate: (details) {
                      if (!(details.delta.dy > 0)) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                EventDetailsScreen(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            //* About Event Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(0, detailsCard[1], 0, 0),
              padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
              width: detailsCard[0],
              decoration: BoxDecoration(
                color: Color(0xff4361ee),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More Details',
                      style: GoogleFonts.inter(
                        color: Color(0xffdee2ff),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_upward_rounded,
                      color: Color(0x88dee2ff),
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
            //* Price Card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(ticketCard[0], ticketCard[1], 0, 0),
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
