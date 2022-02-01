import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Weather Forecast',
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.red.shade500,
            elevation: 0.0,
          ),
          backgroundColor: Colors.red.shade500,
          body: _buildBody()),
    );
  }
}

Column _buildBody() {
  return Column(
    children: [
      _searchCityWidget(),
      _cityDelail(),
      _temperatureDelail(),
      _extraWeatherDetail(),
      const Text('7-DAY WEATHER FORECAST',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300)),
      _bottomDetail(),
    ],
  );
}

Widget _searchCityWidget() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.search, color: Colors.white),
        SizedBox(width: 10.0),
        Expanded(
          child: TextField(
            style: TextStyle(color: Colors.white),
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ],
    ),
  );
}

Widget _cityDelail() {
  return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Brestskaya Oblast, BY',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w300)),
          SizedBox(height: 10.0),
          Text('Tuesday, Feb 1, 2022',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300)),
        ],
      ));
}

Row _temperatureDelail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(Icons.wb_sunny, color: Colors.white, size: 80),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('14 °F',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 56,
                  fontWeight: FontWeight.w200)),
          Text('LIGHT SNOW',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300)),
        ],
      )
    ],
  );
}

Widget _extraWeatherDetail() {
  return Padding(
      padding: const EdgeInsets.only(top: 45, bottom: 47),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: const [
            Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.ac_unit, color: Colors.white, size: 30)),
            Text('5',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            Text('km/hr', style: TextStyle(color: Colors.white70, fontSize: 12))
          ],
        ),
        Column(
          children: const [
            Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.ac_unit, color: Colors.white, size: 30)),
            Text('3',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            Text('%', style: TextStyle(color: Colors.white70, fontSize: 12))
          ],
        ),
        Column(
          children: const [
            Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(Icons.ac_unit, color: Colors.white, size: 30)),
            Text('20',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            Text('%', style: TextStyle(color: Colors.white70, fontSize: 12))
          ],
        ),
      ]));
}

Widget _bottomDetail() {
  const List<String> _daysOfWeek = <String>[
    'Tuesday',
    'Wendnesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
    'Monday'
  ];
  const List<int> _tempOfDay = <int>[14, 17, 12, 8, 11, 13, 15];

  return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 16),
      child: SizedBox(
          height: 106,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _daysOfWeek.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white30),
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(_daysOfWeek[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${_tempOfDay[index]} °F',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w300)),
                            const SizedBox(width: 10),
                            const Icon(Icons.wb_sunny,
                                color: Colors.white, size: 38)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })));
}
