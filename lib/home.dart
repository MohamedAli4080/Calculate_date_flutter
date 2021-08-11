import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var context;
  final TextEditingController _startDate = TextEditingController();

  final TextEditingController _endDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _startDateField = _bulidDateField(context);
    Widget _emptybox = SizedBox(height: 10);
    Widget _dateOfBirthLabel = _bulidFieldlabel("Date Of Birth");
    Widget _endDateLabel = _bulidFieldlabel("End Date");
    Widget _endDateField = _bulidDateField(context);
    Widget _clearButton = _bulidClearButton();
    Widget _calcButton = _bulidCalcButton();
    Widget bulidButtonRow = _bulidButtonRow(_clearButton, _calcButton);

    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            _dateOfBirthLabel,
            _emptybox,
            _startDateField,
            _emptybox,
            _endDateLabel,
            _emptybox,
            _endDateField,
            _emptybox,
            bulidButtonRow,
          ],
        ),
      ),
    );
  }

  Row _bulidButtonRow(Widget clearButton, Widget calcButton) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        clearButton,
        calcButton,
      ],
    );
  }

  SizedBox _bulidCalcButton() {
    return SizedBox(
      height: 50,
      width: 140,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Calc",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  SizedBox _bulidClearButton() {
    return SizedBox(
      height: 50,
      width: 140,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Clear",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container _bulidFieldlabel(String title) {
    return Container(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(),
      ),
    );
  }

  Widget _bulidDateField(BuildContext context) {
    return TextField(
      controller: _startDate,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today_rounded),
      ),
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2019, 1),
          lastDate: DateTime(2021, 12),
        );
        if (selectedDate != null) {
          setState(() {
            _startDate.text = selectedDate.toString();
          });
        }
      },
    );
  }
}
