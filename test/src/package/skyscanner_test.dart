import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:skyscanner_api/skyscanner_export.dart';
import 'package:skyscanner_api/src/api/culture/model/currency.dart';
import 'package:skyscanner_api/src/api/culture/model/locale.dart';

import 'skyscanner_test.mocks.dart';

// Annotation which generates the SkyScannerApi class.
@GenerateNiceMocks([MockSpec<SkyScannerApi>()])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockSkyScannerApi mockScannerApi;
  String apiKey = '';
  dynamic response;

  /// set up MockSkyScannerApi
  setUpAll(() => mockScannerApi = MockSkyScannerApi());

  tearDown(() => null);

  group('When Called :- ', () {
    test('Test for SkyScannerApi Setup', () {
      // Interact with the mocked object
      mockScannerApi.initializeApiKey(apiKey: apiKey);

      /// Verify the mocked object was interacted upon atleast once
      verify(mockScannerApi.initializeApiKey(apiKey: apiKey)).called(1);

      /// Confirms the instance of the object created
      expect(mockScannerApi, isInstanceOf<SkyScannerApi>());
    });

    test('Test for getCarriers() function', () async {
      /// Trigger getCarriers() function Once
      mockScannerApi.getCarriers();

      /// Ensure getCarriers() function is called once
      verify(mockScannerApi.getCarriers()).called(1);

      /// Stub getCarriers() function is successful
      when(mockScannerApi.getCarriers()).thenAnswer((_) async =>
          Future.value(CarriersResponse(carriers: {}, status: '')));

      /// Make call to getCarriers()
      response = await mockScannerApi.getCarriers();

      /// Ensure the response from the mocked call is an instance of CarriersResponse
      expect(response, isInstanceOf<CarriersResponse>());

      /// Stub getCarriers() function is failed
      when(mockScannerApi.getCarriers()).thenAnswer((_) async => null);

      /// Make call to getCarriers()
      response = await mockScannerApi.getCarriers();

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getCarsDayView() function', () async {
      /// Trigger getCarsDayView() function Once
      await mockScannerApi.getCarsDayView();

      /// Ensure getCarsDayView() function is called once
      verify(mockScannerApi.getCarsDayView()).called(1);

      /// Stub getCarsDayView() function is successful
      when(mockScannerApi.getCarsDayView())
          .thenAnswer((_) async => Future.value(<String, dynamic>{}));

      /// Make call to getCarsDayView()
      response = await mockScannerApi.getCarsDayView();

      /// Ensure the response from the mocked call is an instance of Map<String, dynamic>
      expect(response, isInstanceOf<Map<String, dynamic>>());

      /// Stub getCarsDayView() function is failed
      when(mockScannerApi.getCarsDayView()).thenAnswer((_) async => null);

      /// Make call to getCarsDayView()
      response = await mockScannerApi.getCarsDayView();

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);

      /// Stub for when an argument is passed
      /// Ensure the named argument is accurate as well as the instance been passed is not null
      when(mockScannerApi.getCarsDayView(
              entity: argThat(isInstanceOf<ReferralEntity>(), named: 'entity')))
          .thenAnswer((_) async => Future.value(<String, dynamic>{}));

      /// Make call to getCarsDayView(entity: ReferralEntity())
      response = await mockScannerApi.getCarsDayView(entity: ReferralEntity());

      /// Ensure the response from the mocked call is an instance of Map<String, dynamic>
      expect(response, isInstanceOf<Map<String, dynamic>>());
    });

    test('Test for getFlightsDayView() function', () async {
      /// Trigger getFlightsDayView() function Once
      await mockScannerApi.getFlightsDayView();

      /// Ensure getFlightsDayView() function is called once
      verify(mockScannerApi.getFlightsDayView()).called(1);

      /// Stub getFlightsDayView() function is successful
      when(mockScannerApi.getFlightsDayView())
          .thenAnswer((_) async => Future.value(<String, dynamic>{}));

      /// Make call to getFlightsDayView()
      response = await mockScannerApi.getFlightsDayView();

      /// Ensure the response from the mocked call is an instance of Map<String, dynamic>
      expect(response, isInstanceOf<Map<String, dynamic>>());

      /// Stub getFlightsDayView() function is failed
      when(mockScannerApi.getFlightsDayView()).thenAnswer((_) async => null);

      /// Make call to getFlightsDayView()
      response = await mockScannerApi.getFlightsDayView();

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);

      /// Stub for when an argument is passed
      /// Ensure the named argument is accurate as well as the instance been passed is not null
      when(mockScannerApi.getFlightsDayView(
              entity: argThat(isInstanceOf<ReferralEntity>(), named: 'entity')))
          .thenAnswer((_) async => Future.value(<String, dynamic>{}));

      /// Make call to getFlightsDayView(entity: ReferralEntity())
      response =
          await mockScannerApi.getFlightsDayView(entity: ReferralEntity());

      /// Ensure the response from the mocked call is an instance of Map<String, dynamic>
      expect(response, isInstanceOf<Map<String, dynamic>>());
    });

    test('Test for createLiveSearchPoll() function', () async {
      /// Trigger createLiveSearchPoll() function Once
      await mockScannerApi.createLiveSearchPoll('');

      /// Ensure createLiveSearchPoll() function is called once
      verify(mockScannerApi.createLiveSearchPoll('')).called(1);

      /// Stub createLiveSearchPoll() function is successful
      when(mockScannerApi.createLiveSearchPoll('')).thenAnswer(
          (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to createLiveSearchPoll()
      FlightLivePricesCreateResponse? createLiveResponse =
          await mockScannerApi.createLiveSearchPoll('');

      /// Ensure the response from the mocked call is an instance of FlightLivePricesCreateResponse()
      expect(
          createLiveResponse, isInstanceOf<FlightLivePricesCreateResponse>());

      /// Stub createLiveSearchPoll() function is failed
      when(mockScannerApi.createLiveSearchPoll(''))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to createLiveSearchPoll()
      createLiveResponse = await mockScannerApi.createLiveSearchPoll('');

      /// Ensure the response from the mocked call failed and returned a null value
      expect(createLiveResponse, null);

      /// Stub for when an argument is passed
      /// Ensure the named argument is accurate as well as the instance been passed is not null
      when(mockScannerApi.createLiveSearchPoll('')).thenAnswer(
          (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to createLiveSearchPoll('')
      createLiveResponse = await mockScannerApi.createLiveSearchPoll('');

      /// Ensure the response from the mocked call is an instance of FlightLivePricesCreateResponse
      expect(
          createLiveResponse, isInstanceOf<FlightLivePricesCreateResponse>());
    });

    test('Test for createSearchLiveFlight() function', () async {
      /// Stub createSearchLiveFlight() function is successful
      when(mockScannerApi.createSearchLiveFlight(
              argThat(isInstanceOf<FlightLivePricesCreateEntity>())))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to createSearchLiveFlight()
      FlightLivePricesCreateResponse? createLiveResponse = await mockScannerApi
          .createSearchLiveFlight(FlightLivePricesCreateEntity());

      /// Ensure the response from the mocked call is an instance of FlightLivePricesCreateResponse()
      expect(
          createLiveResponse, isInstanceOf<FlightLivePricesCreateResponse>());

      /// Stub createSearchLiveFlight() function is failed
      when(mockScannerApi.createSearchLiveFlight(
              argThat(isInstanceOf<FlightLivePricesCreateEntity>())))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to createSearchLiveFlight()
      createLiveResponse = await mockScannerApi
          .createSearchLiveFlight(FlightLivePricesCreateEntity());

      /// Ensure the response from the mocked call failed and returned a null value
      expect(createLiveResponse, null);

      /// Stub for when an argument is passed
      /// Ensure the named argument is accurate as well as the instance been passed is not null
      when(mockScannerApi.createSearchLiveFlight(
              argThat(isInstanceOf<FlightLivePricesCreateEntity>())))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to createSearchLiveFlight(FlightLivePricesCreateEntity())
      createLiveResponse = await mockScannerApi
          .createSearchLiveFlight(FlightLivePricesCreateEntity());

      /// Ensure the response from the mocked call is an instance of FlightLivePricesCreateResponse
      expect(
          createLiveResponse, isInstanceOf<FlightLivePricesCreateResponse>());
    });

    test('Test for createItineraryRefresh() function', () async {
      /// Trigger createItineraryRefresh() function Once
      await mockScannerApi.createItineraryRefresh(
          sessionToken: '', itineraryId: '');

      /// Ensure createItineraryRefresh() function is called once
      verify(mockScannerApi.createItineraryRefresh(
              sessionToken: '', itineraryId: ''))
          .called(1);

      /// Stub createItineraryRefresh() function is successful
      when(mockScannerApi.createItineraryRefresh(
              sessionToken: '', itineraryId: ''))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to createItineraryRefresh()
      dynamic createItineraryResponse = await mockScannerApi
          .createItineraryRefresh(sessionToken: '', itineraryId: '');

      /// Ensure the response from the mocked call is a FlightLivePricesCreateResponse
      expect(createItineraryResponse,
          isInstanceOf<FlightLivePricesCreateResponse>());

      /// Stub createItineraryRefresh() function is failed
      when(mockScannerApi.createItineraryRefresh(
              sessionToken: '', itineraryId: ''))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to createItineraryRefresh()
      createItineraryResponse = await mockScannerApi.createItineraryRefresh(
          sessionToken: '', itineraryId: '');

      /// Ensure the response from the mocked call failed and returned a null value
      expect(createItineraryResponse, null);

      /// Stub for when an argument is passed
      /// Ensure the named argument is accurate as well as the instance been passed is not null
      when(mockScannerApi.createItineraryRefresh(
              sessionToken: '', itineraryId: ''))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to createItineraryRefresh('')
      createItineraryResponse = await mockScannerApi.createItineraryRefresh(
          sessionToken: '', itineraryId: '');

      /// Ensure the response from the mocked call is a FlightLivePricesCreateResponse
      expect(createItineraryResponse,
          isInstanceOf<FlightLivePricesCreateResponse>());
    });

    test('Test for pollItineraryRefresh() function', () async {
      /// Trigger pollItineraryRefresh() function Once
      await mockScannerApi.pollItineraryRefresh(refreshSessionToken: '');

      /// Ensure pollItineraryRefresh() function is called once
      verify(mockScannerApi.pollItineraryRefresh(refreshSessionToken: ''))
          .called(1);

      /// Stub pollItineraryRefresh() function is successful
      when(mockScannerApi.pollItineraryRefresh(refreshSessionToken: ''))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to pollItineraryRefresh()
      dynamic pollItineraryRefresh =
          await mockScannerApi.pollItineraryRefresh(refreshSessionToken: '');

      /// Ensure the response from the mocked call is a FlightLivePricesCreateResponse
      expect(
          pollItineraryRefresh, isInstanceOf<FlightLivePricesCreateResponse>());

      /// Stub pollItineraryRefresh() function is failed
      when(mockScannerApi.pollItineraryRefresh(refreshSessionToken: ''))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to pollItineraryRefresh()
      pollItineraryRefresh =
          await mockScannerApi.pollItineraryRefresh(refreshSessionToken: '');

      /// Ensure the response from the mocked call failed and returned a null value
      expect(pollItineraryRefresh, null);

      /// Stub for when an argument is passed
      /// Ensure the named argument is accurate as well as the instance been passed is not null
      when(mockScannerApi.pollItineraryRefresh(refreshSessionToken: ''))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to pollItineraryRefresh('')
      pollItineraryRefresh =
          await mockScannerApi.pollItineraryRefresh(refreshSessionToken: '');

      /// Ensure the response from the mocked call is FlightLivePricesCreateResponse
      expect(
          pollItineraryRefresh, isInstanceOf<FlightLivePricesCreateResponse>());
    });

    test('Test for getAutosuggestFlight() function', () async {
      /// Trigger getAutosuggestFlight() function Once
      await mockScannerApi.getAutosuggestFlight(autosuggestFlightEntity: null);

      /// Ensure getAutosuggestFlight() function is called once
      verify(mockScannerApi.getAutosuggestFlight(autosuggestFlightEntity: null))
          .called(1);

      /// Stub getAutosuggestFlight() function is successful
      when(mockScannerApi.getAutosuggestFlight(
              autosuggestFlightEntity: argThat(
                  isInstanceOf<AutosuggestFlightEntity>(),
                  named: 'autosuggestFlightEntity')))
          .thenAnswer((_) async => Future.value(AutosuggestFlightResponse()));

      /// Make call to getAutosuggestFlight()
      response = await mockScannerApi.getAutosuggestFlight(
          autosuggestFlightEntity: AutosuggestFlightEntity());

      /// Ensure the response from the mocked call is an instance of AutosuggestFlightResponse
      expect(response, isInstanceOf<AutosuggestFlightResponse>());

      /// Stub getAutosuggestFlight() function is failed
      when(mockScannerApi.getAutosuggestFlight(
              autosuggestFlightEntity: argThat(
                  isInstanceOf<AutosuggestFlightEntity>(),
                  named: 'autosuggestFlightEntity')))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getAutosuggestFlight()
      response = await mockScannerApi.getAutosuggestFlight(
          autosuggestFlightEntity: AutosuggestFlightEntity());

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getHotel() function', () async {
      /// Trigger getHotel() function Once
      await mockScannerApi.getHotel(hotelEntity: null);

      /// Ensure getHotel() function is called once
      verify(mockScannerApi.getHotel(hotelEntity: null)).called(1);

      /// Stub getHotel() function is successful
      when(mockScannerApi.getHotel(
              hotelEntity:
                  argThat(isInstanceOf<HotelEntity>(), named: 'hotelEntity')))
          .thenAnswer((_) async => Future.value(HotelResponse()));

      /// Make call to getHotel()
      response = await mockScannerApi.getHotel(hotelEntity: HotelEntity());

      /// Ensure the response from the mocked call is an instance of HotelResponse
      expect(response, isInstanceOf<HotelResponse>());

      /// Stub getHotel() function is failed
      when(mockScannerApi.getHotel(
              hotelEntity:
                  argThat(isInstanceOf<HotelEntity>(), named: 'hotelEntity')))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getHotel()
      response = await mockScannerApi.getHotel(hotelEntity: HotelEntity());

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for indicativeSearch() function', () async {
      /// Trigger indicativeSearch() function Once
      await mockScannerApi.indicativeSearch(null);

      /// Ensure indicativeSearch() function is called once
      verify(mockScannerApi.indicativeSearch(null)).called(1);

      /// Stub indicativeSearch() function is successful
      when(mockScannerApi.indicativeSearch(
              argThat(isInstanceOf<IndicativeSearchEntity>())))
          .thenAnswer(
              (_) async => Future.value(FlightLivePricesCreateResponse()));

      /// Make call to indicativeSearch()
      response = await mockScannerApi.indicativeSearch(
        IndicativeSearchEntity(
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
        ),
      );

      /// Ensure the response from the mocked call is an instance of FlightLivePricesCreateResponse
      expect(response, isInstanceOf<FlightLivePricesCreateResponse>());

      /// Stub indicativeSearch() function is failed
      when(mockScannerApi.indicativeSearch(
              argThat(isInstanceOf<IndicativeSearchEntity>())))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to indicativeSearch()
      response = await mockScannerApi.indicativeSearch(IndicativeSearchEntity(
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
      ));

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getLocales() function', () async {
      /// Trigger getLocales() function Once
      await mockScannerApi.getLocales();

      /// Ensure getLocales() function is called once
      verify(mockScannerApi.getLocales()).called(1);

      /// Stub getLocales() function is successful
      when(mockScannerApi.getLocales())
          .thenAnswer((_) async => Future.value(LocaleResponse()));

      /// Make call to getLocales()
      response = await mockScannerApi.getLocales();

      /// Ensure the response from the mocked call is an instance of LocaleResponse
      expect(response, isInstanceOf<LocaleResponse>());

      /// Stub getLocales() function is failed
      when(mockScannerApi.getLocales())
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getLocales()
      response = await mockScannerApi.getLocales();

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getCurrencies() function', () async {
      /// Trigger getCurrencies() function Once
      await mockScannerApi.getCurrencies();

      /// Ensure getCurrencies() function is called once
      verify(mockScannerApi.getCurrencies()).called(1);

      /// Stub getCurrencies() function is successful
      when(mockScannerApi.getCurrencies())
          .thenAnswer((_) async => Future.value(CurrencyResponse()));

      /// Make call to getCurrencies()
      response = await mockScannerApi.getCurrencies();

      /// Ensure the response from the mocked call is an instance of getCurrencies()
      expect(response, isInstanceOf<CurrencyResponse>());

      /// Stub getCurrencies() function is failed
      when(mockScannerApi.getCurrencies())
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getCurrencies()
      response = await mockScannerApi.getCurrencies();

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getMarkets() function', () async {
      /// Trigger getMarkets() function Once
      await mockScannerApi.getMarkets('');

      /// Ensure getMarkets() function is called once
      verify(mockScannerApi.getMarkets('')).called(1);

      /// Stub getMarkets() function is successful
      when(mockScannerApi.getMarkets(argThat(isInstanceOf<String>())))
          .thenAnswer((_) async => Future.value(MarketResponse()));

      /// Make call to getMarkets()
      response = await mockScannerApi.getMarkets('');

      /// Ensure the response from the mocked call is an instance of MarketResponse
      expect(response, isInstanceOf<MarketResponse>());

      /// Stub getMarkets() function is failed
      when(mockScannerApi.getMarkets(''))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getMarkets()
      response = await mockScannerApi.getMarkets('');

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getNearestCulture() function', () async {
      /// Trigger getNearestCulture() function Once
      await mockScannerApi.getNearestCulture('');

      /// Ensure getNearestCulture() function is called once
      verify(mockScannerApi.getNearestCulture('')).called(1);

      /// Stub getNearestCulture() function is successful
      when(mockScannerApi.getNearestCulture(argThat(isInstanceOf<String>())))
          .thenAnswer((_) async => Future.value(NearestCulture()));

      /// Make call to getNearestCulture()
      response = await mockScannerApi.getNearestCulture('');

      /// Ensure the response from the mocked call is an instance of NearestCulture
      expect(response, isInstanceOf<NearestCulture>());

      /// Stub getNearestCulture() function is failed
      when(mockScannerApi.getNearestCulture(''))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getNearestCulture()
      response = await mockScannerApi.getNearestCulture('');

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getCarHire() function', () async {
      /// Trigger getCarHire() function Once
      await mockScannerApi.getCarHire(carHireEntity: null);

      /// Ensure getCarHire() function is called once
      verify(mockScannerApi.getCarHire(carHireEntity: null)).called(1);

      /// Stub getCarHire() function is successful
      when(mockScannerApi.getCarHire(
              carHireEntity: argThat(isInstanceOf<CarHireEntity>(),
                  named: 'carHireEntity')))
          .thenAnswer((_) async => Future.value(CarHireResponse()));

      /// Make call to getCarHire()
      response =
          await mockScannerApi.getCarHire(carHireEntity: CarHireEntity());

      /// Ensure the response from the mocked call is an instance of CarHireResponse
      expect(response, isInstanceOf<CarHireResponse>());

      /// Stub getCarHire() function is failed
      when(mockScannerApi.getCarHire(carHireEntity: null))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getCarHire()
      response = await mockScannerApi.getCarHire(carHireEntity: null);

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getGeoFlights() function', () async {
      /// Trigger getGeoFlights() function Once
      await mockScannerApi.getGeoFlights(locale: 'en-GB');

      /// Ensure getGeoFlights() function is called once
      verify(mockScannerApi.getGeoFlights(locale: 'en-GB')).called(1);

      /// Stub getGeoFlights() function is successful
      when(mockScannerApi.getGeoFlights(locale: 'en-GB'))
          .thenAnswer((_) async => Future.value(GeoFlightResponse()));

      /// Make call to getGeoFlights()
      response = await mockScannerApi.getGeoFlights(locale: 'en-GB');

      /// Ensure the response from the mocked call is an instance of GeoFlightResponse
      expect(response, isInstanceOf<GeoFlightResponse>());

      /// Stub getCarHire() function is failed
      when(mockScannerApi.getGeoFlights(locale: 'en-GB'))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getGeoFlights()
      response = await mockScannerApi.getGeoFlights(locale: 'en-GB');

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });

    test('Test for getGeoNearestFlights() function', () async {
      /// Trigger getGeoNearestFlights() function Once
      await mockScannerApi.getGeoNearestFlights(nearestFlight: null);

      /// Ensure getGeoNearestFlights() function is called once
      verify(mockScannerApi.getGeoNearestFlights(nearestFlight: null))
          .called(1);

      /// Stub getGeoNearestFlights() function is successful
      when(mockScannerApi.getGeoNearestFlights(
              nearestFlight: argThat(isInstanceOf<NearestFlightEntity>(),
                  named: 'nearestFlight')))
          .thenAnswer((_) async => Future.value(GeoFlightResponse()));

      /// Make call to getGeoNearestFlights()
      response = await mockScannerApi.getGeoNearestFlights(
          nearestFlight: NearestFlightEntity());

      /// Ensure the response from the mocked call is an instance of GeoFlightResponse
      expect(response, isInstanceOf<GeoFlightResponse>());

      /// Stub getGeoNearestFlights() function is failed
      when(mockScannerApi.getGeoNearestFlights(nearestFlight: null))
          .thenAnswer((_) async => Future.value(null));

      /// Make call to getGeoNearestFlights()
      response = await mockScannerApi.getGeoNearestFlights(nearestFlight: null);

      /// Ensure the response from the mocked call failed and returned a null value
      expect(response, null);
    });
  });
}
