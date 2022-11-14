CREATE TABLE pesanan (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_pembeli INT,
tgl DATE,
total_pembelian BIGINT,
metode_pembayaran ENUM ('transfer_bank', 'indomaret'),
FOREIGN KEY (id_pembeli) REFERENCES pembeli(id)
);