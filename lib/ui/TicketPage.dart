import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ticket Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Container(
              height: 150,
              color: Colors.black,
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15.0,
                left: 15.0,
                top: 30.0,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Align(
                            child: OutlineButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
                              textColor: Colors.black,
                              child: Text(
                                'Code of Ticket',
                                style: TextStyle(fontSize: 12),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                              onPressed: () {},
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            width: double.infinity,
                            child: Text("Her",
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Quicksand"),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Places",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "2 Adults",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                            Text(
                              "12 Feb,2020",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Salle",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                            Text(
                              "Cenima",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "2",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                            Text(
                              "MEGA",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Class",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                            Text(
                              'Seat',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "VIP",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                            Text(
                              "21 XYB",
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Quicksand"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          width: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Colors.grey[200]),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Flex(
                                  children: List.generate(
                                      (constraints.constrainWidth() / 10)
                                          .floor(),
                                      (index) => SizedBox(
                                            height: 1,
                                            width: 5,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400),
                                            ),
                                          )),
                                  direction: Axis.horizontal,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: Colors.grey[200]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/barcode.gif',
                          height: 80.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        overflow: Overflow.clip,
      ),
      backgroundColor: Colors.grey[200],

    );
  }
}
