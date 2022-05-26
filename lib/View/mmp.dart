import 'dart:convert';
import 'package:dmp/Methods/post.dart';
import 'package:dmp/Services/service.dart';
import 'package:dmp/class/themeData.dart';
import 'package:flutter/material.dart';

class MMP extends StatefulWidget {
  MMP({Key? key}) : super(key: key);

  @override
  State<MMP> createState() => _MMPState();
}

class _MMPState extends State<MMP> {
  List<Post>? posts;
  var isLoaed = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    posts = await RomoteService().getposts();
    if (posts != null) {
      setState(() {
        isLoaed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: _endDrawer(),
        appBar: AppBar(
          title: Text(
            themedata.maintitle,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(
                children: [Text('$index'), Text('$isLoaed')],
              ),
            );
          },
        ),
      );
}

class _endDrawer extends StatelessWidget {
  const _endDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer();
}
