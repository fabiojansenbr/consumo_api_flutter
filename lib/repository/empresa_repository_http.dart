import 'dart:convert';

import 'package:consumo_api_flutter/models/empresa_model.dart';
import 'package:http/http.dart' as http;

import '../helpers/not_found_exception.dart';

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

  Future<EmpresaModel?> getEmpresa(String id) async {
    final endpoint = 'https://6255acfc8646add390db210d.mockapi.io/empresas/$id';

    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      print(json);

      return EmpresaModel.fromMap(json);
    }

    if (response.statusCode != 200) throw NotFoundException();

    return null;
  }

  Future<bool> enviarEmpresa(String nome, String email) async {
    final endpoint = 'https://6255acfc8646add390db210d.mockapi.io/empresas/';

    final body = {
      "nome": nome,
      "email": email,
    };

    final response = await http.post(Uri.parse(endpoint), body: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
