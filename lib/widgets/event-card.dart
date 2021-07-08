import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imageLocation;
  final String eventName;
  final String eventDetails;
  const EventCard({
    Key? key,
    required this.imageLocation,
    required this.eventName,
    required this.eventDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //* Favourite event image
        Container(
          width: 260,
          height: 160,
          margin: EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              this.imageLocation,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 260,
              height: 160,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black38,
                    Colors.black87,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.eventName,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    this.eventDetails,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
