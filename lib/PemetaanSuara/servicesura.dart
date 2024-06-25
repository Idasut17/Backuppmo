import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mapvotersapk/page/PemetaanSuara/model/ListModel.dart';
import 'package:mapvotersapk/page/PemetaanSuara/model/modelKabupaten.dart';
import 'package:mapvotersapk/page/PemetaanSuara/model/modelKelurahan.dart';
import 'package:mapvotersapk/page/PemetaanSuara/model/modelProvinsi.dart';
import 'package:mapvotersapk/page/PemetaanSuara/model/modelkecamatan.dart';

const String BASE_URL = "https://8660-140-213-167-109.ngrok-free.app/api";

class PemetaanSuaraService {
 Future<void> showProvinsi(id) async {
    var request = http.Request('GET', Uri.parse(BASE_URL + '/pemetaanSuara-provinsi/$id'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();

      Map<String, dynamic> responseData = jsonDecode(responseString);
      List<dynamic> data = responseData['data'];
      provinsiList.clear();
      for (var element in data) {
        provinsiList
            .add(ModelProvinsi(id: element['id'], nama: element['nama'], pemilihPotensialCount: element["pemilihPotensial"]));
      }
      print(responseData['message']);
    } else {
      print(response.reasonPhrase);
    }
  }
}
  // Future<void> showKabupaten(id) async {
  //   var request = http.Request('GET', Uri.parse(BASE_URL + '/pemetaanKAB/$id'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var responseString = await response.stream.bytesToString();

  //     Map<String, dynamic> responseData = jsonDecode(responseString);
  //     List<dynamic> data = responseData['data'];
  //     kabupatenList.clear();
  //     for (var element in data) {
  //       kabupatenList
  //           .add(modelKabupaten(id: element['id'], nama: element['nama'], pemilihPotensialCount: element["pemilihPotensial"]));
  //     }
  //     print(responseData['message']);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
  
  // Future<void> ShowKelurahan(id) async {
  //   var request = http.Request('GET', Uri.parse(BASE_URL + '/pemetaanKEL/$id'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var responseString = await response.stream.bytesToString();

  //     Map<String, dynamic> responseData = jsonDecode(responseString);
  //     List<dynamic> data = responseData['data'];
  //     kelurahanList.clear();
  //     for (var element in data) {
  //       kelurahanList
  //           .add(modelKelurahan(id: element['id'], nama: element['nama'], pemilihPotensialCount: element["pemilihPotensial"]));
  //     }
  //     print(responseData['message']);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
  // Future<void> showKEcamatan(id) async {
  //   var request = http.Request('GET', Uri.parse(BASE_URL + '/pemetaanKEL/$id'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var responseString = await response.stream.bytesToString();

  //     Map<String, dynamic> responseData = jsonDecode(responseString);
  //     List<dynamic> data = responseData['data'];
  //     kecamatanList.clear();
  //     for (var element in data) {
  //       kecamatanList.add(modelKecamatan.fromJson(element));
  //     }
  //     print(responseData['message']);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
  // SearchKelurahan (String nama)async{
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',Uri.parse(BASE_URL+'/pemetaanKEL/$nama')
  //     );
  //     request.fields.addAll({'name':nama});
  //     http.StreamedResponse response = await request.send();
      
  //     if (response.statusCode == 200) {
  //       String responseBody = await response.stream.bytesToString();
  //       Map<String, dynamic> responseDecode =
  //       jsonDecode(responseBody) as Map<String, dynamic>;

  //       print(nama.toString());
  //       print(request.fields.toString());
  //       print(responseDecode.toString());
  //     } else {
  //       print('Gagal mengedit koordinator: ${response.reasonPhrase}');
  //       String responseBody = await response.stream.bytesToString();
  //       print('Response body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Terjadi kesalahan saat mengedit koordinator: $e');
  //   }
    
  // }
  // SearchKecamatan (String nama)async{
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',Uri.parse(BASE_URL+'/pemetaanKEC/$nama')
  //     );
  //     request.fields.addAll({'name':nama});
  //     http.StreamedResponse response = await request.send();
      
  //     if (response.statusCode == 200) {
  //       String responseBody = await response.stream.bytesToString();
  //       Map<String, dynamic> responseDecode =
  //       jsonDecode(responseBody) as Map<String, dynamic>;

  //       print(nama.toString());
  //       print(request.fields.toString());
  //       print(responseDecode.toString());
  //     } else {
  //       print('Gagal mengedit koordinator: ${response.reasonPhrase}');
  //       String responseBody = await response.stream.bytesToString();
  //       print('Response body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Terjadi kesalahan saat mengedit koordinator: $e');
  //   }
    
  // }
  //  SearchKabupaten (String nama)async{
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',Uri.parse(BASE_URL+'/pemetaanKAB/$nama')
  //     );
  //     request.fields.addAll({'name':nama});
  //     http.StreamedResponse response = await request.send();
      
  //     if (response.statusCode == 200) {
  //       String responseBody = await response.stream.bytesToString();
  //       Map<String, dynamic> responseDecode =
  //       jsonDecode(responseBody) as Map<String, dynamic>;

  //       print(nama.toString());
  //       print(request.fields.toString());
  //       print(responseDecode.toString());
  //     } else {
  //       print('Gagal mengedit koordinator: ${response.reasonPhrase}');
  //       String responseBody = await response.stream.bytesToString();
  //       print('Response body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Terjadi kesalahan saat mengedit koordinator: $e');
  //   }
    
  // }
  //  SearchProvinsi (String nama)async{
  //   try {
  //     var request = http.MultipartRequest(
  //       'POST',Uri.parse(BASE_URL+'/pemetaanPROV/$nama')
  //     );
  //     request.fields.addAll({'name':nama});
  //     http.StreamedResponse response = await request.send();
      
  //     if (response.statusCode == 200) {
  //       String responseBody = await response.stream.bytesToString();
  //       Map<String, dynamic> responseDecode =
  //       jsonDecode(responseBody) as Map<String, dynamic>;

  //       print(nama.toString());
  //       print(request.fields.toString());
  //       print(responseDecode.toString());
  //     } else {
  //       print('Gagal mengedit koordinator: ${response.reasonPhrase}');
  //       String responseBody = await response.stream.bytesToString();
  //       print('Response body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Terjadi kesalahan saat mengedit koordinator: $e');
  //   }
  // }
// }