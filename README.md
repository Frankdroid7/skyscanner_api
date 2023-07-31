# skyscanner_api

An unofficial sky_scanner api package that allow developers easily integrate the Sky scanner API to their Flutter app.


## 🚀 Installation
Add the **skyscanner_api** package to your pubspec.yaml file.
You can proceed to import it with this:

   ```Dart
  import 'package:skyscanner_api/skyscanner_export.dart';
```

Next, you must **initialise** your API key before calling any other available methods.
Initialise your **apiKey** like so:
```Dart
  final _scannerApi = SkyScannerApi()..initializeApiKey(apiKey: 'apiKey');
```

## Flight Live Prices API
To get current flights prices for a given route, use the `createSearchLiveFlight` that returns you: `FlightLivePricesCreateResponse` which contains the following:

`status`
Indicates status of the search request is  `running`  or  `completed`

`action`
Indicates how to treat the  `SearchResults`  contained in a  `SearchContent`. 

`Itineraries`
Bookable itinerary which corresponds with what was requested in the search. A return trip will consist of 2  `legs`, while a one-way trip will consist of 1  `leg`. An  `itinerary`  will contain a  `deepLink`  field which takes the traveler to the booking page.

`Leg`
Includes details about the flight leg from destination to origin. A leg has 1 segment if it is a direct flight, and can have multiple segments if there are multiple stopovers.

`Segment`
Shows the individual stops in a  `leg`. I.e.: if a  `leg`  has 1 stop, the  `segment`  will show details about the stopover such as the length of time and where the stopover location is.

`Places`

Shows the individual stops in a  `leg`. I.e.: if a  `leg`  has 1 stop, the  `segment`  will show details about the stopover such as the length of time and where the stopover location is.

`Carriers`
Similar to  `places`,  `carriers`  contains information about the airlines referenced in  `itineraries`.

`Agents`
Similar to  `places`,  `agents`  contains information about the OTAs referenced in  `itineraries`.

Here is a sample code to call the method:
```Dart
try {
      final entity = FlightLivePricesCreateEntity(
        query: Query(
          currency: 'NGN',
          locale: 'en-GB',
          adults: 1,
          cabinClass: 'economy',
        ),
        alternativeParam: {},
      );

      FlightLivePricesCreateResponse? response =
          await _scannerApi.createSearchLiveFlight(entity);

      print('Response: ${response?.content?.results?.places}');
    } catch (error) {
      print(error);
    }
```
