import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/circle_image.dart';
import 'package:flutter_complete_guide/theme.dart';

class AuthCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool _isFavoried = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleImage(
            imageProvider: widget.imageProvider,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.authorName,
                style: ThemeX.lightTextTheme.headline2,
              ),
              Text(
                widget.title,
                style: ThemeX.lightTextTheme.headline3,
              )
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFavoried = !_isFavoried;
              });
            },
            icon: Icon(_isFavoried ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
          )
        ],
      ),
    );
  }
}
