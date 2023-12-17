import 'package:flutter/material.dart';
import 'package:pages_exa/pages/Login_Page.dart';
import 'package:pages_exa/pages/Table_List_Page.dart';

class HomePageApp extends StatefulWidget {
  const HomePageApp({Key? key});

  @override
  State<HomePageApp> createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start, // Ajustado para começar do topo
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 12), // Ajuste conforme necessário
                child: Image.asset(
                  'images/logo.png', // Substitua pelo caminho da sua imagem
                  width: 150, // Ajuste a largura conforme necessário
                  height: 150, // Ajuste a altura conforme necessário
                  // Ajuste conforme necessário
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20), // Ajuste conforme necessário
                    Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[900],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TableListPage()),
                          );
                        },
                        child: const Text(
                          'Logar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


