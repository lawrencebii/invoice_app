import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:invoice_app/Utils/Constants.dart';
import 'package:invoice_app/utils/generic_http_helpers.dart';
import 'package:invoice_app/utils/petite_storage.dart';
import 'package:invoice_app/utils/urls.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setIsLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  GenericService _service = GenericService();

  void sendStKPush(context, invoice_id) async {
    setIsLoading(true);
    var data = {
      "invoice_id": invoice_id,
      "amount": amountController.text.trim(),
      "phone_no": phoneController.text.trim(),
    };

    var res = await _service.postRequest(
        endpoint: "${basicUrl}api/send-stk-push", body: data, context: context);
    try {
      setIsLoading(false);
      print(res.toString());
      if (res['status'].toString() == '200') {
        showSnack(context,
            "You will receive an STK push to proceed with the payment intent");
      } else {
        showSnack(context, "Something went wrong");
      }
    } catch (e) {
      showSnack(context, "Failed $e");
    }
  }

  void createInvoice(context, invoice_id) async {
    setIsLoading(true);
    var data = {
      "user_id": 1,
      "total_amount": 3000,
      "due_date": "24-13-2023",
    };

    var res = await _service.postRequest(
        endpoint: "${basicUrl}api/create-invoice",
        body: data,
        context: context);
    print(res.toString());
    try {
      setIsLoading(false);
      print(res.toString());
      if (res['status'].toString() == '200') {
        showSnack(context,
            "You will receive an STK push to proceed with the payment intent");
      } else {
        showSnack(context, "Something went wrong");
      }
    } catch (e) {
      showSnack(context, "Failed $e");
    }
  }

  bool _isLoadingt = false;
  bool get isLoadingt => _isLoadingt;
  setIsLoadingt(val) {
    _isLoadingt = val;
    notifyListeners();
  }

  dynamic _transactions;
  get transactions => _transactions;
  void getTransactions(context) async {
    setIsLoadingt(true);
    var endpoint = "api/transactions";
    var res =
        await _service.getRequest(endpoint: basicUrl + endpoint, ctx: context);
    print(res);
    try {
      if (res['status'].toString() == '200') {
        _transactions = res['data']['data'];
        notifyListeners();
      }
      setIsLoadingt(false);
    } catch (e) {
      setIsLoadingt(false);

      showSnack(context, "failed to get latest transactions");
    }
    setIsLoadingt(false);
  }

  dynamic _invoices;
  get invoices => _invoices;
  void getInvoices(context) async {
    setIsLoadingt(true);
    var endpoint =
        "api/user/${jsonDecode(StorageUtil.getString(key: 'user'))['id']}/invoices/";
    var res =
        await _service.getRequest(endpoint: basicUrl + endpoint, ctx: context);
    try {
      print(res.toString());
      if (res['status'].toString() == '200') {
        _invoices = res['data']['data'];
        notifyListeners();
      }
      setIsLoadingt(false);
    } catch (e) {
      setIsLoadingt(false);

      showSnack(context, "failed to get latest transactions");
    }
    setIsLoadingt(false);
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  void prefillControllers(amount) {
    phoneController.text =
        jsonDecode(StorageUtil.getString(key: 'user'))['phone'];
    amountController.text = amount;
    notifyListeners();
  }
}
