import 'package:automarvelsystem/Utils/commonFunction.dart';
import 'package:automarvelsystem/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ShopDescription extends StatefulWidget {
  String title;
  ShopDescription({super.key, required this.title});

  @override
  State<ShopDescription> createState() => _ShopDescriptionState();
}

class _ShopDescriptionState extends State<ShopDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIGuide.PRIMARY,
        foregroundColor: UIGuide.WHITE,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: getScreenWidth(context),
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/f3/54/39/f35439ac68d21105942e607ae35e0909.jpg'),
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight10,
                Text(
                  "Shop Name Abc..",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                kheight10,
                Text(
                  "About",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                kheight05,
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                kheight10,
                Text(
                  "Service",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(
                      '⦿ ',
                      style: TextStyle(color: UIGuide.Grey),
                    ),
                    Text(
                      "Free cost of installation",
                      style: TextStyle(color: UIGuide.Grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '⦿ ',
                      style: TextStyle(color: UIGuide.Grey),
                    ),
                    Text(
                      "Takes 4 hours",
                      style: TextStyle(color: UIGuide.Grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '⦿ ',
                      style: TextStyle(color: UIGuide.Grey),
                    ),
                    Text(
                      "Free cost of installation",
                      style: TextStyle(color: UIGuide.Grey),
                    )
                  ],
                ),
                kheight10,
                Text(
                  "📍 Near Rakus's home",
                  style: TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "⭐ ⭐ ⭐ ⭐",
                  style: TextStyle(fontSize: 12),
                ),
                kheight10,
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: UIGuide.PRIMARYLight),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.directions,
                        color: UIGuide.PRIMARY,
                      ),
                      kWidth,
                      Text(
                        "Directions",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: UIGuide.PRIMARY),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: UIGuide.PRIMARY,
                  foregroundColor: UIGuide.WHITE,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Container(
                          width: getScreenWidth(context),
                          color: Colors.white,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              kheight10,
                              Text(
                                'Select Date and Time',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              kheight10,
                              InkWell(
                                onTap: () async {
                                  _selectDate(context);
                                },
                                child: Container(
                                  height: 45,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: UIGuide.PRIMARYLight),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        _selectedDate != null
                                            ? 'Selected Date: ${DateFormat.yMMMMd().format(_selectedDate!)}'
                                            : 'Select Date',
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        color: UIGuide.PRIMARY,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              kheight10,
                              InkWell(
                                onTap: () async {
                                  final pickedTime = await _selectTime(context);
                                  if (pickedTime != null) {
                                    setState(() {
                                      _selectedTime = pickedTime;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 45,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: UIGuide.PRIMARYLight),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        _selectedTime != null
                                            ? 'Selected Time: ${_selectedTime!.format(context)}'
                                            : 'Select Time',
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.alarm_on_outlined,
                                        color: UIGuide.PRIMARY,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: UIGuide.PRIMARY,
                                    foregroundColor: UIGuide.WHITE,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
                                child: Text('Proceed'),
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Text("Enquire Now"))),
    );
  }

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    setState(() {
      _selectedDate = pickedDate ?? _selectedDate;
    });
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      return pickedTime;
    } else {
      return null;
    }
  }
}
