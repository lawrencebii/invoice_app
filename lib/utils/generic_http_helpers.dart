import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:invoice_app/features/authentication/views/onboarding_screen.dart';
import 'package:invoice_app/utils/petite_storage.dart';

import '../Utils/Constants.dart';

class GenericService {
  Future<dynamic> postRequest({
    required String endpoint,
    required dynamic body,
    required BuildContext context,
  }) async {
    try {
      // logg("Encoded " + Uri.parse(endpoint).toString());
      Response response = await post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              'Bearer ${StorageUtil.getString(key: 'token')}'
        },
        body: json.encoder.convert(body),
      );

      if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const OnboardingScreen(),
            ),
            (route) => false);
      } else {
        final dynamic responseData =
            json.decode(response.body);
        print("$endpoint ==>$responseData");
        return {
          'data': responseData,
          "status": '${response.statusCode}'
        };
      }
    } catch (e) {
      return {"reason": "Error $e"};
    }
  }

  Future<dynamic> patchRequest({
    required String endpoint,
    required body,
    BuildContext? ctx,
  }) async {
    BuildContext context = ctx!;

    try {
      Response response = await patch(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${StorageUtil.getString(key: 'token')}'
        },
      );
      if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const OnboardingScreen(),
            ),
            (route) => false);
      } else {
        final Map<String, dynamic> responseData =
            json.decode(response.body);
        return {
          'status': response.statusCode,
          "data": responseData,
        };
      }
    } catch (e) {
      return {
        'status': "---",
        "reason": "Error $e",
      };
    }
  }

  Future<dynamic> putRequest({
    required String endpoint,
    required body,
    BuildContext? ctx,
  }) async {
    BuildContext context = ctx!;

    try {
      Response response = await put(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${StorageUtil.getString(key: 'token')}'
        },
        body: body == null
            ? null
            : json.encoder.convert(body),
      );
      if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const OnboardingScreen(),
            ),
            (route) => false);
      } else {
        final Map<String, dynamic> responseData =
            json.decode(response.body);
        return {
          'status': response.statusCode,
          "data": responseData,
        };
      }
    } catch (e) {
      return {
        'status': "---",
        "reason": "Error $e",
      };
    }
  }

  Future<dynamic> getRequest({
    required String endpoint,
    BuildContext? ctx,
  }) async {
    BuildContext context = ctx!;

    try {
      Response response = await get(
        Uri.parse(endpoint),
        headers: {
          'Content-Type':
              'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer ${StorageUtil.getString(key: 'token')}'
        },
      );
      if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const OnboardingScreen(),
            ),
            (route) => false);
      } else {
        final responseData = json.decode(response.body);
        return {
          'data': responseData,
          "status": response.statusCode,
        };
      }
    } catch (e) {
      return {"reason": "Error $e"};
    }
  }

  Future<dynamic> getRequestNoAuth({
    required String endpoint,
    BuildContext? ctx,
  }) async {
    BuildContext context = ctx!;

    try {
      Response response = await get(
        Uri.parse(endpoint),
        headers: {
          'Content-Type':
              'application/x-www-form-urlencoded',
          // 'Authorization': 'Bearer ${StorageUtil.getString(key: 'token')}'
        },
      );
      if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const OnboardingScreen(),
            ),
            (route) => false);
        return getRequest(endpoint: endpoint, ctx: ctx);
      } else {
        final responseData = json.decode(response.body);
        return {
          'data': responseData,
          "status": response.statusCode,
        };
      }
    } catch (e) {
      return {"reason": "Error $e"};
    }
  }

  Future<dynamic> deleteRequest({
    required String endpoint,
    BuildContext? ctx,
  }) async {
    BuildContext context = ctx!;

    try {
      Response response = await delete(
        Uri.parse(endpoint),
        headers: {
          'Content-Type':
              'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer ${StorageUtil.getString(key: 'token')}'
        },
      );
      if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  const OnboardingScreen(),
            ),
            (route) => false);
        return deleteRequest(endpoint: endpoint);
      } else {
        final responseData = json.decode(response.body);
        return {
          'data': responseData,
          "status": response.statusCode,
        };
      }
    } catch (e) {
      return {"reason": "Error $e"};
    }
  }
}
