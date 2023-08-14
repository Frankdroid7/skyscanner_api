
# skyscanner_api

An unofficial sky_scanner api package that allow developers easily integrate the Sky scanner API to their Flutter app.


## 🚀 Installation
Add the **skyscanner_api** package to your pubspec.yaml file.
You can proceed to import it with this:

   ```Dart
  import 'package:skyscanner_api/skyscanner_export.dart';
```

Next, you must **initialise** your API key before calling any other available methods.
You can get a Skyscanner API key from here: https://developers.skyscanner.net/docs/getting-started/authentication

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

`sessionToken`
Token that would be passed to the `createLiveSearchPoll(token)` method to get more flights results.

`content`
Content contains additional search information like `Results`, `Stats`, `SortingOptions`

`**Results**` contain the following:

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

`Alliances`
List of alliance names.

Here is a sample code to call the method:
```Dart
try {  
  final entity = FlightLivePricesCreateEntity(  
    query: Query(  
      adults: 1,  
	  market: 'UK',  
	  locale: 'en-GB',  
	  currency: 'NGN',  
	  cabinClass: CabinClass.CABIN_CLASS_FIRST,
	  queryLegs: [  
        QueryLeg(  
          date: SkyScannerDate(  
            year: 2023,  
			month: 08,  
			day: 23,  
	      ),  
	  originPlaceId: OriginPlaceId(iataOrEntityId: 'LHR'),  
	  destinationPlaceId: DestinationPlaceId(iataOrEntityId: 'EDI'),  
	  )  
    ],  
  ),  
  alternativeParam: {},  
  );  
  
 final FlightLivePricesCreateResponse? response = await _scannerApi.createSearchLiveFlight(entity);  
 print(response);  
} catch (e) {  
   print(e.toString());
}
 
```

You can get the `market`, `locale` and `currency` by using the `getNearestCulture()` method and passing in the user's IP address like so:

```Dart
final NearestCulture = await _scannerApi.getNearestCulture('198.0.2.0');

print('Market: ${response?.market?.code}');  
print('Locale: ${response?.locale?.code}');  
print('Currency: ${response?.currency?.code}');
```
You can get the IATA from this webpage: https://www.iata.org/en/publications/directories/code-search/
OR
You can get the `iataOrEntityId` through the `getGeoFlights()` passing in the user's `locale` like so:
```dart
final response = await _scannerApi.getGeoFlights('en-GB');  
print(response?.places?.first.iata);
print(response?.places?.first.entityId);
```
Use the `alternativeParam` parameter to send request body fields  
that is not included in the query model.

## Poll
**Poll** is used to retrieve the complete list of the search results like so:

```Dart
final FlightLivePricesCreateResponse? response = await _scannerApi.createLiveSearchPoll(sessionToken);
```
This returns the same `FlightLivePricesCreateResponse` model as in the case when calling the `createSearchLiveFlight` method.

## Refresh Prices
Sometimes you would need to refresh the prices to get the latest prices as prices is sometimes cached and a returned price might not be the same price in the next 10 minutes.
You can invoke this refresh by calling the `createItineraryRefresh()`method and passing in the `sessionToken` and `itineraryId` like so:
```Dart
final FlightLivePricesCreateResponse? response = await _scannerApi.createItineraryRefresh(sessionToken: sessionToken, itineraryId: itineraryId);
```
Remember, `sessionToken` is returned from the `createSearchLiveFlight()` method and the `itineraryId` is gotten from the `Content->Results->Itineraries` class returned from the same method.

Additionally, use the `pollItineraryRefresh()` method to get more data on the itinerary refresh like so:
```Dart
final FlightLivePricesCreateResponse? response =  
    await _scannerApi.pollItineraryRefresh(refreshSessionToken: refreshSessionToken);
```
The `refreshSessionToken` is gotten from the  `createItineraryRefresh()` method.

## Flight Indicative Prices API
The Indicative Prices API returns a list of the cheapest prices seen last by travellers for a given search criteria.
