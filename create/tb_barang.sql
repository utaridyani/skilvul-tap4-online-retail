CREATE TABLE barang (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR(50),
harga BIGINT,
stok INT(11),
id_kategori INT,
id_supplier INT,
FOREIGN KEY (id_kategori) REFERENCES kategori_barang(id),
FOREIGN KEY (id_supplier) REFERENCES suppliers(id)
);