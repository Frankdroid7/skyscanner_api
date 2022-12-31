import 'package:flutter/material.dart';
import 'package:skyscanner_api/skyscanner_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scannerApi = SkyScannerApi();
  String? _data = "Press Floating Button";

  @override
  void initState() {
    _scannerApi.initializeApiKey(apiKey: 'prtl6749387986743898559646983194');
    super.initState();
  }

  void _test() async {
    try {
      final response = await _scannerApi.indicativeSearch(
          IndicativeSearchEntity(
              query: MQuery(
                  currency: 'GBP',
                  locale: 'en-GB',
                  market: 'UK',
                  dateTimeGroupingType: 'DATE_TIME_GROUPING_TYPE_BY_MONTH',
                  queryLegs: [
            MQueryLeg(
                originPlace:
                    OriginPlace(queryPlace: QueryPlace(entityId: '27544008')),
                destinationPlace: DestinationPlace(
                    queryPlace: QueryPlace(entityId: '27539733')),
                dateRange: DateRange(
                    startDate: StartDate(year: 2022, month: 11),
                    endDate: EndDate(year: 2023, month: 4)))
          ])));
      _data = response?.toString() ?? '';
    } catch (e) {
      _data = e.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _data ?? '',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        tooltip: 'Test',
        child: const Icon(Icons.add),
      ),
    );
  }
}
