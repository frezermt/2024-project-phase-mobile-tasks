import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> imagesPath = [
    'assets/image2.jpg',
    'assets/drink.jpg',
    'assets/food_2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset(
                  'assets/burger.jpg',
                  fit: BoxFit.cover,
                )),
            Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Text(
                              '4.8',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$20',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 224, 203, 11)),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'Beed Burger',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Big juciy burger with cheese ,Lettuce,onions,Tomato ans special sauce!',
                      ),
                      Spacer(),
                      Text(
                        'Add Ons:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imagesPath.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Container(
                                  width: 50,
                                  child: Stack(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(imagesPath[index],
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 8,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            }),
                      ),
                      Spacer(),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Add to cart')),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
