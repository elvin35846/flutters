import 'package:flutter/material.dart';

class FormParagraph extends StatefulWidget {
  @override
  _FormParagraphState createState() => _FormParagraphState();
}

class _FormParagraphState extends State<FormParagraph> {
  String inputvalue = '';
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: "Default");
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Input tutorial")),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                //keyboardType: TextInputType.number,
                controller: textController,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                maxLength: 20,
                onChanged: (String s) => inputvalue = s,
                onSubmitted: (String s) {
                  debugPrint(s);
                  setState(() {
                    inputvalue = s;
                  });
                },
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Input name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  //icon: Icon(Icons.account_circle_outlined),
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                ),
              ),
            ),
            Container(
              color: Colors.teal.shade400,
              margin: EdgeInsets.all(16),
              width: double.infinity,
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: Text(inputvalue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
