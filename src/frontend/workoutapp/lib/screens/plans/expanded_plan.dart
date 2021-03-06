import 'package:flutter/material.dart';

import '../../models/plan_class.dart';

class ExpandedPlan extends StatelessWidget {
  late final String planName;
  late final List exerciseNames;
  late final List weight;
  late final List reps;

  ExpandedPlan(Plan plan) {
    this.planName = plan.planName;
    this.exerciseNames = plan.exerciseNames;
    this.weight = plan.weight;
    this.reps = plan.reps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planName, style: TextStyle(fontSize: 25)),
      ),
      body: Container(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: buildSinglePlanDialog(context)),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildSinglePlanDialog(BuildContext context) {
    List<Widget> widget = [];
    for (int i = 0; i < exerciseNames.length; i++) {
      widget.add(Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Text(
          exerciseNames[i],
          style: TextStyle(fontSize: 20),
        ),
      ));
      widget.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: buildSingleExerciseStats(i),
              ),
            ),
          ),
        ),
      );
    }
    return widget;
  }

  List<Widget> buildSingleExerciseStats(int i) {
    List<Widget> list = [];
    list.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [Text('Set #', style: TextStyle(fontSize: 17),), Text('Lbs', style: TextStyle(fontSize: 17)), Text('Reps', style: TextStyle(fontSize: 17))],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    ));

    for (int j = 0; j < weight[i].length; j++) {
      list.add(Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text((j + 1).toString())),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(child: Text(weight[i][j].toString())),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(child: Text(reps[i][j].toString())),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ));
    }
    return list;
  }
}
