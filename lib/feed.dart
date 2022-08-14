import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  main class
*/
class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imageUrl, // 호출될 때마다 상위파일에서 받아온다 : ✅ props개념 (2)
  }) : super(key: key);

  final String imageUrl; // 이미지를 담을 변수 (1)

  @override
  State<Feed> createState() => _FeedState();
}

/*
  state class 
  언더바 클래스는 내부 파일에서만 접근 가능 : private class
*/
class _FeedState extends State<Feed> {
  /*
    state
  */
  bool isFavorite = false; // 좋아요 여부

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          widget.imageUrl, // widget.변수명으로 접근
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  color: isFavorite ? Colors.pink : Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                )),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bookmark,
                  color: Colors.black,
                ))
          ],
        ),

        // 좋아요
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "2 likes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // 설명
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "My cat is docile even when bathed. I put a duck on his head in the wick and he's staring at me. Isn't it so cute??",
          ),
        ),

        // 날짜
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "FEBURARY 6",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
