SELECT FORMAT(AVG(total_pembelian), 0) AS "rata-rata transaksi pelanggan satu bulan terakhir" FROM pesanan WHERE tgl > CURDATE() - INTERVAL 30 DAY;
