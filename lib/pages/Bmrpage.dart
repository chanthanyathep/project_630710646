import 'package:flutter/material.dart';

import '../models/bmrcal.dart';

class bmr extends StatefulWidget {
  const bmr({Key? key}) : super(key: key);

  @override
  _bmrState createState() => _bmrState();
}

class _bmrState extends State<bmr> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController age = TextEditingController();
  bool _validate = false;
  int initbutton1 = 0;
  int initbutton2 = 0;
  dynamic value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'BMR',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'BMR (Basal Metabolic Rate)'
            'อัตราการเผาผลาญพลังงานของร่างกายในแต่ละวัน หมายความว่า ถ้าเราคิด BMR ได้ 1,400 kcal '
            'ก็ควรทานอาหารเพื่อให้ได้พลังงาน 1,400 kcal เพื่อใช้ในการดำรงชีวิตในแต่ละวัน '
            'แต่นี่คือพลังงานที่ร่างกายต้องการ ในกรณีที่ไม่มีกิจกรรมใดๆ และแต่ละคนไม่เท่ากัน '
            'ขึ้นอยู่กับเพศ อายุ น้ำหนักและส่วนสูง',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text('น้ำหนักตัว (kg.)'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 200.0,
                              child: TextField(
                                controller: weight,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'โปรดใส่น้ำหนักตัว',
                                  errorText:
                                      _validate ? 'โปรดป้อนตัวเลข' : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text('ส่วนสูง (cm.)'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 200.0,
                              child: TextField(
                                controller: height,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'โปรดใส่ส่วนสูง',
                                  errorText:
                                      _validate ? 'โปรดป้อนตัวเลข' : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text('อายุ (ปี)'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 200.0,
                              child: TextField(
                                controller: age,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'โปรดใส่อายุ',
                                  errorText:
                                      _validate ? 'โปรดป้อนตัวเลข' : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button1(initbutton1),
                          Button2(initbutton2),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            height.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                            weight.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                            age.text.isEmpty
                                ? _validate = true
                                : _validate = false;

                            if (!_validate) {
                              double? nheight = double.tryParse(height.text);
                              double? nweight = double.tryParse(weight.text);
                              double? nage = double.tryParse(age.text);
                              if (nweight == null ||
                                  nheight == null ||
                                  nage == null) {
                                _validate = true;
                              }
                              if (nheight != null &&
                                  nweight != null &&
                                  nage != null) {
                                if (initbutton1 == 1) {
                                  value = Bmrcal()
                                      .bmrcalculate(1, nweight, nheight, nage)
                                      .toStringAsFixed(2);
                                }
                                if(initbutton2 == 1 ){
                                  value = Bmrcal()
                                      .bmrcalculate(2, nweight, nheight, nage)
                                      .toStringAsFixed(2);
                                }
                              }
                            }
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'คำนวณ',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: 150.0,
                        height: 120.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'BMR',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                value.toString(),
                                style: const TextStyle(
                                  fontSize: 30.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget Button1(int check) {
    if (check == 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              initbutton1 = 1;
              initbutton2 = 0;
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('ชาย'),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('ชาย'),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
        ),
      );
    }
  }

  Widget Button2(int check) {
    if (check == 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                initbutton2 = 1;
                initbutton1 = 0;
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('หญิง'),
            )),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('หญิง'),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
        ),
      );
    }
  }
}
