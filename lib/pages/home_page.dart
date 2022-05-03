import 'package:consumo_api_flutter/models/empresa_model.dart';
import 'package:consumo_api_flutter/repository/empresa_repository_http.dart';
import 'package:flutter/material.dart';

import '../repository/empresa_repository_dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final empresaRepositoryHttp = EmpresaRepositoryHttp();
  final empresaRepositoryDio = EmpresaRepositoryDio();

  @override
  void initState() {
    super.initState();

    // getEmpresasHttp();
    // getEmpresasDio();
  }

  getEmpresasHttp() async {
    await empresaRepositoryHttp.getEmpresas();
  }

  getEmpresasDio() async {
    await empresaRepositoryDio.getEmpresas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empresas'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: empresaRepositoryHttp.getEmpresas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('Sem dados a exibir'),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final EmpresaModel empresa = snapshot.data[index];

                return ListTile(
                  title: Text(empresa.nome),
                  subtitle: Text(empresa.email),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
