SELECT  pembeli.`nama`, barang.`nama` AS "nama barang"
FROM pembeli JOIN pesanan ON pembeli.`id`=pesanan.`id_pembeli`
JOIN pesanan_detail ON pesanan_detail.`id_pesanan`=pesanan.`id`
JOIN barang ON barang.`id` = pesanan_detail.`id_barang`;
