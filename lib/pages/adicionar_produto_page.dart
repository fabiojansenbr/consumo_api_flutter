import 'package:consumo_api_flutter/repository/empresa_repository_http.dart';
import 'package:flutter/material.dart';

class AdicionarProdutoPage extends StatefulWidget {
  const AdicionarProdutoPage({Key? key}) : super(key: key);

  @override
  State<AdicionarProdutoPage> createState() => _AdicionarProdutoPageState();
}

class _AdicionarProdutoPageState extends State<AdicionarProdutoPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  EmpresaRepositoryHttp repository = EmpresaRepositoryHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Empresa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Nome'),
            TextFormField(
              controller: _nomeController,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Email'),
            TextFormField(
              controller: _emailController,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _enviarEmpresa(_nomeController.text, _emailController.text);
                },
                child: Container(
                  width: 100,
                  height: 30,
                  color: Colors.purple,
                  child: Center(
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _enviarEmpresa(String nome, String email) async {
    final response = await repository.enviarEmpresa(nome, email);

    // se a resposta for OK, Exibir na tela um Dialog informando que funcionou e navegar de volta para a página anterior
    // Só irá navegar para a página anterior, ao clicar no botão OK do dialog

    // se a resposta não for OK, exibir na tela um Dialog informando que não funcionou;

    // BONUS
    // Durante o processamento da requisição, exibir um indicador de LOADING

    if (response == true) {
      print('FUNCIONOU');
    } else {
      print('NAO FUNCIONOU');
    }
  }
}
