# Thiết Kế Cơ Sở Dữ Liệu Cho Hệ Thống Nhận Hàng Bằng Mã QR Code

## Hướng dẫn cài đặt MySQL

### Cách 1: Download và cài đặt MySQL qua hướng dẫn tại https://dev.mysql.com/doc/refman/8.2/en/installing.html
### Cách 2: Cài đặt MySQL trên docker
	+ Cài đặt docker qua hướng dẫn: https://docs.docker.com/desktop/
	+ Cài đặt MySQL bằng docker commdline: `docker run --name learn-mysql -e MYSQL_ROOT_PASSWORD=123 -p 8080:3306 -d mysql:latest`
	+ Sau khi cài đặt, user là root và password là 123

## Hướng dẫn cài đặt MySQL Workbench
	+ Download MySQL Workbench qua hướng dẫn: https://dev.mysql.com/doc/workbench/en/wb-installing.html
	+ Tạo MySQL Connection với user/pass đã tạo khi cài đặt MySQL (root/123)


## Chạy SQL script để tạo database, bảng và nhập dữ liệu vào các bảng
Chạy tuần tự các scrip như file sql sau:
https://github.com/nguyenquanbn1412/DoAnSQL/blob/main/qr_receiving.sql

## Sơ đồ cơ sở dữ liệu:
https://github.com/nguyenquanbn1412/DoAnSQL/blob/main/qr_receiving.pdf

## Chi tiết thiết kế cơ sở dữ liệu, cách database hoạt động, ý nghĩa các bảng, view, trigger, procedure:
https://github.com/nguyenquanbn1412/DoAnSQL/blob/main/qr_receiving.png
