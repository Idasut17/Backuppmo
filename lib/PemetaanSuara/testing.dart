import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModelProvinsi {
  String? id;
  String? nama;
  int? pemilihPotensialCount;

  ModelProvinsi({this.id, this.nama, this.pemilihPotensialCount});

  ModelProvinsi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    pemilihPotensialCount = json['pemilih_potensial_count'];
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemetaan Suara',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModelProvinsi> provinsiList = [];
  bool isLoading = false;

  Future<void> showProvinsi(int id) async {
    const String BASE_URL = "https://680b-112-215-168-39.ngrok-free.app/api";
    final url = Uri.parse('$BASE_URL/pemetaanSuara-provinsi/$id');
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(url);

      // Print response details for debugging
      print('Response status: ${response.statusCode}');
      print('Response headers: ${response.headers}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ?? false) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final List<dynamic> data = responseData['data'];

          setState(() {
            provinsiList.clear();
            for (var element in data) {
              provinsiList.add(ModelProvinsi.fromJson(element));
            }
          });
          print(responseData['message']);
        } else {
          print('Unexpected content type: ${response.headers['content-type']}');
        }
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
      }
    } on FormatException catch (e) {
      print('Invalid JSON format: $e');
    } on http.ClientException catch (e) {
      print('HTTP error occurred: $e');
    } catch (e) {
      print('An unexpected error occurred: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemetaan Suara'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await showProvinsi(1); // Ganti 'some-id' dengan id yang sesuai
            },
            child: Text('Tampilkan Provinsi'),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.builder(
                    itemCount: provinsiList.length,
                    itemBuilder: (context, index) {
                      final provinsi = provinsiList[index];
                      return ListTile(
                        title: Text(provinsi.nama ?? 'Unknown'),
                        subtitle: Text('Pemilih Potensial: ${provinsi.pemilihPotensialCount ?? 0}'),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
