import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "images/1.jpeg",
    "images/2.jpeg",
    "images/3.jpeg",
    "images/4.jpeg",
    "images/5.jpeg",
    "images/6.jpeg",
    "images/7.jpeg",
    "images/8.jpeg",
  ];

  List<String> profileNames = [
    "Manda",
    "Julia",
    "Reza",
    "Miki",
    "Aril",
    "H. Usman",
    "Kiki",
    "Iqbal"
  ];

  List<String> posts = [
    "images/post_1.jpg",
    "images/post_9.jpg",
    "images/post_3.jpg",
    "images/post_4.jpg",
    "images/post_5.jpg",
    "images/post_6.jpg",
    "images/post_7.jpg",
    "images/post_8.jpg",
  ];

  int onLike = 0;

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/instagram_title.png',
          height: 50,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
            child: Column(
          children: [
            // Story
            Scroling_Top(),
            Divider(height: 1),
            Content_List()
          ],
        )),
      ),
    );
  }

  Column Content_List() {
    return Column(
            children: List.generate(
                8,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Post
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundImage:
                                    AssetImage("images/story.jpg"),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage(profileImages[index]),
                                ),
                              ),
                            ),
                            Text(profileNames[index]),
                            Spacer(),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.more_vert))
                          ],
                        ),
                        // Image Post
                        Image.asset(
                          posts[index],
                        ),
                        // * Image footer post
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  onLike += 1;
                                });
                              },
                              icon: onLike % 2 == 0
                                  ? Icon(Icons.favorite_border)
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chat_bubble_outline)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.label_outline)),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark_border)),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: "Like by "),
                                    TextSpan(
                                      text: profileNames[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: " and"),
                                    TextSpan(
                                      text: " others",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '${profileNames[index]} ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: loremIpsum(
                                          paragraphs: 1, words: 30),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "View all 12 comment",
                                style: TextStyle(color: Colors.black38),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
          );
  }

  SingleChildScrollView Scroling_Top() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  8,
                  (index) => Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage("images/story.jpg"),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(profileImages[index]),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              profileNames[index],
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black87),
                            )
                          ],
                        ),
                      )),
            ),
          );
  }
}
