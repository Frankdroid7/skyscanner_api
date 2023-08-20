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
    _scannerApi.initializeApiKey(apiKey: 'sh428739766321522266746152871799');
    super.initState();
  }

  void _test() async {
    try {
      final entity = IndicativeSearchEntity(
        query: IndicativeSearchQuery(
          market: 'UK',
          locale: 'en-GB',
          currency: 'NGN',
          dateTimeGroupingType:
              DateTimeGroupingType.DATE_TIME_GROUPING_TYPE_BY_MONTH,
          queryLegs: [
            IndicativeSearchQueryLeg(
              originPlace:
                  OriginPlace(queryPlace: QueryPlace(entityId: '29475087')),
              destinationPlace:
                  DestinationPlace(queryPlace: QueryPlace(iata: 'LHR')),
              anytime: true,
            ),
            IndicativeSearchQueryLeg(
              originPlace: OriginPlace(queryPlace: QueryPlace(iata: 'LHR')),
              destinationPlace: DestinationPlace(
                  queryPlace: QueryPlace(entityId: '29475087')),
              anytime: true,
            ),
          ],
        ),
        alternativeParam: {},
      );

      final IndicativePricesResponse response =
          await _scannerApi.indicativeSearch(entity);

      _data = response.content.result?.places.toString();
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
