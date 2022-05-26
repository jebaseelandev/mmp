import 'dart:convert';
import 'package:dmp/Methods/post.dart';
import 'package:dmp/Services/service.dart';
import 'package:dmp/class/themeData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MMP extends StatefulWidget {
  MMP({Key? key}) : super(key: key);

  @override
  State<MMP> createState() => _MMPState();
}

class _MMPState extends State<MMP> {
  List<Post> posts = [];
  List<Post> lstposts = [];
  List<Datum> lstDatum = [];
  late Post objPosts;
  var isLoaed = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    objPosts = (await RomoteService().getPost());
    //method 1:


    if (lstDatum != null) {
      setState(() {
        isLoaed = true;
        lstDatum = objPosts.data;
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
          itemCount: lstDatum.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  Column(
                    children: [
                      // Text('${posts?[index].data.asMap()}'),
                      ListTile(
                        title: Text('${lstDatum[index].vegetableName}'),
                        subtitle: Text('${lstDatum[index].retailPrice}'),
                        leading: Text('${lstDatum[index].shopingMallPrice}'),
                        trailing: Text('${lstDatum[index].id}'),
                      ),
                    ],
                  )
                ],
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
