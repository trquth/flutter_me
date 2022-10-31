import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/sections/navigation/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                RichText(
                    text: TextSpan(
                        text:
                            'This News App is inspired by the principle of free'
                            ' Journalism. You can select ',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: "GOOGLE",
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('tap');
                            })
                    ])),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return const SecondScreen();
                    //   },
                    // ));
                    //--------------------------------
                    Navigator.of(context)
                        .pushNamed(SecondScreen.routeName, arguments: {
                      'data': [
                        'https://picsum.photos/id/1/200/300',
                        'https://picsum.photos/id/10/200/300',
                        'https://picsum.photos/id/100/200/300',
                        'https://picsum.photos/id/1000/200/300'
                      ]
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(5),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://picsum.photos/200/300'),
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  //width: 300,
                  width: double.infinity,
                  child: const Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(5, 3))
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            width: 2,
                            color: Colors.red),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.black, Colors.white]))),
              ],
            ),
          ),
        ));
  }
}
