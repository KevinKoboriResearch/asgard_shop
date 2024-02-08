import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:nasa_apod_core/nasa_apod_core.dart';

class HttpClientAdapter implements HttpClient {
  final Client client;

  HttpClientAdapter(this.client);

  @override
  Future<Either<HttpFailure, dynamic>> request(
      {required String url,
      required HttpVerbs method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? json.encode(body) : null;
    var response = Response('', 500);
    Future<Response>? futureResponse;
    try {
      if (method == HttpVerbs.post) {
        futureResponse = client.post(Uri.parse(url),
            headers: defaultHeaders, body: jsonBody);
      } else if (method == HttpVerbs.put) {
        futureResponse =
            client.put(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
      } else if (method == HttpVerbs.get) {
        futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
      } else if (method == HttpVerbs.delete) {
        futureResponse = client.delete(Uri.parse(url), headers: defaultHeaders);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } catch (_) {
      return const Left(HttpFailure.internalServerError);
    }
    return _handleResponse(response);
  }

  Either<HttpFailure, dynamic> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return Right(response.body.isEmpty ? null : response.body);
      case 201:
        return Right(response.body.isEmpty ? null : response.body);
      case 204:
        return const Right(null);
      case 400:
        return const Left(HttpFailure.badRequest);
      case 401:
        return const Left(HttpFailure.unauthorized);
      case 403:
        return const Left(HttpFailure.forbidden);
      case 404:
        return const Left(HttpFailure.notFound);
      case 500:
        return const Left(HttpFailure.internalServerError);
      default:
        return const Left(HttpFailure.internalServerError);
    }
  }
}
