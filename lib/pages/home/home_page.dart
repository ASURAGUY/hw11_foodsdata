import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = <dynamic>[];
  List<int> colorCodes = <int>[900,800,700,600,500,400,300,200,100];

  dynamic info;
  final List<int> price = <int>[];
  final List<String> image =  <String>[];
  final List<String> name =  <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: Text('อร่อยทุกเมนู Foods'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _handleClickButton();
                    });
                  },
                  child: const Text('ดูรายการอาหาร'),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network('${image[index]}',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                        title: Text(name[index] , style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 15)),
                        subtitle: Text('${price[index].toString()} บาท' , style: TextStyle(fontSize: 13)),

                        onTap: () {
                          SnackBar snackBar = SnackBar(
                              content: Text("Tapped : ${index + 1}")
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
  Future<dynamic> fetchAlbum()  async {
    final url = await http.get(Uri.parse('https://cpsu-test-api.herokuapp.com/foods'));
    image.clear();
    name.clear();
    price.clear();
    for(url.statusCode == 200){
      return jsonDecode(url.body);
      image.add(info['image']);
      name.add(info['name']);
      price.add(info['price']);
    }

  }
}
