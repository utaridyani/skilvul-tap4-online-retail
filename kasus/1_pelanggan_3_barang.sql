SELECT pembeli.nama, COUNT(pesanan.`id`) AS "jumlah barang yang dibeli" FROM pembeli 
JOIN pesanan ON pembeli.`id` = pesanan.`id_pembeli`
JOIN pesanan_detail ON pesanan_detail.`id_pesanan`=pesanan.`id` 
GROUP BY pesanan.`id` HAVING COUNT(pesanan.`id`)=3;

