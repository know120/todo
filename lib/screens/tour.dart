import 'package:flutter/material.dart';
import 'package:todo/widgets/map.dart';

class TourPlanner extends StatefulWidget {
  const TourPlanner({super.key});

  @override
  State<TourPlanner> createState() => _TourPlannerState();
}

class _TourPlannerState extends State<TourPlanner> {
  List<String> places = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (content, index) {
          return Text(places[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showMap(),
        child: const Icon(Icons.map_rounded),
      ),
    );
  }

  Future<void> showMap() async {
    var _ = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const MapWidget();
        });
  }
}
