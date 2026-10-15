
import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilMahasiswaApp());
}

class ProfilMahasiswaApp extends StatelessWidget {
  const ProfilMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A6B5C),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8F6),
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatefulWidget {
  const HalamanProfil({super.key});

  @override
  State<HalamanProfil> createState() => _HalamanProfilState();
}

class _HalamanProfilState extends State<HalamanProfil> {
  static const Color emerald = Color(0xFF2A6B5C);
  static const Color emeraldGelap = Color(0xFF1E4D43);
  static const Color hijauMuda = Color(0xFFE2EFEB);

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _profilKey = GlobalKey();
  final GlobalKey _informasiKey = GlobalKey();
  final GlobalKey _tambahanKey = GlobalKey();
  final GlobalKey _hobiKey = GlobalKey();

  // Mengarahkan menu sidebar ke bagian halaman yang dipilih.
  void _pindahKeBagian(GlobalKey kunci) {
    Navigator.pop(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final BuildContext? target = kunci.currentContext;

      if (target != null) {
        Scrollable.ensureVisible(
          target,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
          alignment: 0.08,
        );
      }
    });
  }

  // Kembali ke bagian paling atas halaman.
  void _keBeranda() {
    Navigator.pop(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // Menampilkan informasi saat tombol Edit Profil ditekan.
  void _editProfil() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Profil'),
        content: const Text(
          'Untuk mengubah data profil, silakan edit informasi '
          'mahasiswa pada kode aplikasi.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Tutup',
              style: TextStyle(color: emerald),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: emerald,
        foregroundColor: Colors.white,
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Profil',
            onPressed: _editProfil,
          ),
        ],
      ),

      // Menu samping
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: emerald,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 42,
                      color: emerald,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Althaf Raffaulandro Gabriviel',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    'Mahasiswa Teknik Informatika',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Beranda'),
              onTap: _keBeranda,
            ),

            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profil Saya'),
              onTap: () => _pindahKeBagian(_profilKey),
            ),

            ListTile(
              leading: const Icon(Icons.badge_outlined),
              title: const Text('Informasi Mahasiswa'),
              onTap: () => _pindahKeBagian(_informasiKey),
            ),

            ListTile(
              leading: const Icon(Icons.interests_outlined),
              title: const Text('Informasi Tambahan'),
              onTap: () => _pindahKeBagian(_tambahanKey),
            ),

            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Hobi'),
              onTap: () => _pindahKeBagian(_hobiKey),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kartu profil utama
            Container(
              key: _profilKey,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: emerald,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: hijauMuda,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 72,
                        color: emerald,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Althaf Raffaulandro Gabriviel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Mahasiswa Teknik Informatika',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: emeraldGelap,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Student Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Informasi identitas mahasiswa
            Text(
              'Informasi Mahasiswa',
              key: _informasiKey,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: emeraldGelap,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ItemProfil(
                      ikon: Icons.badge_outlined,
                      label: 'NIM',
                      nilai: '2495114038',
                    ),

                    Divider(height: 24),

                    ItemProfil(
                      ikon: Icons.school_outlined,
                      label: 'Program Studi',
                      nilai: 'Teknik Informatika',
                    ),

                    Divider(height: 24),

                    ItemProfil(
                      ikon: Icons.account_balance_outlined,
                      label: 'Universitas',
                      nilai:
                          'Universitas Hasyim Asy’ari Tebuireng Jombang',
                    ),

                    Divider(height: 24),

                    ItemProfil(
                      ikon: Icons.favorite_border,
                      label: 'Hobi',
                      nilai: 'Memodifikasi motor dan memelihara burung',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Informasi tambahan
            Text(
              'Informasi Tambahan',
              key: _tambahanKey,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: emeraldGelap,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: KartuTambahan(
                    ikon: Icons.menu_book_outlined,
                    judul: 'Semester',
                    isi: '5',
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: KartuTambahan(
                    ikon: Icons.groups_outlined,
                    judul: 'Kelas',
                    isi: 'TI-A',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Bagian hobi
            Container(
              key: _hobiKey,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: hijauMuda,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFB7D5CC),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.interests_outlined,
                    color: emeraldGelap,
                    size: 30,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hal yang Disukai',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: emeraldGelap,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'Suka dunia motor, mencoba modifikasi motor, '
                          'dan menikmati waktu merawat burung.',
                          style: TextStyle(
                            color: Color(0xFF374151),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Tombol detail profil
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: const Text('Profil Saya'),
                    content: const Text(
                      'Halo! Saya Althaf, mahasiswa Teknik Informatika '
                      'yang juga menyukai dunia motor dan burung.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text(
                          'Tutup',
                          style: TextStyle(color: emerald),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.person_outline),
              label: const Text('Lihat Detail Profil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: emerald,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Center(
              child: Text(
                'Profil Mahasiswa • Flutter',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk menampilkan informasi identitas
class ItemProfil extends StatelessWidget {
  final IconData ikon;
  final String label;
  final String nilai;

  const ItemProfil({
    super.key,
    required this.ikon,
    required this.label,
    required this.nilai,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFE2EFEB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            ikon,
            color: const Color(0xFF2A6B5C),
          ),
        ),

        const SizedBox(width: 13),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                nilai,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget untuk kartu informasi tambahan
class KartuTambahan extends StatelessWidget {
  final IconData ikon;
  final String judul;
  final String isi;

  const KartuTambahan({
    super.key,
    required this.ikon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFD1E5DE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            ikon,
            color: const Color(0xFF2A6B5C),
            size: 28,
          ),

          const SizedBox(height: 12),

          Text(
            judul,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            isi,
            style: const TextStyle(
              color: Color(0xFF1E4D43),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
