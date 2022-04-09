import 'package:flutter/material.dart';

import '../models/bmical.dart';

class Bmipage extends StatefulWidget {
  const Bmipage({Key? key}) : super(key: key);

  @override
  State<Bmipage> createState() => _BmiState();
}

class _BmiState extends State<Bmipage> {
  dynamic value = 0;
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'เครื่องคำนวณหาค่าดัชนีมวลกาย (BMI)',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'น้ำหนักตัว (kg.)',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: weight,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'โปรดใส่น้ำหนักตัว',
                            errorText: _validate ? 'โปรดป้อนตัวเลข' : null,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'ส่วนสูง (cm.)',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: height,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'โปรดใส่ส่วนสูง',
                            errorText: _validate ? 'โปรดป้อนตัวเลข' : null,
                          ),
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

                              if (!_validate) {
                                double? nheight = double.tryParse(height.text);
                                double? nweight = double.tryParse(weight.text);
                                if(nweight == null || nheight == null){
                                  _validate = true;
                                }
                                if(nheight != null && nweight != null) {
                                  value = bmi()
                                      .calculate(nheight, nweight)
                                      .toStringAsFixed(2);
                                }
                              }
                            });
                          },
                          child: const Text(
                            'คำนวณ',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: 200.0,
                          height: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'BMI',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 50.0,
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('ค่า'),
                                    Text('น้อยกว่า 18.50 - 22.90'),
                                    Text('ระหว่าง 18.50 - 22.90'),
                                    Text('ระหว่าง 23 - 24.90'),
                                    Text('ระหว่าง 25 - 29.90'),
                                    Text('มากกว่า 30'),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2.0,
                                )
                              ),
                            ),
                            const Padding(padding:  EdgeInsets.symmetric(
                              horizontal: 2.0,
                            )),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('อยู่ในเกณฑ์'),
                                    Text('น้ำหนักน้อย / ผอม'),
                                    Text('ปกติ(สุขภาพดี)'),
                                    Text('ท้วม/โรคอ้วนระดับ 1'),
                                    Text('อ้วน/โรคอ้วนระดับ 2'),
                                    Text('อ้วนมาก/โรคอ้วนระดับ 3'),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                  )
                              ),
                            ),
                            const Padding(padding:  EdgeInsets.symmetric(
                              horizontal: 2.0,
                            )),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('ภาวะเสี่ยงต่อโรค'),
                                    Text('มากกว่าคนปกติ'),
                                    Text('เท่าคนปกติ'),
                                    Text('อันตรายระดับ1'),
                                    Text('อันตรายระดับ2'),
                                    Text('อันตรายระดับ3'),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.blue.shade50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
