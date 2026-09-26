Disclaimer: Seluruh data pada proyek ini (nama peserta, NIK, tanggal, dll) 
adalah data simulasi/fiktif yang dibuat untuk keperluan latihan analisis data. 
Proses bisnis dan nama perusahaan mitra terinspirasi dari observasi lapangan, 
namun tidak merepresentasikan data internal LPK Osin yang sebenarnya.


Analisis Data Peserta Pelatihan & Penempatan Kerja ke Jepang (Studi Kasus: LPK Osin)

Proyek analisis data end-to-end: mulai dari merancang skema basis data relasional, mengisi data simulasi, menulis query SQL untuk analisis, hingga membangun dashboard interaktif di Power BI.

Tema diangkat dari hasil kunjungan ke stan LPK Osin** (lembaga pelatihan kerja yang fokus menyalurkan tenaga kerja Indonesia ke Jepang) pada kegiatan Jobfair kampus.


Latar Belakang

LPK Osin menjalankan proses bisnis berikut untuk setiap peserta:

1. Pendaftaran: peserta memilih salah satu dari 3 program (Magang, Tokutei Ginou, Engineering), masing-masing dengan jenis visa berbeda.
2. Pelatihan: (5–6 bulan): mencakup sertifikasi bahasa Jepang, persiapan fisik, pengenalan budaya, dan tes kesehatan.
3. Matching job / interview: peserta dicocokkan dengan perusahaan mitra di Jepang. Jika tidak lolos, peserta dapat dialihkan ke perusahaan lain.
4. Pembuatan paspor: untuk peserta yang lolos matching.
5. Keberangkatan: peserta bekerja di Jepang sesuai jenis pekerjaan dan gaji yang disepakati.

Terdapat pula 2 skema pembayaran: reguler (dibayar langsung) dan dana talangan (dibayar dulu oleh LPK, dipotong dari gaji peserta selama 8 bulan pertama bekerja).

Proyek ini merancang basis data untuk merepresentasikan seluruh proses tersebut, lalu menganalisisnya untuk mendapatkan insight bisnis.


Tech Stack
- PostgreSQL: (pgAdmin) desain skema & penyimpanan data
- SQL: query analisis (JOIN, GROUP BY, HAVING, agregasi)
- Power BI Desktop: dashboard interaktif

## Struktur Database

8 tabel relasional dalam schema `osin`:

| Tabel | Deskripsi |
|---|---|
| `program` | 3 program dengan jenis visa berbeda |
| `perusahaan_mitra` | Perusahaan tujuan penempatan di Jepang |
| `peserta` | Data calon pekerja |
| `tahap_pelatihan` | Riwayat tahapan pelatihan tiap peserta |
| `matching_tables` | Proses interview/pencocokan peserta—perusahaan (junction table, many-to-many) |
| `dokumen_paspor` | Data paspor peserta yang lolos matching |
| `pembayaran` | Transaksi pembayaran (skema reguler/dana talangan) |
| `keberangkatan` | Data keberangkatan, jenis pekerjaan, dan gaji |



Dashboard terdiri dari 6 visual utama:
- Jumlah peserta per program
- Proporsi skema pembayaran
- Tren pendaftaran per bulan
- Distribusi pendidikan terakhir peserta
- Jumlah peserta per perusahaan mitra
- Funnel alur keberhasilan peserta (pendaftar hingga berangkat kerja)

Dilengkapi slicer interaktif untuk filter berdasarkan program dan rentang tanggal pendaftaran.


 Key Insights

1. Program Tokutei Ginou paling diminati, mengungguli Magang dan Engineering, mengindikasikan preferensi peserta terhadap visa kerja jangka menengah dengan skill lebih spesifik.
2. Skema dana talangan dipilih mayoritas peserta, menunjukkan keterbatasan modal awal menjadi hambatan utama, dan LPK menjawabnya lewat skema cicilan potong gaji.
3. Pendaftaran meningkat signifikan pada periode Mei–Desember, kemungkinan terkait musim kelulusan sekolah/kuliah atau musim rekrutmen aktif perusahaan Jepang.
4. Fuji Food Processing merupakan mitra penyerap tenaga kerja terbesar dibanding perusahaan mitra lain.



Author

Muhammad Reyza Ashidiqie
