import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('À propos de CRUDité')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text(
              'CRUDité est une application démontrant le concept de CRUD (Create, Read, Update, Delete) '
              'au travers d\'une liste de crudités, comme les carottes, concombres, radis, etc.\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'CRUD:\n'
              '- Create: Ajouter de nouvelles crudités.\n'
              '- Read: Visualiser la liste et les détails de chaque crudité.\n'
              '- Update: Modifier les informations d\'une crudité existante.\n'
              '- Delete: Supprimer une crudité de la liste.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'L\'objectif de cette application est de vous familiariser avec les opérations CRUD en Flutter '
              'et Riverpod. Bon appétit avec vos crudités !',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
