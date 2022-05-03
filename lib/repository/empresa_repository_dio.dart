import 'package:dio/dio.dart';
import 'package:consumo_api_flutter/models/empresa_model.dart';

class EmpresaRepositoryDio {
  Future<List<EmpresaModel>?> getEmpresas() async {
    final endpoint = 'https://6255acfc8646add390db210d.mockapi.io/empresas';

    final response = await Dio().get(endpoint);

    try {
      if (response.statusCode == 200) {
        print(response);

        return (response.data as List)
            .map((empresa) => EmpresaModel.fromMap(empresa))
            .toList();
      }
    } on DioError {
      if (response.statusCode != 200) return [];
    }

    return null;
  }
}
