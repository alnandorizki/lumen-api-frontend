-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2024 pada 01.32
-- Versi server: 10.4.32-MariaDB-log
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `item_id` int(11) NOT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `kondisi` varchar(50) DEFAULT NULL,
  `lokasi_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`item_id`, `nama_barang`, `jumlah`, `kondisi`, `lokasi_id`, `updated_at`, `created_at`) VALUES
(1, 'Buku LKS', 100, 'baik', 1, '2023-12-29 13:39:59', '2023-12-29 13:39:59'),
(2, 'Buku Sejarah', 100, 'baik', 1, '2023-12-29 13:32:43', '2023-12-29 13:32:43'),
(3, 'Buku Novel', 50, 'baik', 1, '2023-12-29 15:39:05', '2023-12-29 15:39:05'),
(4, 'Buku Bergambar', 50, 'Baik', 0, '2023-12-29 16:04:47', '2023-12-29 15:42:36'),
(5, 'Buku Komik', 50, 'Baik', NULL, '2023-12-29 16:19:40', '2023-12-29 16:19:40'),
(6, 'Manga', 100, 'baik', 1, '2024-01-07 11:06:12', '2024-01-07 11:06:12'),
(8, 'tespost', 100, 'baik', 1, '2024-01-08 14:33:44', '2024-01-08 14:33:44'),
(9, 'tespost2', 100, 'baik', 1, '2024-01-09 06:36:37', '2024-01-09 06:36:37'),
(12, 'Buku cerita part 2', 50, 'Baik', NULL, '2024-01-10 16:31:48', '2024-01-10 16:31:48'),
(14, 'buku random', 100, 'baik', 1, '2024-01-10 16:33:45', '2024-01-10 16:33:45'),
(15, 'bukun random 2', 100, 'baik ', 1, '2024-01-10 16:34:16', '2024-01-10 16:34:16'),
(16, 'TES', 100, 'BAIK', 1, '2024-01-10 16:35:12', '2024-01-10 16:35:12'),
(17, 'tes', 100, 'tes', 1, '2024-01-11 04:21:05', '2024-01-11 04:21:05'),
(19, 'Buku cerita part 3', 50, 'Baik', NULL, '2024-01-11 04:42:32', '2024-01-11 04:42:32'),
(20, 'tes', 100, 'baik', 1, '2024-01-11 05:41:02', '2024-01-11 05:41:02'),
(21, '123', 123, 'baik', 1, '2024-01-11 23:49:44', '2024-01-11 23:49:44'),
(22, 'buku ipa', 100, 'baik', 1, '2024-01-11 23:58:10', '2024-01-11 23:58:10'),
(23, 'buku ips', 100, 'baik', 1, '2024-01-12 00:08:44', '2024-01-12 00:08:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `informasi_peminjaman`
--

CREATE TABLE `informasi_peminjaman` (
  `info_id` int(11) NOT NULL,
  `peminjaman_id` int(11) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tindak_lanjut` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawan_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`karyawan_id`, `nama`, `jabatan`, `kontak`, `updated_at`, `created_at`) VALUES
(1, 'Susilo', 'admin', '0821324234234', '2023-12-29 13:59:17', '2023-12-29 13:59:17'),
(2, 'Bambang', 'Admin', '02344', '2024-01-12 00:15:23', '2024-01-12 00:15:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `lokasi_id` int(11) NOT NULL,
  `nama_lokasi` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`lokasi_id`, `nama_lokasi`, `updated_at`, `created_at`) VALUES
(1, 'Perpustakaan', NULL, NULL),
(2, 'Kelas', '2024-01-12 00:31:21', '2024-01-12 00:31:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `peminjaman_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `karyawan_id` int(11) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status_peminjaman` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `lokasi_id` (`lokasi_id`);

--
-- Indeks untuk tabel `informasi_peminjaman`
--
ALTER TABLE `informasi_peminjaman`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `peminjaman_id` (`peminjaman_id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawan_id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`lokasi_id`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`peminjaman_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `lokasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`lokasi_id`);

--
-- Ketidakleluasaan untuk tabel `informasi_peminjaman`
--
ALTER TABLE `informasi_peminjaman`
  ADD CONSTRAINT `informasi_peminjaman_ibfk_1` FOREIGN KEY (`peminjaman_id`) REFERENCES `peminjaman` (`peminjaman_id`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `barang` (`item_id`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`karyawan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
