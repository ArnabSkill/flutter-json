import 'package:flutter/material.dart';
import 'dart:convert'show json;
void main()=> runApp(MaterialApp(
  home: loadjson(),
));
class loadjson extends StatefulWidget {
  const loadjson({Key? key}) : super(key: key);

  @override
  State<loadjson> createState() => _loadjsonState();
}

class _loadjsonState extends State<loadjson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load local Json APP"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('load_json/crypto.json'),
            builder: (context,snapshot){
                var data=json.decode(snapshot.data.toString());
                return ListView.builder(
                    itemBuilder: (BuildContext context,int index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Name: " + data[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                            Text("Price: " + data[index]['price'].toString()),
                            Text("Symbol: " + data[index]['symbol']),
                            Text("%: " + data[index]['percent_change_1h'].toString()),
                          ],
                        ),
                      );
                    },
                  itemCount: data==null? 0:data.length,
                );
            },
          ),
        ),
      ),
    );
  }
}




