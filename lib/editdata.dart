import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_sekar_p4/main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;
  final int index;
  Edit({Key? key, required this.list, required this.index}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController title;
  late TextEditingController content;
  void editData() {
    var url = Uri.parse(
        'http://10.128.160.42/restfullapi/update.php'); //update api calling
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'title': title.text,
      'content': content.text
    });
  }

  @override
  void initState() {
    title = TextEditingController(
        text: widget.list[widget.index]
            ['title']); //setting up the existing values in textediting control
    content = TextEditingController(text: widget.list[widget.index]['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        flexibleSpace: Center(
          child: Text(
            '${widget.list[widget.index]['title']}',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: title,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Mebulatkan sudut
                ),
                labelText: 'Enter Title',
                hintText: 'Enter Title',
                prefixIcon: Icon(Icons.title),
                filled: true, // Mengisi bidang dengan warna latar belakang
                fillColor: Colors.white, // Warna latar belakang putih
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: content,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Enter Content',
                hintText: 'Enter Content',
                prefixIcon: Icon(Icons.text_snippet_outlined),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius:
                  BorderRadius.circular(30), // Membuat tombol berbentuk bulat
            ),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), // Atur ukuran tombol
              child: const Text(
                "Edit Data",
                style: TextStyle(color: Colors.white), // Warna teks putih
              ),
              onPressed: () {
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Home()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
