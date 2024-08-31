import 'package:http/http.dart' as http;

Future<String> _pingPang(String domain) async {
  http.Response? response;
  try {
    response =
        await http.get(Uri.parse(domain)).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      return domain;
    } else {
      await Future.delayed(const Duration(seconds: 6000));
      return '';
    }
  } catch (e) {
    await Future.delayed(const Duration(seconds: 6000));
    return '';
  }
}

Future<String> getFastDomain(
    List<String> domains, String characterToRemove) async {
  String domain = '';
  try {
    Iterable<Future<String>> futures = domains.map((url) => _pingPang(url));
    String firstResult = await Future.any(futures);
    if (firstResult.isNotEmpty) {
      domain = firstResult;
    }
  } catch (e) {
    return '';
  }
  return domain.replaceAll(characterToRemove, '');
}
