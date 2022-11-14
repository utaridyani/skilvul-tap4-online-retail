SELECT barang.`nama`, kategori_barang.`nama` AS kategori FROM barang JOIN kategori_barang WHERE barang.`id_kategori`=kategori_barang.id;
