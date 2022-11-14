SELECT barang.`nama` AS "nama barang", COUNT(pesanan_detail.`id_barang`) AS "jumlah terjual" FROM barang
JOIN pesanan_detail ON pesanan_detail.`id_barang`=barang.`id` GROUP BY barang.`nama` 
ORDER BY COUNT(pesanan_detail.`id_barang`) DESC LIMIT 3; 

