import 'package:flutter/material.dart';
import 'package:project_630710646/pages/Bmipage.dart';
import 'Bmrpage.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('คำนวณค่าเกี่ยวกับสุขภาพ',
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 40)),
              ),
            ],
          ),
          const Image(
            image: AssetImage('assets/images/1.jpg'),
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () { 
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const bmr())
                    );
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Text('BMR'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Bmipage())
                    );
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Text('BMI'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
