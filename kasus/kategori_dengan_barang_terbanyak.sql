SELECT kategori_barang.`nama`, COUNT(barang.`id_kategori`) FROM kategori_barang
JOIN barang ON barang.`id_kategori`=kategori_barang.`id`
GROUP BY kategori_barang.`nama`
ORDER BY COUNT(barang.`id_kategori`) DESC
LIMIT 1;
