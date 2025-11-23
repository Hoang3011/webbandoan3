-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2025 lúc 03:14 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webbandoann`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MA_DH` int(255) NOT NULL,
  `MA_SP` int(255) NOT NULL,
  `SO_LUONG` int(255) NOT NULL,
  `GIA_LUC_MUA` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`MA_DH`, `MA_SP`, `SO_LUONG`, `GIA_LUC_MUA`) VALUES
(37, 9, 1, 40000),
(38, 8, 1, 30000),
(38, 47, 1, 180000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietgiohang`
--

CREATE TABLE `chitietgiohang` (
  `MA_GH` int(255) NOT NULL,
  `MA_SP` int(255) NOT NULL,
  `SO_LUONG` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietgiohang`
--

INSERT INTO `chitietgiohang` (`MA_GH`, `MA_SP`, `SO_LUONG`) VALUES
(39, 7, 2),
(39, 11, 2),
(40, 1, 1),
(40, 5, 1),
(40, 6, 1),
(40, 9, 1),
(40, 47, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `MA_DH` int(255) NOT NULL,
  `MA_KH` int(255) NOT NULL,
  `NGAY_TAO` timestamp NOT NULL DEFAULT current_timestamp(),
  `TONG_TIEN` int(255) NOT NULL,
  `GHI_CHU` varchar(255) NOT NULL,
  `DIA_CHI` varchar(255) NOT NULL,
  `MA_GH` int(255) NOT NULL,
  `PHUONG_THUC` enum('Tiền mặt','Chuyển khoản') NOT NULL,
  `TINH_TRANG` enum('Chưa xác nhận','Đã xác nhận','Đã giao thành công','Đã hủy đơn') DEFAULT 'Chưa xác nhận'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`MA_DH`, `MA_KH`, `NGAY_TAO`, `TONG_TIEN`, `GHI_CHU`, `DIA_CHI`, `MA_GH`, `PHUONG_THUC`, `TINH_TRANG`) VALUES
(1, 22, '2025-03-21 00:00:00', 50000, '', '', 0, 'Tiền mặt', 'Đã hủy đơn'),
(2, 22, '2025-04-01 00:00:00', 60000, '', '', 0, 'Tiền mặt', 'Đã giao thành công'),
(4, 22, '2025-04-19 05:12:27', 100000, '', '123 đường AB, Quận Bình Thạnh, Thành phố Hồ Chí Minh', 0, 'Tiền mặt', 'Đã xác nhận'),
(5, 22, '2025-04-19 06:05:51', 99000, '', '321 CBA, Quận Bình Tân, Thành phố Hồ Chí Minh', 0, 'Tiền mặt', 'Đã hủy đơn'),
(6, 13, '2025-04-19 08:05:29', 50000, '', '12345', 0, 'Tiền mặt', 'Đã giao thành công'),
(7, 13, '2025-04-19 10:04:18', 70000, '', '12345', 0, 'Tiền mặt', 'Chưa xác nhận'),
(8, 13, '2025-04-21 08:07:24', 50000, '1', '123 B, Quận 1, Thành phố Hồ Chí Minh', 0, 'Tiền mặt', 'Chưa xác nhận'),
(10, 13, '2025-04-21 08:14:58', 10000, '', '12345', 0, 'Tiền mặt', 'Đã giao thành công'),
(11, 13, '2025-04-21 08:22:47', 50000, '', '12345', 0, 'Tiền mặt', 'Đã giao thành công'),
(12, 23, '2025-04-24 06:14:38', 20000, '', '321, Quận Tân Phú, Thành phố Hồ Chí Minh', 0, 'Tiền mặt', 'Đã giao thành công'),
(13, 13, '2025-04-29 01:21:03', 125, '', '12345', 0, 'Tiền mặt', 'Đã giao thành công'),
(14, 24, '2025-04-29 01:50:32', 111, '', 'ff', 0, 'Tiền mặt', 'Đã giao thành công'),
(15, 13, '2025-04-29 02:37:59', 30123, '', '12345', 0, 'Tiền mặt', 'Chưa xác nhận'),
(16, 13, '2025-04-29 02:40:32', 30000, '', '12345', 0, 'Tiền mặt', 'Chưa xác nhận'),
(17, 24, '2025-04-29 03:41:54', 30000, '', 'ff', 0, 'Tiền mặt', 'Đã xác nhận'),
(18, 13, '2025-05-05 08:21:20', 60000, '', '12345', 0, 'Tiền mặt', 'Đã xác nhận'),
(19, 13, '2025-09-30 13:13:59', 30000, '', '12345', 0, 'Tiền mặt', 'Đã xác nhận'),
(20, 13, '2025-09-30 13:30:41', 765000, '', '12345', 0, 'Tiền mặt', 'Đã giao thành công'),
(21, 13, '2025-10-23 04:04:35', 40000, '', '12345', 0, 'Tiền mặt', 'Chưa xác nhận'),
(22, 13, '2025-10-23 04:13:52', 120000, '', '12345', 0, 'Chuyển khoản', 'Đã xác nhận'),
(23, 27, '2025-10-25 11:16:55', 40000, '', 'nlklgnfdlk', 0, 'Tiền mặt', 'Đã giao thành công'),
(24, 23, '2025-11-05 07:27:34', 120000, '', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(25, 23, '2025-11-05 07:29:06', 40000, '', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(26, 23, '2025-11-08 02:10:17', 50000, '', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(27, 28, '2025-11-08 02:43:56', 40000, '', 'aaa', 0, 'Tiền mặt', 'Chưa xác nhận'),
(28, 23, '2025-11-11 03:30:35', 30000, '5:1:30000', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(29, 23, '2025-11-11 03:37:35', 120000, '15:1:120000', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(30, 23, '2025-11-11 03:38:12', 130000, '1:1:50000,5:1:30000,11:1:50000', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(31, 23, '2025-11-12 06:45:59', 30000, '|| 5:1:30000', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(32, 23, '2025-11-12 06:47:18', 40000, '|| 10:1:40000', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(33, 23, '2025-11-12 06:51:35', 50000, '', '321', 0, 'Tiền mặt', 'Chưa xác nhận'),
(34, 23, '2025-11-12 07:49:42', 50000, '', '321', 40, 'Tiền mặt', 'Chưa xác nhận'),
(35, 23, '2025-11-12 07:56:36', 40000, '', '321', 40, 'Tiền mặt', 'Chưa xác nhận'),
(36, 23, '2025-11-12 07:57:37', 220000, '', '321', 40, 'Tiền mặt', 'Chưa xác nhận'),
(37, 30, '2025-11-13 04:01:33', 40000, '', 'ww', 46, 'Tiền mặt', 'Chưa xác nhận'),
(38, 30, '2025-11-13 04:14:36', 210000, '', 'ww', 47, 'Tiền mặt', 'Đã giao thành công');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `MA_GH` int(255) NOT NULL,
  `MA_KH` int(255) NOT NULL,
  `TONG_TIEN` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`MA_GH`, `MA_KH`, `TONG_TIEN`) VALUES
(39, 13, 200000),
(40, 23, 340000),
(41, 28, 0),
(42, 23, 0),
(43, 23, 0),
(44, 23, 0),
(45, 29, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MA_KH` int(255) NOT NULL,
  `TEN_KH` varchar(100) NOT NULL,
  `MAT_KHAU` varchar(20) NOT NULL,
  `DIA_CHI` varchar(100) NOT NULL,
  `SO_DIEN_THOAI` varchar(20) NOT NULL,
  `TRANG_THAI` enum('Locked','Active') NOT NULL DEFAULT 'Active',
  `NGAY_TAO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MA_KH`, `TEN_KH`, `MAT_KHAU`, `DIA_CHI`, `SO_DIEN_THOAI`, `TRANG_THAI`, `NGAY_TAO`) VALUES
(12, 'nhan', 'nhan1234', 'quan tan phu', '0775177636', 'Active', '2025-04-19'),
(13, 'KK', '12345', '12345', '12345', 'Active', '2025-04-19'),
(14, 'kkkkkk', '090909', '090909', '090909', 'Active', '2025-04-19'),
(22, 'Đăng Khoa', '0987', '123', '0987654321', 'Active', '2025-04-19'),
(23, 'nguyenvana', '321', '321', '321', 'Active', '0000-00-00'),
(24, 'ff', 'ff', 'ff', 'ff', 'Active', '0000-00-00'),
(26, '', '', '', '', 'Active', '0000-00-00'),
(27, 'nn', '9999', 'nlklgnfdlk', '99999', 'Active', '0000-00-00'),
(28, 'aaa', 'aaa', 'aaa', 'aaa', 'Active', '2025-11-08'),
(29, 'qqq', 'qqq', 'qqq', 'qqq', 'Active', '2025-11-13'),
(30, 'ww', 'www', 'ww', 'ww', 'Active', '2025-11-13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisp`
--

CREATE TABLE `loaisp` (
  `MA_LOAISP` varchar(255) NOT NULL,
  `TEN_LOAISP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaisp`
--

INSERT INTO `loaisp` (`MA_LOAISP`, `TEN_LOAISP`) VALUES
('L001', 'Món chay'),
('L002', 'Món mặn'),
('L003', 'Món lẩu'),
('L004', 'Món ăn vặt'),
('L005', 'Món tráng miệng'),
('L006', 'Nước uống'),
('L007', 'Hải sản');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MA_NV` int(255) NOT NULL,
  `TEN_NV` varchar(255) NOT NULL,
  `SO_DIEN_THOAI` varchar(255) NOT NULL,
  `MAT_KHAU` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MA_NV`, `TEN_NV`, `SO_DIEN_THOAI`, `MAT_KHAU`) VALUES
(1, 'Khoa', '12345', '12345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MA_SP` int(11) NOT NULL,
  `TEN_SP` varchar(255) NOT NULL,
  `HINH_ANH` varchar(255) NOT NULL,
  `GIA_CA` int(255) NOT NULL,
  `MO_TA` varchar(255) NOT NULL,
  `MA_LOAISP` varchar(255) NOT NULL,
  `TINH_TRANG` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MA_SP`, `TEN_SP`, `HINH_ANH`, `GIA_CA`, `MO_TA`, `MA_LOAISP`, `TINH_TRANG`) VALUES
(1, 'Phở Bò', 'assets\\img\\products\\phobo.jpg', 50000, 'Hương vị tinh túy của Việt Nam, với nước dùng đậm đà từ xương bò hầm kỹ, kết hợp cùng bánh phở mềm, thịt bò tái chín vừa tới và các loại rau thơm tạo nên một món ăn sáng hoàn hảo.', 'L002', 1),
(2, 'Bánh mì', 'assets\\img\\products\\banhmi.webp', 20000, 'Một trong những món ăn đường phố ngon nhất thế giới, với vỏ bánh giòn rụm, nhân đầy đặn từ pate, thịt nguội, trứng, kèm theo rau thơm và nước sốt đậm đà.', 'L002', 0),
(3, 'Bún chả Hà Nội', 'assets\\img\\products\\buncha.jpg', 50000, 'Thịt nướng thơm lừng, được ăn kèm với bún tươi, rau sống và nước mắm chua ngọt, tạo nên sự cân bằng hoàn hảo giữa vị ngọt, chua, mặn, cay.', 'L002', 0),
(4, 'Bánh xèo Miền Tây', 'assets\\img\\products\\banhxeo.jpg', 30000, ' Lớp vỏ giòn rụm, nhân đầy đặn từ tôm, thịt và giá đỗ, ăn kèm rau sống và chấm nước mắm chua ngọt, tạo nên hương vị khó quên.', 'L002', -1),
(5, 'Gỏi cuốn', 'assets\\img\\products\\goicuon.jpg', 30000, 'Món ăn thanh mát, với tôm, thịt, bún và rau cuốn trong bánh tráng, chấm kèm nước chấm bơ đậu phộng béo bùi.', 'L002', 1),
(6, 'Cao lầu', 'assets\\img\\products\\caolau.jpg', 40000, 'Đặc sản Hội An với sợi mì dai, thịt xá xíu đậm đà, rau sống tươi ngon và nước dùng đặc biệt.', 'L002', 1),
(7, 'Bún bò Huế', 'assets\\img\\products\\bunbohue.jpg', 50000, ' Nước dùng cay nồng, đậm đà với sả, thịt bò, chả cua, ăn kèm rau thơm và bún to.', 'L002', 1),
(8, 'Hủ tiếu', 'assets\\img\\products\\hutieu.jpg', 30000, 'Món ăn miền Nam với nước dùng ngọt thanh từ xương, sợi hủ tiếu dai mềm, ăn kèm tôm, thịt và rau sống.', 'L002', 1),
(9, 'Chả cá Lã Vọng', 'assets\\img\\products\\chaca.jpg', 40000, ' Cá lăng nướng nghệ, ăn kèm bún, rau thì là và mắm tôm, tạo nên hương vị độc đáo.', 'L002', 1),
(10, 'Mì Quảng', 'assets\\img\\products\\miquang.jpg', 40000, 'Món mì đặc trưng của Quảng Nam với sợi mì vàng, thịt tôm, trứng cút, nước dùng ít nhưng đậm vị.', 'L002', 1),
(11, 'Cơm tấm', 'assets\\img\\products\\comtam.jpeg', 50000, ' Món ăn bình dân nhưng đầy đủ dinh dưỡng với sườn nướng, bì, chả trứng, ăn kèm nước mắm pha.', 'L002', 1),
(12, 'Bánh bột lọc Huế', 'assets\\img\\products\\banhbotloc.webp', 30000, 'Lớp bột dẻo dai, nhân tôm thịt đậm đà, chấm nước mắm cay tạo nên món ăn vặt hấp dẫn.', 'L002', 1),
(13, 'Bánh cuốn', 'assets\\img\\products\\banhcuonv2.jpg', 30000, 'Lớp bánh mỏng dai, nhân thịt băm và mộc nhĩ thơm ngon, ăn kèm nước mắm tỏi ớt và chả lụa, tạo nên bữa sáng tinh tế.', 'L002', 1),
(14, 'Bánh ít', 'assets\\img\\products\\banhit.webp', 10000, 'Nhỏ nhắn nhưng đầy hương vị, vỏ bánh dẻo kết hợp nhân đậu xanh hoặc nhân dừa bùi béo.', 'L005', 1),
(15, 'Gà nướng cơm lam', 'assets\\img\\products\\ganuongcomlam.jpg', 120000, 'Gà nướng vàng giòn, ăn kèm cơm lam dẻo thơm của vùng Tây Nguyên.', 'L002', 1),
(16, 'Bún cá Nha Trang', 'assets\\img\\products\\buncanhatrang.jpg', 60000, 'Nước dùng thanh ngọt từ cá biển, kết hợp với bún tươi và rau sống.', 'L007', 1),
(17, 'Bánh tráng cuốn thịt heo', 'assets\\img\\products\\banhtrangcuonthitheo.jpg', 75000, 'Thịt heo mềm thơm, ăn kèm rau sống và chấm mắm nêm đậm đà.', 'L002', 1),
(18, 'Bún sứa Nha Trang', 'assets\\img\\products\\bunsuanhatrang.jpg', 70000, 'Sứa giòn sần sật, nước dùng ngọt thanh tạo nên hương vị đặc trưng.', 'L007', 1),
(19, 'Bánh ép Huế', 'assets/img/products/1743773390_banhephue.jpeg', 20000, 'Bánh ép giòn rụm, nhân pate, trứng và thịt đầy đặn.', 'L004', 1),
(20, 'Cháo lươn Nghệ An', 'assets\\img\\products\\chaoluonnghean.jpg', 55000, 'Cháo lươn thơm ngon, cay nồng đặc trưng của xứ Nghệ.', 'L007', 1),
(21, 'Mực nhồi thịt nướng', 'assets\\img\\products\\mucnhoithitnuong.jpg', 90000, 'Mực tươi nhồi thịt, nướng thơm lừng, chấm muối ớt xanh.', 'L007', 1),
(22, 'Cá bống kho tộ', 'assets\\img\\products\\cabongkhoto.jpg', 65000, 'Cá bống kho với nước màu dừa, thịt cá mềm ngọt.', 'L007', 1),
(23, 'Hến xào xúc bánh tráng', 'assets\\img\\products\\henxaoxucbanhtrang.jpg', 50000, 'Hến xào đậm vị, ăn kèm bánh tráng nướng giòn.', 'L002', 1),
(24, 'Bánh đập hến xào', 'assets\\img\\products\\banhdaphenxao.jpg', 45000, 'Bánh đập giòn tan kết hợp với hến xào thơm ngon.', 'L002', 1),
(25, 'Cá lóc nướng trui', 'assets\\img\\products\\calocnuongtrui.jpg', 110000, 'Cá lóc nướng nguyên con, ăn kèm rau sống và bún.', 'L007', 1),
(26, 'Lẩu mắm miền Tây', 'assets\\img\\products\\laumam.jpg', 180000, 'Lẩu mắm đậm đà, ăn kèm rau đồng quê và bún tươi.', 'L007', 1),
(27, 'Bánh tét lá cẩm', 'assets/img/products/1745057669_banhtetlacam.jpg', 50000, 'Bánh tét dẻo thơm, nhân đậu xanh và thịt ba rọi.', 'L005', 1),
(28, 'Gỏi gà măng cụt', 'assets\\img\\products\\goigamangcut.jpg', 90000, 'Gà ta xé phay, trộn cùng măng cụt giòn ngọt.', 'L002', 1),
(29, 'Bánh xèo Nam Bộ', 'assets\\img\\products\\banhxeonambo.jpg', 70000, 'Bánh xèo vàng giòn, nhân đầy tôm, thịt và giá.', 'L002', 1),
(30, 'Gỏi củ hủ dừa', 'assets\\img\\products\\goicuhudua.jpg', 65000, 'Củ hủ dừa giòn ngọt, trộn cùng tôm thịt và rau thơm.', 'L002', 1),
(31, 'Bò lá lốt', 'assets\\img\\products\\bolalot.jpg', 75000, 'Thịt bò băm nhuyễn cuốn lá lốt, nướng thơm lừng.', 'L002', 1),
(32, 'Bún nước lèo Sóc Trăng', 'assets\\img\\products\\bunnuocleo.jpg', 70000, 'Bún nước lèo Sóc Trăng đặc trưng với mắm cá linh và cá lóc.', 'L002', 1),
(33, 'Cháo cá lóc rau đắng', 'assets\\img\\products\\chaocalocraudang.jpg', 60000, 'Cháo cá lóc nóng hổi ăn cùng rau đắng.', 'L007', 1),
(34, 'Cơm nị cà púa', 'assets\\img\\products\\comnica-pua.jpg', 85000, 'Món cơm kiểu Chăm, hương vị đậm đà của gia vị.', 'L001', 1),
(35, 'Chuột đồng nướng lu', 'assets\\img\\products\\chuotdongnuong.jpg', 95000, 'Chuột đồng nướng giòn, chấm muối tiêu chanh.', 'L002', 1),
(36, 'Bánh tằm bì', 'assets\\img\\products\\banhtambi.jpg', 45000, 'Bánh tằm bì dẻo thơm, ăn kèm nước cốt dừa béo ngậy.', 'L005', 1),
(37, 'Hủ tiếu Mỹ Tho', 'assets\\img\\products\\hutieumytho.jpg', 60000, 'Hủ tiếu dai ngon, nước dùng trong thanh.', 'L002', 1),
(38, 'Bánh canh Trảng Bàng', 'assets\\img\\products\\banhcanhtrangbang.jpg', 65000, 'Sợi bánh canh dai, nước dùng ngọt thanh, ăn kèm thịt heo.', 'L002', 1),
(39, 'Vịt quay Lạng Sơn', 'assets\\img\\products\\vitquaylangson.jpg', 150000, 'Vịt quay da giòn, ướp gia vị đặc trưng của vùng Lạng Sơn.', 'L002', 1),
(40, 'Nem nướng Nha Trang', 'assets\\img\\products\\nemnuongnhatrang.jpg', 80000, 'Nem nướng thơm lừng, ăn kèm rau sống và nước chấm đặc biệt.', 'L002', 1),
(41, 'Xôi xéo Hà Nội', 'assets\\img\\products\\xoixeohanoi.jpg', 30000, 'Xôi nếp dẻo, kết hợp đậu xanh nghiền và hành phi giòn.', 'L005', 1),
(42, 'Bánh gai Hải Dương', 'assets\\img\\products\\banhgaiaidduong.jpg', 25000, 'Bánh gai dẻo thơm, nhân đậu xanh béo ngậy.', 'L005', 1),
(43, 'Bánh tro', 'assets\\img\\products\\banhtro.jpg', 20000, 'Bánh tro mềm, ăn kèm mật mía ngọt thanh.', 'L005', 1),
(44, 'Chả mực Hạ Long', 'assets\\img\\products\\chamuchalong.jpg', 120000, 'Chả mực giòn dai, chấm kèm tương ớt cay nồng.', 'L002', 1),
(45, 'Bánh dày giò', 'assets\\img\\products\\banhdaygio.jpg', 35000, 'Bánh dày dẻo dai, ăn kèm giò lụa mềm mịn.', 'L004', 1),
(46, 'Ốc hương nướng bơ tỏi', 'assets\\img\\products\\ochuongnuong.jpg', 110000, 'Ốc hương nướng thơm lừng với bơ tỏi béo ngậy.', 'L007', 1),
(47, 'Lẩu cua đồng', 'assets\\img\\products\\laucuadong.jpg', 180000, 'Lẩu cua đồng thơm ngon, nước dùng đậm đà từ gạch cua.', 'L003', 1),
(48, 'Bún riêu cua', 'assets\\img\\products\\bunrieucua.jpg', 65000, 'Bún riêu cua nước dùng chua ngọt, ăn kèm rau sống.', 'L007', 1),
(49, 'Bánh bông lan trứng muối', 'assets\\img\\products\\banhbonglantrungmuoi.jpg', 55000, 'Bánh mềm mịn, trứng muối mằn mặn, phô mai béo ngậy.', 'L005', 1),
(50, 'Bánh da lợn', 'assets\\img\\products\\banhdalon.jpg', 30000, 'Bánh da lợn nhiều lớp, dẻo thơm từ lá dứa và đậu xanh.', 'L005', 1),
(51, 'Bò kho', 'assets\\img\\products\\bokho.jpg', 90000, 'Bò kho đậm đà, ăn kèm bánh mì hoặc bún.', 'L002', 1),
(52, 'Xôi gấc', 'assets\\img\\products\\xoigac.jpg', 35000, 'Xôi gấc có màu đỏ cam rực rỡ, dẻo thơm.', 'L005', 1),
(53, 'Gà hấp lá chanh', 'assets\\img\\products\\gahaplachanh.jpg', 120000, 'Gà hấp thơm lừng lá chanh, thịt mềm ngọt.', 'L002', 1),
(54, 'Canh chua cá lóc', 'assets\\img\\products\\canhchuacaloc.jpg', 75000, 'Canh chua thanh mát, cá lóc ngọt thịt, ăn kèm cơm.', 'L007', 1),
(55, 'Tôm rang me', 'assets\\img\\products\\tomrangme.jpg', 85000, 'Tôm rang me chua ngọt, ăn kèm cơm trắng hoặc bánh mì.', 'L007', 1),
(56, 'Bánh khọt', 'assets\\img\\products\\banhkhot.jpg', 50000, 'Bánh khọt giòn rụm, nhân tôm tươi, chấm nước mắm ngon.', 'L004', 1),
(57, 'Súp cua', 'assets\\img\\products\\supcua.jpg', 70000, 'Súp cua thơm ngon, bổ dưỡng với trứng bắc thảo.', 'L004', 1),
(58, 'Nem chua Thanh Hóa', 'assets\\img\\products\\nemchua.jpg', 60000, 'Nem chua lên men tự nhiên, chua nhẹ, cay nhẹ.', 'L004', 1),
(59, 'Bánh giò', 'assets\\img\\products\\banhgio.jpg', 40000, 'Bánh giò mềm, nhân thịt băm đậm vị, ăn nóng ngon hơn.', 'L004', 1),
(60, 'Cút lộn xào me', 'assets\\img\\products\\cutlonxaome.jpg', 55000, 'Trứng cút lộn xào với me chua ngọt, ăn kèm rau răm.', 'L004', 1),
(61, 'Cà phê sữa đá ', 'assets\\img\\products\\caphe.jpg', 30000, 'Cà phê sữa đá là một trong những thức uống mang đậm bản sắc Việt Nam. Hương vị đậm đà của cà phê phin hòa quyện với vị ngọt béo của sữa đặc, tạo nên một thức uống vừa mạnh mẽ, vừa ngọt ngào. Uống một ly vào buổi sáng giúp tỉnh táo cả ngày!', 'L006', 1),
(62, 'Trà đá ', 'assets\\img\\products\\trada.jpg', 5000, ' Trà đá là thức uống phổ biến ở mọi quán ăn vỉa hè tại Việt Nam. Nó có vị thanh mát, giúp giải nhiệt và không chứa quá nhiều đường hay chất béo, rất tốt cho sức khỏe.', 'L006', 1),
(63, 'Nước sâm', 'assets\\img\\products\\nuocsam.jpg', 10000, 'Nước sâm có vị ngọt thanh tự nhiên, thơm nhẹ từ các loại thảo mộc. Đây là thức uống giải nhiệt cực tốt, thường được người miền Nam ưa chuộng, đặc biệt vào những ngày nắng nóng.', 'L006', 1),
(64, 'Nước mía', 'assets\\img\\products\\nuocmia.png', 10000, 'Nước mía có vị ngọt tự nhiên, mát lạnh, giúp giải khát nhanh chóng. Thêm một chút tắc hoặc quất sẽ tạo vị chua nhẹ, cân bằng hương vị.', 'L006', 1),
(65, 'Sinh tố bơ', 'assets\\img\\products\\sinhtobo.jpg', 25000, 'Sinh tố bơ có độ béo mịn đặc trưng, vị ngọt nhẹ và mùi thơm hấp dẫn. Đây là món sinh tố bổ dưỡng, tốt cho da và sức khỏe.', 'L006', 1),
(66, 'Bún riêu chay ', 'assets\\img\\products\\bunrieuchay.jpg', 30000, 'Nước dùng thanh ngọt từ cà chua, đậu hũ và nấm tạo nên vị chua nhẹ, thơm ngon. Món này vẫn giữ được hương vị đặc trưng của bún riêu truyền thống nhưng nhẹ nhàng hơn, thích hợp cho những ai muốn ăn thanh đạm.', 'L001', 1),
(67, 'Hủ tiếu chay', 'assets\\img\\products\\hutieuchay.jpg', 30000, 'Nước dùng từ rau củ rất ngọt tự nhiên, kết hợp với nấm, tàu hũ ki và sợi hủ tiếu dai ngon. Món này không chỉ thơm ngon mà còn rất bổ dưỡng.', 'L001', 1),
(68, 'Cơm tấm chay ', 'assets\\img\\products\\comtamchay.png', 30000, ' Món cơm tấm chay có đầy đủ các thành phần như chả chay, bì chay, nước mắm chay pha vừa miệng. Mặc dù không có thịt nhưng vẫn giữ được hương vị thơm ngon, hấp dẫn.', 'L001', 1),
(69, 'tt', 'assets/img/products/1745889543_Screenshot 2025-03-03 143326.png', 125, 'wdfsg', 'L003', -1),
(138, 'qq', 'assets/img/products/1745891345_Screenshot 2025-04-10 182141.png', 123, 'ewdfs', 'L007', -1),
(139, 'qq', 'assets/img/products/1745891396_tải xuống.jpg', 111, 'axsdf', 'L006', -1),
(140, 'nn', 'assets/img/products/1745897622_Screenshot 2025-04-04 134745.png', 123, 'qswdaswf', 'L001', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`MA_DH`,`MA_SP`),
  ADD KEY `fk_chitietdonhang_sanpham` (`MA_SP`);

--
-- Chỉ mục cho bảng `chitietgiohang`
--
ALTER TABLE `chitietgiohang`
  ADD PRIMARY KEY (`MA_GH`,`MA_SP`),
  ADD KEY `fk_chitietgiohang_sanpham` (`MA_SP`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MA_DH`),
  ADD KEY `fk_donhang_khachhang` (`MA_KH`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MA_GH`),
  ADD KEY `fk_giohang_khachhang` (`MA_KH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MA_KH`);

--
-- Chỉ mục cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`MA_LOAISP`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MA_NV`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MA_SP`),
  ADD KEY `fk_sanpham_loaisp` (`MA_LOAISP`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MA_DH` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `MA_GH` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MA_KH` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MA_SP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `fk_chitietdonhang_donhang` FOREIGN KEY (`MA_DH`) REFERENCES `donhang` (`MA_DH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chitietdonhang_sanpham` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chitietgiohang`
--
ALTER TABLE `chitietgiohang`
  ADD CONSTRAINT `fk_chitietgiohang_giohang` FOREIGN KEY (`MA_GH`) REFERENCES `giohang` (`MA_GH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chitietgiohang_sanpham` FOREIGN KEY (`MA_SP`) REFERENCES `sanpham` (`MA_SP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`MA_KH`) REFERENCES `khachhang` (`MA_KH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `fk_giohang_khachhang` FOREIGN KEY (`MA_KH`) REFERENCES `khachhang` (`MA_KH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sanpham_loaisp` FOREIGN KEY (`MA_LOAISP`) REFERENCES `loaisp` (`MA_LOAISP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
