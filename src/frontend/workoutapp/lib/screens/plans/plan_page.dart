import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:view/models/plan_class.dart';
import 'package:view/screens/plans/single_plan.dart';
import 'package:http/http.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Plans", style: TextStyle(fontSize: 25)),
      ),
      body: FutureBuilder(
          initialData: [],
          future: getJsonData(),
          builder: (context, snapshot) {
            List reversedPlans = [];
            reversedPlans = snapshot.data as List;
            List plans = List.from(reversedPlans.reversed);
            if (snapshot.hasData) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: plans.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SinglePlan(plans[index]),
                  );
                },
              );
            } else {
              return Center(child: Text("Error"));
            }
          }),
    );
  }

  Future<List> getJsonData() async {
    var jsonData = await get(Uri.parse("https://flask-backend.dannyaam9.repl.co/plans"));
    final list = json.decode(jsonData.body);
    return list['data'].map((e) => Plan.fromJson(e)).toList();
  }
}
