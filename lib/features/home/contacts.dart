import 'package:chateo/core/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class contacts extends StatelessWidget {
  const contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [Expanded(child: Text("Contacts")), Icon(Icons.add)],
            ),
          ),
          TextfieldWidget(
            label: "Search",
            icon: Image(image: AssetImage("assets/icons/ic_search.png")),
          ),
        ],
      ),
    );
  }
}
