import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system, // Pode ser ThemeMode.light ou ThemeMode.dark também
      theme: ThemeData(
        primaryColor: Colors.blue, // Cor principal do tema claro
        hintColor: Colors.teal, // Cor de destaque do tema claro
        fontFamily: 'Roboto', // Fonte padrão do tema claro
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Defina o brilho para o tema escuro
        primaryColor: Colors.indigo, // Cor de destaque do tema escuro
        fontFamily: 'Roboto', // Fonte padrão do tema escuro
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        colorScheme: ColorScheme.dark().copyWith(secondary: Colors.cyan),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Definir Alarme'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Aqui você pode definir o alarme.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
                  child: const Text('Definir Hora de Dormir'),
                  onPressed: () async {
                    // ... (código sem alterações)
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
                  child: const Text('Definir Hora de Acordar'),
                  onPressed: () async {
                    // ... (código sem alterações)
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).colorScheme.secondary),
                  child: const Text('Ir para Personalização'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Personalizacao()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ... (código posterior)

class DefinirAlarme extends StatelessWidget {
  const DefinirAlarme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definir Alarme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Aqui você pode definir o alarme.',
            ),
            ElevatedButton(
              child: const Text('Definir Hora de Dormir'),
              onPressed: () async {
                TimeOfDay? horaDormir = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (horaDormir != null) {
                  // A hora de dormir foi definida. Você pode usá-la aqui.
                  print('Hora de dormir definida para: ${horaDormir.format(context)}');
                }
              },
            ),
            ElevatedButton(
              child: const Text('Definir Hora de Acordar'),
              onPressed: () async {
                TimeOfDay? horaAcordar = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (horaAcordar != null) {
                  // A hora de acordar foi definida. Você pode usá-la aqui.
                  print('Hora de acordar definida para: ${horaAcordar.format(context)}');
                }
              },
            ),
            ElevatedButton(
              child: const Text('Ir para Personalização'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Personalizacao()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Personalizacao extends StatelessWidget {
  const Personalizacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalização'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Aqui você pode personalizar o alarme.',
            ),
            ElevatedButton(
              child: const Text('Ir para Histórico de Alarmes'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoricoAlarme()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HistoricoAlarme extends StatelessWidget {
  const HistoricoAlarme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Alarmes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Aqui você pode ver o histórico de alarmes.',
            ),
            ElevatedButton(
              child: const Text('Voltar para Definir Alarme'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
          ],
        ),
      ),
    );
  }
}
