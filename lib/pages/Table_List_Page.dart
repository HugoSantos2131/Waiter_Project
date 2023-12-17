import 'package:flutter/material.dart';
import 'package:pages_exa/pages/Order_Page.dart';

class TableListPage extends StatefulWidget {
  const TableListPage({Key? key}) : super(key: key);

  @override
  State<TableListPage> createState() => _TableListPageState();
}

class _TableListPageState extends State<TableListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a cor de fundo da tela
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        // Define o título da barra superior
        title: const Text(
          'Relação de Mesas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Define a cor de fundo da barra superior
        backgroundColor: Colors.red[900],
        // Define a altura da barra superior
        toolbarHeight: 200.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          // Define o número de colunas na grade
          crossAxisCount: 3,
          children: [
            // Chama a função para construir um botão de mesa e passa o número da mesa como parâmetro
            _buildTableButton('1'),
            _buildTableButton('2'),
            _buildTableButton('3'),
            _buildTableButton('4'),
            _buildTableButton('5'),
            _buildTableButton('6'),
            _buildTableButton('7'),
            _buildTableButton('8'),
            _buildTableButton('9'),
            // Adicione mais botões conforme necessário
          ],
        ),
      ),
    );
  }

  // Função para construir um botão de mesa
  Widget _buildTableButton(String tableNumber) {
    return Center(
      child: Container(
        // Define a largura do contêiner do botão
        width: 250,
        // Define a altura do contêiner do botão
        height: 250,
        decoration: BoxDecoration(
          // Adiciona um gradiente ao contêiner
          gradient: LinearGradient(
            colors: [Colors.red[900]!, Colors.red[700]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // Adiciona bordas arredondadas ao contêiner
          borderRadius: BorderRadius.circular(20.0),
          // Adiciona sombra ao contêiner
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // Torna o botão transparente e sem sombra
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            // Adiciona bordas arredondadas ao botão
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () {
            // Ao pressionar o botão, navega para a página de lista de mesas
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrderPage()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone de mesa
              const Icon(
                Icons.table_restaurant_outlined,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 10),
              // Texto mostrando o número da mesa
              Text(
                tableNumber,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
