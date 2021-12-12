import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class editConsulta extends StatefulWidget {
  DocumentSnapshot docid;
  editConsulta({required this.docid});

  @override
  _ediConsultaState createState() => _ediConsultaState();
}

class _ediConsultaState extends State<editConsulta> {
  TextEditingController detalleConsulta = TextEditingController();

  @override
  void initState() {
    detalleConsulta =
        TextEditingController(text: widget.docid.get('detalleConsulta'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'detalleConsulta': detalleConsulta.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("delete"),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: detalleConsulta,
                decoration: InputDecoration(
                  hintText: 'detalleConsulta',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
