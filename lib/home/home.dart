import 'dart:convert';

import 'package:colorment/api/api_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/color_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> colorList(context) async {
    const String apiUrl = colors;
    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Material(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                jsonDecode(response.body)['error'].toString(),
                style: TextStyle(color: Colors.white, fontFamily: 'MonM'),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
    }
    throw "Exception";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: one,
        title: Text(
          "ColorMent",
          style: TextStyle(
            color: white,
            fontFamily: "PopB",
          ),
        ),
      ),
      body: FutureBuilder(
          future: colorList(context),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: LinearProgressIndicator(
                        color: one,
                        backgroundColor: one.withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "PopM",
                    ),
                  ),
                ],
              );
            }

            // return Text(snapshot.data.toString());
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                String color = snapshot.data![index]['name'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.2), //color of shadow
                            spreadRadius: 1, //spread radius
                            blurRadius: 2, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFF)),
                  ),
                );
                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 130,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.vertical(
                //       top: Radius.circular(10),
                //       bottom: Radius.circular(10),
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color:
                //             Colors.grey.withOpacity(0.2), //color of shadow
                //         spreadRadius: 1, //spread radius
                //         blurRadius: 2, // blur radius
                //         offset: Offset(0, 2), // changes position of shadow
                //       ),
                //     ],
                //     color: Colors.white),
                //     width: MediaQuery.of(context).size.width,
                //     child: Column(
                //       children: [
                //         Container(
                //           height: 30,
                //           width: MediaQuery.of(context).size.width,
                //           decoration: BoxDecoration(
                //             color: Colors.green.shade900,
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(10),
                //             ),
                //           ),
                //           child: Center(
                //             child: Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 8.0),
                //               child: Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Expanded(
                //                     child: Text(
                //                       "No. 99999",
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.w200,
                //                         color: Colors.white,
                //                         fontFamily: "PopR",
                //                       ),
                //                     ),
                //                   ),
                //                   Text(
                //                     snapshot.data![index]['information']
                //                         .toString(),
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.w500,
                //                       color: Colors.white,
                //                       fontFamily: "PopM",
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 6,
                //         ),
                //         Expanded(
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Expanded(
                //                     child: Row(
                //                       children: [
                //                         Expanded(
                //                           child: Text(
                //                             "Type: ",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w600,
                //                               color: Colors.black,
                //                               fontFamily: "PopB",
                //                             ),
                //                           ),
                //                         ),
                //                         Text(
                //                           snapshot.data![index]['type']
                //                               .toString(),
                //                           style: TextStyle(
                //                             fontWeight: FontWeight.w300,
                //                             color: Colors.black,
                //                             fontFamily: "PopR",
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   Expanded(
                //                     child: Row(
                //                       children: [
                //                         Expanded(
                //                           child: Text(
                //                             "Amount: ",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w600,
                //                               color: Colors.black,
                //                               fontFamily: "PopB",
                //                             ),
                //                           ),
                //                         ),
                //                         Text(
                //                           "₹ " +
                //                               snapshot.data![index]['amount']
                //                                   .toString(),
                //                           style: TextStyle(
                //                             fontWeight: FontWeight.w300,
                //                             color: Colors.black,
                //                             fontFamily: "PopR",
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   Expanded(
                //                     child: Row(
                //                       children: [
                //                         Expanded(
                //                           child: Text(
                //                             "Time: ",
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w600,
                //                               color: Colors.black,
                //                               fontFamily: "PopB",
                //                             ),
                //                           ),
                //                         ),
                //                         Builder(builder: (context) {
                //                           DateTime dt = DateTime.parse(snapshot
                //                                   .data![index]['created_at']
                //                                   .toString())
                //                               .toUtc();
                //                           String dt3 = Jiffy(dt)
                //                               .format("MMMM do yyyy, hh:mm a");
                //                           return Text(
                //                             dt3,
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.w300,
                //                               color: Colors.black,
                //                               fontFamily: "PopR",
                //                             ),
                //                           );
                //                         }),
                //                       ],
                //                     ),
                //                   ),
                //                 ]),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // );
              }),
            );
          }),
    );
  }
}
