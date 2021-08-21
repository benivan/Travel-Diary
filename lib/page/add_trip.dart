import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTrip extends StatefulWidget {
  final int days;

  const AddTrip({Key? key, required this.days}) : super(key: key);

  @override
  _AddTripState createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  int _currentStep = 0;
  DateTime initialDate = DateTime.now();

  final DateFormat formatter = DateFormat('MMM d, yyyy');

  Map<int, List<String>> places = {};

  String textField = "";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            appbar(context, "Add a trip"),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 4),
              child: Text("France",
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
              steps: [for (int i = 0; i < widget.days; i++) step(i + 1)],
            )
          ],
        ),
      ),
    );
  }

  Step step(int index) {
    return Step(
        title: Text("Day: $index"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                index == 1
                    ? IconButton(
                        onPressed: _datePickerSelected,
                        icon: Icon(Icons.date_range))
                    : Container()
              ],
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: places[index] != null
                    ? List.generate(
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
                            ))
                    : [],
              ),
            ),
            TextField(
                controller: _controller,
                style: GoogleFonts.quicksand(
                    color: Colors.grey.shade800,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 25, top: 15, bottom: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    hintText: "Place name"),
                onChanged: (str) {
                  setState(() {
                    textField = str;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              shape: StadiumBorder(),
              child: Text(
                "Add place",
                style: GoogleFonts.quicksand(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              color: Colors.blueGrey,
              textColor: Colors.white,
              onPressed: () {
                _addPlace(index);
              },
            )
          ],
        ));
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep < widget.days - 1) {
      setState(() => _currentStep += 1);
    } else {
      Navigator.of(context).pop();
    }
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void _datePickerSelected() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != initialDate)
      setState(() {
        initialDate = picked;
      });
  }

  _addPlace(int index) {
    if (places[index] != null) {
      setState(() {
        print(textField);
        places[index]!.add(textField);
      });
    } else {
      setState(() {
        places[index] = [textField];
      });
    }
    _controller.text = "";
    print("map is: " + places.toString());
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
