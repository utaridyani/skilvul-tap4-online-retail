CREATE TABLE pesanan_detail (
id_pesanan INT,
id_barang INT,
jumlah INT,
total_harga BIGINT,
FOREIGN KEY (id_pesanan) REFERENCES pesanan(id),
FOREIGN KEY (id_barang) REFERENCES barang(id)
);