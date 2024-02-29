import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      "IGTV",
      "Travel",
      "Architecture",
      "Decor",
      "Programing",
      "Food",
      "Art",
      "Beauty",
      "Music",
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
                fillColor: Color.fromRGBO(220, 220, 220, 1),
                filled: true,
              ),
            ),
          ),
          SliverAppBar(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  9,
                  (index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        buttons[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
