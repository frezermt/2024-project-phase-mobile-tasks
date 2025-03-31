// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isBedtimeOn = false;
//   bool isAlarmOn = false;

//   DateTime selectedDate = DateTime.now();
//   DateTime today = DateTime.now();

//   Widget CancelButton(VoidCallback onPressed) {
//     return Align(
//       alignment: Alignment.topRight,
//       child: IconButton(
//           onPressed: onPressed,
//           icon: Icon(
//             Icons.cancel,
//             color: Colors.white60,
//           )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Maya Ramon,',
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium
//                       ?.copyWith(fontSize: 15),
//                 ),
//                 Text(
//                   'Good Morning  🌞',
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium
//                       ?.copyWith(color: Colors.black),
//                 ),
//               ],
//             ),
//             Spacer(),
//             IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Fixed Stacked Cards
//             SizedBox(
//               height: 140, // Adjust height to fit both containers
//               child: Column(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.75,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.pink.shade200,
//                     ),
//                     child: CancelButton(() {}),
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent,
//                     ),
//                     child: CancelButton(() {}),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Sleep Calendar Title
//             Text(
//               'Your Sleep Calendar',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),

//             SizedBox(height: 10),

//             // Calendar Section
//             SizedBox(
//               height: 80,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   DateTime currentDate = today.add(Duration(days: index));
//                   bool isSelected = currentDate.day == selectedDate.day &&
//                       currentDate.month == selectedDate.month &&
//                       currentDate.year == selectedDate.year;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedDate = currentDate;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             DateFormat('E').format(currentDate),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyMedium
//                                 ?.copyWith(fontSize: 16),
//                           ),
//                           SizedBox(height: 5),
//                           Container(
//                             padding: EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: isSelected
//                                   ? Theme.of(context).primaryColor
//                                   : Colors.grey[300],
//                               borderRadius: BorderRadius.circular(80),
//                             ),
//                             child: Text(
//                               currentDate.day.toString(),
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             SizedBox(height: 20),

//             // Bedtime & Alarm Cards
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.bed, size: 40),
//                         Text('Bed time'),
//                         Text('7H and 28 Min'),
//                         Switch(
//                             value: isBedtimeOn,
//                             onChanged: (value) {
//                               setState(() {
//                                 isBedtimeOn = value;
//                               });
//                             }),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.alarm, size: 40),
//                         Text('Alarm'),
//                         Text('16H and 18Min'),
//                         Switch(
//                             value: isAlarmOn,
//                             onChanged: (value) {
//                               setState(() {
//                                 isAlarmOn = value;
//                               });
//                             }),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: 20),

//             // Consultation Card
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Have a problem?'),
//                         Text('Sleeping?'),
//                         SizedBox(height: 8),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text('Consult an expert'),
//                         ),
//                       ],
//                     ),
//                     Image.asset('assets/sleep.png', width: 100),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBedtimeOn = false;
  bool isAlarmOn = false;

  DateTime selectedDate = DateTime.now();
  DateTime today = DateTime.now();

  Widget CancelButton(VoidCallback onPressed) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.cancel,
            color: Colors.white60,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maya Ramon,',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 15),
                ),
                Text(
                  'Good Morning  🌞',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Fixed Stacked Cards
                SizedBox(
                  height: 140, // Adjust height to fit both containers
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink.shade200,
                        ),
                        child: CancelButton(() {}),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent,
                        ),
                        child: CancelButton(() {}),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Sleep Calendar Title
                Text(
                  'Your Sleep Calendar',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 10),

                // Calendar Section
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      DateTime currentDate = today.add(Duration(days: index));
                      bool isSelected = currentDate.day == selectedDate.day &&
                          currentDate.month == selectedDate.month &&
                          currentDate.year == selectedDate.year;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = currentDate;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat('E').format(currentDate),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: Text(
                                  currentDate.day.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),

                // Bedtime & Alarm Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.bed, size: 40),
                              Text('Bed time'),
                              Text('7H and 28 Min'),
                              Switch(
                                  value: isBedtimeOn,
                                  onChanged: (value) {
                                    setState(() {
                                      isBedtimeOn = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.alarm, size: 40),
                              Text('Alarm'),
                              Text('16H and 18Min'),
                              Switch(
                                  value: isAlarmOn,
                                  onChanged: (value) {
                                    setState(() {
                                      isAlarmOn = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Consultation Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Have a problem?'),
                            Text('Sleeping?'),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Consult an expert'),
                            ),
                          ],
                        ),
                        // Image section, ensure you have the correct image in the 'assets' folder
                        Image.asset('assets/sleep.png', width: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
