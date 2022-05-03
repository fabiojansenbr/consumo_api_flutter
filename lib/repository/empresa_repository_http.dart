import 'dart:convert';

import 'package:consumo_api_flutter/models/empresa_model.dart';
import 'package:http/http.dart' as http;

class EmpresaRepositoryHttp {
  Future<List<EmpresaModel>?> getEmpresas() async {
    final endpoint = 'https://6255acfc8646add390db210d.mockapi.io/empresas';

    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      print(json);

      return json.map((empresa) => EmpresaModel.fromMap(empresa)).toList();
    }

    if (response.statusCode != 200) return [];

    return null;
  }
}
