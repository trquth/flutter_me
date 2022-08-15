import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        constraints: const BoxConstraints.expand(height: 80),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 26,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/fooder/author_katz.jpeg"),
                    radius: 20,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mike Katz',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      'Smoothie Connoisseur',
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                },
                iconSize: 30,
                color: Colors.red[400],
                icon: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border)),
          ],
        ));
  }
}
