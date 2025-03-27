import 'package:flutter/material.dart';
import 'package:meal_app/details_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/food.jpg'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Enjoy \n Your food',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 137, 107, 2),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(),
                      ));
                },
                child: const Text(
                  'clike me',
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      )),
    );
  }
}
