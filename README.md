
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
This indicates the status of the request.

The `status` can be any of the following:

`RESULT_STATUS_INCOMPLETE`
The search has not been yet completed.

`RESULT_STATUS_COMPLETE`
All flight data have been retrieved and polling has finished.

`RESULT_STATUS_FAILED`
An error has occurred while retrieving flight data.

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
	 originPlaceId: OriginPlaceId(entityId: '104120218'),  
	 destinationPlaceId: DestinationPlaceId(iata: 'LNH'), 
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
For both `originPlaceId` and `destinationPlaceId` you can either pass the `entityId` or `iata`. You can't pass both.

You can get the `market`, `locale` and `currency` by using the `getNearestCulture()` method and passing in the user's IP address like so:

```Dart
try {  
  final NearestCulture? response =  
      await _scannerApi.getNearestCulture('198.0.2.0');  
  
  print('Market: ${response?.market?.code}');  
  print('Locale: ${response?.localeData?.code}');  
  print('Currency: ${response?.currency?.code}');  
} catch (e) {}
```
You can get the IATA from this webpage: https://www.iata.org/en/publications/directories/code-search/
OR
You can get the `iata` or `entityId` through the `getGeoFlights()` passing in the user's `locale` like so:
```dart
final GeoFlightResponse? = await _scannerApi.getGeoFlights('en-GB');  
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
The Indicative Prices API returns a list of the cheapest prices seen last by travellers for a given search criteria. This API is exploratory in nature, meaning that it is used to get a 'feel' of the flight overall prices BUT it may not actually tell you the current price.

You can use this API by calling the `indicativeSearch()` method like so:

```Dart
try {  
  final entity = IndicativeSearchEntity(  
    query: IndicativeSearchQuery(  
      market: 'UK',  
	  locale: 'en-GB',  
	  currency: 'NGN',  
	 dateTimeGroupingType: DateTimeGroupingType.DATE_TIME_GROUPING_TYPE_BY_MONTH,
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
  
 final FlightLivePricesCreateResponse? response =  
      await _scannerApi.indicativeSearch(entity);  
  
} catch (e) {}
```
If you want to get prices of one way flight, specify just one `IndicativeSearchQueryLeg()` but if you want to get return prices as well then add two `IndicativeSearchQueryLeg()` to the queryLegs list property.

`DateTimeGroupingType` allows specifying how the response will be grouped. The default is `DateTimeGroupingType.DATE_TIME_GROUPING_TYPE_UNSPECIFIED`

Each `queryLeg`  **must only have one date type** such as: `dateRange` or `fixedDate` or `anytime`.

`DATE_TIME_GROUPING_TYPE_UNSPECIFIED`:
 The date grouping is not specified (use the default).
 
 `DATE_TIME_GROUPING_TYPE_BY_DATE`
 Group the quotes by day.
 
`DATE_TIME_GROUPING_TYPE_BY_MONTH`
 Group the quotes by month.

**Date type**

Description

`dateRange`
A range of dates to search for flights for. Will search for prices from the first to last date of each month

`fixedDate`
A specific date to search for flights for.

`anytime`
Will return best quotes for a given route.

## Autosuggest API
The Autosuggest API returns a list of places that match a specified `searchTerm`.

```Dart
try {  
  final entity = AutosuggestFlightEntity(  
    query: AutosuggestFlightQuery(
      limit: 20,  
      market: 'UK',  
	  locale: 'en-GB',  
	  isDestination: true,
	  searchTerm: 'London',    
	  includedEntityTypes: [ "PLACE_TYPE_CITY", "PLACE_TYPE_AIRPORT"],  
  ),  
  );  
  
 final AutosuggestFlightResponse? response = await _scannerApi  
  .getAutosuggestFlight(autosuggestFlightEntity: entity);  
 
} catch (e) {}
```
`isDestination`  (Optional)
Alters ranking logic of entities. Defaults to  `false`  if not sent.

`limit`  (Optional)
Limits number of entities returned in response. Take a min value of 1 and max of 50.

`searchTerm`
The string to get autosuggest results for. If left blank, the most popular flights will be returned.

`includedEntityTypes`(Optional)
Can be used to filter type of places returned. The types are:

`PLACE_TYPE_CITY`
`PLACE_TYPE_COUNTRY`
`PLACE_TYPE_AIRPORT`

### Car Hire
You can perform a search for a car rental according to your plans and needs.

```Dart
final entity = CarHireEntity(  
  query: CarHireQuery(market: 'US', locale: 'en-US', searchTerm: 'Pari'),  
);  
  
final CarHireResponse? response =  
    await _scannerApi.getCarHire(carHireEntity: entity);  
  
```
`CarHireResponse` contains these properties:

`hierarchy`
Shows hierarchy of places related to this entity. E.g. City of Edinburgh.

`location`
Coordinates of the entity. Expressed as a comma seperated latitude/longitude pair e.g. 55.9497, -3.3635.

`name`
Name of the place e.g. London.

`highlight`
Indicates emphasis on characters which match the searchTerm.

`entityId`
A unique ID for the place. It's an internal ID and it doesn't have any meaning outside of our APIs.

`type`
Type of place. e.g. PLACE_TYPE_AIRPORT, PLACE_TYPE_CITY, PLACE_TYPE_DISTRICT,   PLACE_TYPE_TRAIN_STATION.


### Hotels
You can perform a search for an hotel according to your plans and needs.

```Dart
try{  
  final entity = HotelEntity(  
    query: HotelQuery(  
      market: 'US',  
	  locale: 'en-US',  
	  searchTerm: 'Pari',  
	  ),  
   limit: 5,  
  );  
  
 final HotelResponse? response =  
  await _scannerApi.getHotel(hotelEntity: entity);  
  }catch(e){}
```

`query`
Object containing parameters for hotels autosuggest search.

`limit`  (Optional)
Limits number of entities returned in response. Take a min value of 1 and max of 50. Default is 10.



`HotelResponse` contains these properties:

`hierarchy`
Shows hierarchy of places related to this entity. E.g. City of Edinburgh.

`location`
Coordinates of the entity. Expressed as a latitude/longitude pair. E.g. 55.9497, -3.3635

`score`
Relevance score of entry based on character input.

`name`
Name of the place e.g. London

`highlight`
Indicates emphasis on characters which match the searchTerm

`entityId`
A unique ID for the place. It's an internal ID and it doesn't have any meaning outside of our APIs.

`type`
Type of place. See section below for possible values for PLACE_TYPE. E.g. PLACE_TYPE_AIRPORT, PLACE_TYPE_CITY, PLACE_TYPE_DISTRICT, PLACE_TYPE_COUNTRY, PLACE_TYPE_HOTEL, PLACE_TYPE_ISLAND, PLACE_TYPE_FIRST_LEVEL_NATION_ADMINISTRATIVE_DIVISION, PLACE_TYPE_SECOND_LEVEL_NATION_ADMINISTRATIVE_DIVISION, PLACE_TYPE_SEA_COAST, PLACE_TYPE_MOUNTAIN_RANGE, PLACE_TYPE_SEA

`pois`
A list of points of interest near the given entity.

## Carriers API

The Carriers API returns a full list of active carriers with name and IATA code indexed by their `carrierId`.
This is the same  `carrierId`  from  Flights Live Prices API reference and  Flights Indicative API .
The  `carrierId`  is in the same format e.g.  `-32677`.

```Dart
try {  
  final CarriersResponse? response = await _scannerApi.getCarriers();  
  response?.carriers.values.forEach((element) {  
    print(element.displayCode);  
  });  
} catch (e) {}
```

The `CarriersResponse` contains these properties:

`status` 
This indicates the status of the request.

`carriers`
This is a Map<String, CarriersData>.
The key here (String) refers to the `carrierID`

`CarriersData` contains the following properties:

`name`
The legal name of the carrier

`iata`
The IATA code of the carrier

`icao`
The ICAO code of the carrier

`displayCode`
The code which should be used to prefix flight numbers. This field should be used as some airlines have a preferred notation for their flight codes of using ICAO instead of IATA codes (or vice versa). E.g.: EasyJet has an IATA code of U2 but displayCode of EZY, so the resulting flight number should be EZY123.

## Geo API
The Geo API returns a list of localised geographical locations in the requested format.

You can use the `getGeoFlights()` method as discussed above to get a list of geographical locations in a language determined by the given `locale`.

```Dart
try {  
  final GeoFlightResponse? response =  
      await _scannerApi.getGeoFlights(locale: 'en-GB');  
  
  response?.places?.forEach((element) {  
    print(element.entityId);  
  });  
  } catch (e) {}
```

You can use the `` a list of geographical locations in a language determined by the given `locale` starting from the nearest airport. Results are based on a locator which is either an `ipAddress` or set of `coordinates` (you can't pass both) like so:

```Dart
try {  
  NearestFlightEntity nearestFlightEntity = NearestFlightEntity(  
    locale: 'en-GB',  
	locator: LocatorEntity(  
    coordinates: Coordinates(  
    latitude: 51.5074,  
	longitude: 0.1278,  
		  ),  
	  ),  
  );  
 final GeoFlightResponse? response = await _scannerApi  
  .getGeoNearestFlights(nearestFlight: nearestFlightEntity);  
  
  response?.places?.forEach((element) {  
    print(element.entityId);  
  });  
  } catch (e) {}
```
