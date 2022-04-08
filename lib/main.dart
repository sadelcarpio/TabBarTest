import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Entry point de la aplicación (función main)
void main() {
  runApp(const TabBarTest());
}

// Widget que corre la aplicación (MaterialApp)
class TabBarTest extends StatelessWidget {
  const TabBarTest({Key? key}) : super(key: key);

  @override
  // método build, retorna un widget
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'TabBar Demo', home: HomePage());
  }
}

// El widget que contiene todo el HomePage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// Se define el widget del HomePage de la aplicación
// Debe ser Stateful, porque cambia de estado debido al movimiento o swipe
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late int selectedTab;

  @override
  // el método init (inicializar estado)
  void initState() {
    super.initState();
    tabController = TabController(
      // Inicializa el controlador del TabBar
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    // Detectar Swipe para hacer alguna operación
    // tabController.addListener(() {
    //   if (tabController.index != tabController.previousIndex) {
    //     setState(() {
    //       selectedTab = tabController.index; cambia la variable selectedPage por el index actual
    //     });
    //   }
    // });
  }

  @override
  // El método dispose
  void dispose() {
    // En caso se tenga una página no relacionada al TabBar, esto asegura que se desheche correctamente
    tabController.dispose();
    super.dispose();
  }

  @override
  // El método build
  Widget build(BuildContext context) {
    // Variable que da el ancho total de la pantalla
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // Appbar = Parte superior de la app
        backgroundColor: const Color(0xFF5069EB),
        title: const Text('Probando TabBar'),
      ),
      bottomNavigationBar: menu(screenWidth),
      body: TabBarView(
        // Las vistas de cada Tab
        controller: tabController,
        // Aquí irían las diferentes páginas pero solo hay un logo
        children: [
          SvgPicture.asset('assets/icons/object.svg', color: Colors.black),
          SvgPicture.asset('assets/icons/text.svg', color: Colors.black),
          SvgPicture.asset('assets/icons/money.svg', color: Colors.black),
          SvgPicture.asset('assets/icons/person.svg', color: Colors.black),
        ],
      ),
    );
  }

  // Se define un widget que tiene el estilo del TabBar propiamente dicho
  Widget menu(double screenWidth) {
    return Container(
      height: 100,
      width: screenWidth,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: Color(0xff5069EB)),
      child: IgnorePointer(
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: [
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset(
                  'assets/icons/object.svg',
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset('assets/icons/text.svg'),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset('assets/icons/money.svg'),
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: Tab(
                height: 80,
                icon: SvgPicture.asset('assets/icons/person.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
