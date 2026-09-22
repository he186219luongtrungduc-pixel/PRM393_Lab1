import 'package:flutter/material.dart';



// EXERCISE 1


class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 1 - Core Widgets'),
      ),
      body: Column(
        children: [
          Text('Welcome to Flutter UI'),

          Icon(Icons.movie),

          Image.network(
            'https://media.istockphoto.com/id/515278244/photo/aerial-view-above-the-expressway-and-ring-road.jpg?s=170667a&w=0&k=20&c=vofCmYvO-Kold1_-zYT9I4KxeUWaMHoaJq2ht_hr4pE=',
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text('Movie Item'),
              subtitle: Text('This is a movie'),
            ),
          ),
        ],
      ),
    );
  }
}



// EXERCISE 2


class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});
@override
  State<Exercise2> createState() => _Exercise2State();
}
 class _Exercise2State extends State<Exercise2> {
  double sliderValue =50;
  bool switchValue = false;
  String? selectedOption;
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100),
    );
    if(date != null){
      setState((){
        selectedDate = date;
      });
    }
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise 2 - Layouts'),
      ),
      body: Column(
        children: [
         Slider(
           value: sliderValue,
           min :0,
           max : 100,
           onChanged: (value){
             setState(() {
               sliderValue = value;
             });
           },
         ),
          Text('Value : ${sliderValue.toInt()}'),
          Text('Switch'),
          Switch(
            value: switchValue,
            onChanged: (value){
              setState(() {
                switchValue = value;
              });
            },
          ),
          Text(switchValue ? 'ON' : 'OFF'),

          Text('Radio'),

          RadioListTile<String>(
            title: Text('Action'),
            value: 'Action',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),

          RadioListTile<String>(
            title: Text('Comedy'),
            value: 'Comedy',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),

          Text(
            'Selected: ${selectedOption ?? 'None'}',
          ),

          ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Text('Pick Date'),
          ),

          Text(
            selectedDate == null
                ? 'No date selected'
                : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
          ),
        ],
      ),
    );
  }
 }
