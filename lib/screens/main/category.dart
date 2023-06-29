import 'package:dblink/main.dart';

import 'core_area.dart';
import 'package:flutter/material.dart';





class Category extends StatefulWidget {

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {



@override
void initState() {
  super.initState();
  print('Category Screen Initialized');

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.redAccent,
              child: ListTile(
                title: Text('Name'),
                subtitle: Text('Hell of the Random Names'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context,  {
                    'category': 'Name'},
                  );
                },
              ),
            ),

            SizedBox(height: 10,),

            Card(
              color: Colors.greenAccent,
              child: ListTile(
                title: Text('Verb'),
                subtitle: Text('Pool of some Random Verbs'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context, {
                    'category': 'Verb'},
                  );
                },
              ),
            ),

            SizedBox(height: 10,),

            Card(
              color: Colors.blue,
              child: ListTile(
                title: Text('Noun'),
                subtitle: Text('Dozens of Random Nouns'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context, {
                    'category': 'Noun'},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}








