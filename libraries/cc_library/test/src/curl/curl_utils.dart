import 'package:cc_library/src/curl/curl_utils.dart';
import 'package:cc_library/extension/logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("curl", () async {
    "test :...".Log();
    var _curl =
        "curl --location --request POST 'https://api/TOTPs/StoreConfigGetByUser' \ --header 'Accept: application/json' \ --header 'ContextID: 3ab92bb0-92e6-11ec-8859-b72156e260b0' \ --header 'SessionID: 38ed4550-92e6-11ec-8859-b72156e260b0' \ --header 'content-type: application/json; charset=utf-8' \ --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Il9HSDZrYllkZ3RxZDdLNHNrUW1uSGI4dUh6OCIsImtpZCI6Il9HSDZrYllkZ3RxZDdLNHNrUW1uSGI4dUh6OCJ9.eyJpc3MiOiJjb25jdW5nLmNvbSIsImF1ZCI6ImNvbmN1bmcuY29tL3Jlc291cmNlcyIsImV4cCI6MTY0NjIxMTk4NSwibmJmIjoxNjQ2MjA4Mzg1LCJjbGllbnRfaWQiOiJTd2FnZ2VyLlBPU01PQklMRS5DbGllbnRDcmVkZW50aWFsIiwic2NvcGUiOiJwb3Ntb2JpbGUtYXBpLXVhdCIsInN1YiI6IjEwOTgiLCJhdXRoX3RpbWUiOjE2NDYyMDQzOTcsImlkcCI6Imlkc3J2IiwiL1VzZXJJRCI6IjEwOTgiLCIvVXNlcm5hbWUiOiIyMDk3IiwiL0F2YXRhciI6ImF2YS8yMDIxMTIvN2ZiN2UwNWQtOWRlZS00YmQ0LWI5MjgtNzBlMTQ5Y2I2OTE5LmpwZyIsIi9Vc2VyVHlwZUlEIjoiMSIsIi9TdXBwbGllcklEIjoiMCIsIi9GdWxsbmFtZSI6Ik5ndXnhu4VuIFbEg24gSOG6rXUiLCIvRGVwYXJ0bWVudElEIjoiMjI4IiwiL1Bvc2l0aW9uSUQiOiI4IiwiL1N0b3JlSUQiOiI0NDEiLCIvR2VuZGVyIjoiMSIsIi9FbXBsb3llZUlEIjoiMTA5NyIsIi9Sb2xlSURzIjoiWzMxNTMsMzE0NywzMjIwLDMyMjEsMzE5NCwzMTc5LDMzMTQsMzM4MiwzMzU1LDMzNDEsMzMyMywzMzEwLDMyOTgsMzE4NiwzMTg1LDMxODQsMzM5MiwzMTc2LDMyODFdIiwiYW1yIjpbInBhc3N3b3JkIl19.HDCzFCWuGNzzIj_Vxonh8U_8jzI0n2WrTk93zqNf-BWQSBnLvfLf5H4yB2epaKSGprKa-tGNtAyA1O6I9t6M2SQR1bb2ywIgzWchVZd-Dw57lbUSWJjL3N7o4pG1-MJTxfxVAgYIyQ4YtZzyPmHCJoeuijKlszKvptCzD0IRqO0d4li2oj9jgdmqv1wONYWCGaPsbaWjqIeR__SzR4qroLsRURa0QTWRLx27iQivQ63yuS61Z7VRPL7PNb2xsv9b6i86D29XnPMCW3n3wxI6ZRQPtOON97JmPU_VyagquSxeKbSTjq6UHqUgUvU6TBNRnGK9oZsHAhfeJBxqBfCbNA' \ --header 'UserID: 2097' \ --header 'VersionApi: 194' \ --header 'content-length: 2' \ --header 'Cookie: Srv=uat1337|Yh8oz|Yh8oz' \ --data-raw '{}'";
    var _result = await CurlUtils.instance.execute(_curl);
    _result.Log("_result:..");
  });
}
