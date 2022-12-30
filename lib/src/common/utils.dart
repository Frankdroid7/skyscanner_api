class Utils {
  static String getApiKeyErrorMsg(String apiKey) {
    return 'Invalid $apiKey key. You must use a valid $apiKey key. Ensure that you '
        'have set a $apiKey key. Check https://developers.skyscanner.net/docs/intro for more';
  }
}
