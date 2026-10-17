import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppSeccionB());
}

class MiAppSeccionB extends StatelessWidget {
  const MiAppSeccionB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sección B - Productos',
      debugShowCheckedModeBanner: false,

      // =======================================================================
      // VISTO EN CLASE: TEMA GLOBAL (ThemeData)
      // =======================================================================
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF1976D2),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1976D2),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        // Configuración global para las Cards
        cardTheme: CardThemeData(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      // =======================================================================
      // VISTO EN CLASE: RUTAS (routes & initialRoute)
      // =======================================================================
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
        '/productos': (context) => const ListarProductosScreen(),
        '/registrar-producto': (context) => const RegistrarProductoScreen(),
        '/perfil': (context) => const PerfilScreen(),
      },
    );
  }
}

// =============================================================================
// 1. PANTALLA DE LOGIN
// =============================================================================
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // [NO VISTO EN CLASE]: Variable de estado para la visibilidad del password
  bool _ocultarPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( // [NO VISTO EN CLASE]: Evita error de teclado
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icono del logo (Bolsa de compras de la Sección B)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Ingresa tus credenciales para continuar',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // [NO VISTO EN CLASE]: TextField para captura de texto
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: _ocultarPassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_ocultarPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          _ocultarPassword = !_ocultarPassword;
                        });
                      },
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(height: 24),

                // Botón Login que utiliza la navegación por RUTAS
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // VISTO EN CLASE: Navegación por ruta
                      Navigator.pushReplacementNamed(context, '/menu');
                    },
                    child: const Text('LOGIN', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// 2. PANTALLA DE MENÚ
// =============================================================================
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // ===========================================================================
  // VISTO EN CLASE: LISTAS Y MAPAS (List<Map<String, dynamic>>)
  // ===========================================================================
  final List<Map<String, dynamic>> opcionesMenu = const [
    {
      'titulo': 'Registrar Productos',
      'icono': Icons.add_shopping_cart,
      'ruta': '/registrar-producto',
    },
    {
      'titulo': 'Listar Productos',
      'icono': Icons.format_list_bulleted,
      'ruta': '/productos',
    },
    {
      'titulo': 'Perfil',
      'icono': Icons.person_outline,
      'ruta': '/perfil',
    },
    {
      'titulo': 'Logout',
      'icono': Icons.exit_to_app,
      'ruta': '/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        leading: const Icon(Icons.menu),
      ),
      // =======================================================================
      // VISTO EN CLASE: LISTVIEW
      // =======================================================================
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: opcionesMenu.length,
        itemBuilder: (context, index) {
          final item = opcionesMenu[index];
          final bool esLogout = item['titulo'] == 'Logout';

          // ===================================================================
          // VISTO EN CLASE: CARDS Y LISTTILE
          // ===================================================================
          return Card(
            child: ListTile(
              leading: Icon(
                item['icono'],
                color: esLogout ? Colors.red : Theme.of(context).primaryColor,
              ),
              title: Text(
                item['titulo'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // VISTO EN CLASE: RUTAS
                if (esLogout) {
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                } else {
                  Navigator.pushNamed(context, item['ruta']);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// =============================================================================
// 3. PANTALLA DE LISTAR PRODUCTOS
// =============================================================================
class ListarProductosScreen extends StatelessWidget {
  const ListarProductosScreen({super.key});

  // ===========================================================================
  // VISTO EN CLASE: LISTAS Y MAPAS (List<Map<String, dynamic>>)
  // ===========================================================================
  final List<Map<String, dynamic>> productos = const [
    {'nombre': 'Laptop', 'precio': '3,500.00', 'stock': 10, 'icono': Icons.laptop},
    {'nombre': 'Mouse', 'precio': '50.00', 'stock': 25, 'icono': Icons.mouse},
    {'nombre': 'Teclado', 'precio': '120.00', 'stock': 15, 'icono': Icons.keyboard},
    {'nombre': 'Monitor', 'precio': '800.00', 'stock': 8, 'icono': Icons.desktop_windows},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/registrar-producto'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Buscador superior
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Buscar producto...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          // ===================================================================
          // VISTO EN CLASE: LISTVIEW + CARDS + LISTTILE
          // ===================================================================
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final prod = productos[index];

                return Card(
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(prod['icono'], color: Colors.black54),
                    ),
                    title: Text(
                      prod['nombre'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Precio: S/ ${prod['precio']}'),
                          Text('Stock: ${prod['stock']}'),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 4. PANTALLA DE REGISTRAR PRODUCTO
// =============================================================================
class RegistrarProductoScreen extends StatelessWidget {
  const RegistrarProductoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // =================================================================
            // VISTO EN CLASE: CARD (Usada como contenedor del área de imagen)
            // =================================================================
            Card(
              margin: EdgeInsets.zero,
              child: Container(
                height: 140,
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.camera_alt_outlined, size: 40, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Seleccionar imagen', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildInput(label: 'Nombre del producto'),
            const SizedBox(height: 12),
            _buildInput(label: 'Descripción', maxLines: 2),
            const SizedBox(height: 12),
            _buildInput(label: 'Precio', suffixText: 'S/'),
            const SizedBox(height: 12),
            _buildInput(label: 'Stock'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // VISTO EN CLASE: Regresar en la pila de rutas
                },
                child: const Text('GUARDAR', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({required String label, String? suffixText, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        suffixText: suffixText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}

// =============================================================================
// 5. PANTALLA DE PERFIL
// =============================================================================
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  // ===========================================================================
  // VISTO EN CLASE: LISTAS Y MAPAS (List<Map<String, dynamic>>)
  // ===========================================================================
  final List<Map<String, dynamic>> datosPerfil = const [
    {'label': 'Nombre', 'valor': 'José Alonso', 'icono': Icons.person_outline},
    {'label': 'Email', 'valor': 'jose.lopez.car@tecsup.edu.pe', 'icono': Icons.email_outlined},
    {'label': 'Teléfono', 'valor': '976149945', 'icono': Icons.phone_outlined},
    {'label': 'Roles', 'valor': 'Administrador', 'icono': Icons.settings_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // [NO VISTO EN CLASE]: Stack y Positioned para superponer el botón de edición sobre la foto
            Stack(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, size: 55, color: Colors.black54),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.edit, size: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'José Alonso',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'jose.lopez.car@tecsup.edu.pe',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),

            // =================================================================
            // VISTO EN CLASE: LISTVIEW (shrinkWrap) + CARDS + LISTTILE
            // =================================================================
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: datosPerfil.length,
              itemBuilder: (context, index) {
                final dato = datosPerfil[index];
                return Card(
                  child: ListTile(
                    leading: Icon(dato['icono'], color: Theme.of(context).primaryColor),
                    title: Text(dato['label'], style: const TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Text(dato['valor'], style: const TextStyle(color: Colors.black87, fontSize: 14)),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {},
                child: Text(
                  'EDITAR PERFIL',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}