import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});
 
  @override
  State<ConfigPage> createState() => _ConfigPageState();
}
 
class _ConfigPageState extends State<ConfigPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              
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
                Switch(value: isSwitched, onChanged:(value){
                  setState(() {
                    isSwitched = !isSwitched;
                  });
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