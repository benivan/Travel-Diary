import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class TripDetail extends StatefulWidget {
  const TripDetail({Key? key}) : super(key: key);

  @override
  _TripDetailState createState() => _TripDetailState();
}

class _TripDetailState extends State<TripDetail> {
  int _currentStep = 0;
  DateTime initialDate = DateTime.now();
  int days = 3;
  final DateFormat formatter = DateFormat('MMM d, yyyy');

  Map<int, List<String>> places = {
    1: ["Red Fort", "Lotus Temple", "Hawa Mahal"],
    2: ["Taj Mahal", "Varanasi"],
    3: ["Aurangabad", "India Gate", "Juhu Beach"]
  };

  final ImagePicker _picker = ImagePicker();

  List<XFile>? images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            appbar(context, "Trip detail"),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 4),
              child: Text("India",
                  style: GoogleFonts.quicksand(
                      color: Colors.blueGrey.shade900,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ),
            Stepper(
              type: StepperType.vertical,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: [for (int i = 0; i < days; i++) step(i + 1)],
              controlsBuilder: (BuildContext context,
                  {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                return Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: onStepContinue,
                      child: const Text('NEXT'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: onStepCancel,
                      child: const Text('CANCEL'),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            images != null && images!.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: images!.length,
                    itemBuilder: (context, index) =>
                        Image.file(File(images![index].path)),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8, crossAxisCount: 3),
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Photos"),
        onPressed: () {
          _pickImages();
        },
        icon: Icon(Icons.add),
      ),
    );
  }

  Step step(int index) {
    return Step(
        title: Text("Day: $index"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                index == 1
                    ? formatter.format(initialDate)
                    : formatter
                        .format(initialDate.add(Duration(days: index - 1))),
                style: GoogleFonts.quicksand(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            places[index] != null
                ? Text(
                    "Places: ",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )
                : Container(),
          ]..addAll(lists(index)),
        ));
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep < days - 1) {
      setState(() => _currentStep += 1);
    } else {}
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  List<Widget> lists(index) {
    if (places[index] != null)
      return List.generate(
          places[index]!.length,
          (x) => Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  places[index]!.elementAt(x),
                  style: GoogleFonts.quicksand(
                      color: Colors.blueGrey.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ));
    else
      return [];
  }

  _pickImages() async {
    final List<XFile>? picked = await _picker.pickMultiImage();
    setState(() {
      images = picked;
    });
  }
}

Widget appbar(BuildContext context, String title) {
  return Row(
    children: [
      IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: GoogleFonts.quicksand(fontSize: 25, fontWeight: FontWeight.w800),
      ),
    ],
  );
}
