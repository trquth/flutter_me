import 'package:flutter/material.dart';

class MyCard1 extends StatelessWidget {
  const MyCard1({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      padding: const EdgeInsets.all(15),
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //color: Colors.amber,
          image: DecorationImage(
              image: AssetImage('assets/fooder/mag1.png'), fit: BoxFit.cover)),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      chef,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
