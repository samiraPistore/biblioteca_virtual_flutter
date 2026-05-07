import 'package:bibliot/components/user_infos.dart';
import 'package:bibliot/providers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});
 
  @override
  State<ConfigPage> createState() => _ConfigPageState();
}
 
class _ConfigPageState extends State<ConfigPage> {
  bool isSwitched = false;
  
  @override
  
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<AppController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              UserInfos(),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text('Notificação email'),
                
                Switch(value: isSwitched, onChanged:(value){
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                }),
               ],
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text('Notificação push'),
                Divider(),
                Switch(value: isSwitched, onChanged:(value){
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                }),
               ],
              ),
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text('Tema'),
                Divider(),
                Switch(
                  value: themeProvider.isDarkTheme,
                  onChanged: (value) {
                    //muda valor da variável mudando o tema
                    themeProvider.changeTheme();
                
                }),
               ],
              ),
              // Exemplo básico de Divider
              Divider(
                color: Colors.grey,
                thickness: 1.0, // Espessura da linha
                indent: 10,     // Recuo inicial
                endIndent: 10,  // Recuo final
              ),
              TextButton(
                onPressed: (){}, 
                child: Text('Editar perfil'),
              ),
        
            ],
          ),
        ),
      )
    );
  }
}