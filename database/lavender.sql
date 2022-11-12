-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2022 at 10:08 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lavender`

-- --------------------------------------------------------

--
-- Table structure for table `baiviet`
--

CREATE TABLE `baiviet` (
  `MABAIVIET` int(11) NOT NULL,
  `TIEUDE` text NOT NULL,
  `MOTA` text DEFAULT NULL,
  `NOIDUNG` longtext DEFAULT NULL,
  `THUMNAIL` longtext DEFAULT NULL,
  `XACNHAN` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `baiviet`
--

INSERT INTO `baiviet` (`MABAIVIET`, `TIEUDE`, `MOTA`, `NOIDUNG`, `THUMNAIL`, `XACNHAN`) VALUES
(2, 'Việt Nam đã tạo lập thành công hệ sinh thái an toàn thông tin mạng, sẽ \'xuất ngoại\' nhiều hơn các sản phẩm Make in Vietnam', 'Theo đại diện Cục An toàn thông tin, Việt Nam đã có hệ sinh thái đa dạng, đầy đủ các chủng loại sản phẩm an toàn thông tin mạng, với chất lượng tương đương sản phẩm nước ngoài. Một số sản phẩm đã được trao giải thưởng ở nước ngoài', '<h1>Việt Nam đ&atilde; tạo lập th&agrave;nh c&ocirc;ng hệ sinh th&aacute;i an to&agrave;n th&ocirc;ng tin mạng, sẽ &#39;xuất ngoại&#39; nhiều hơn c&aacute;c sản phẩm Make in Vietnam</h1>  <p><a href=\"https://www.thegioididong.com/tin-tuc/profile/0\">Phạm Hữu Th&agrave;nh</a>&nbsp;2 giờ trước</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/anhdaibai_1280x720-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>Ảnh minh họa hệ sinh th&aacute;i sản phẩm an to&agrave;n th&ocirc;ng tin mạng</p>  <h2>Theo đại diện Cục An to&agrave;n th&ocirc;ng tin, Việt Nam đ&atilde; c&oacute; hệ sinh th&aacute;i đa dạng, đầy đủ c&aacute;c chủng loại sản phẩm an to&agrave;n th&ocirc;ng tin mạng, với chất lượng tương đương sản phẩm nước ngo&agrave;i. Một số sản phẩm đ&atilde; được trao giải thưởng ở nước ngo&agrave;i.&nbsp;Th&ocirc;ng tin n&agrave;y m&igrave;nh vừa đọc được từ&nbsp;<a href=\"https://ictnews.vietnamnet.vn/bao-mat/viet-nam-da-co-he-sinh-thai-san-pham-an-toan-thong-tin-mang-da-dang-400637.html\" rel=\"nofollow\" target=\"_blank\" title=\"ictnews\" type=\"ictnews\">ictnews</a>&nbsp;(chuy&ecirc;n trang của&nbsp;<a href=\"https://vietnamnet.vn/\" rel=\"nofollow\" target=\"_blank\" title=\"Báo Vietnamnet\" type=\"Báo Vietnamnet\">B&aacute;o Vietnamnet</a>), thấy kh&aacute; hữu &iacute;ch n&ecirc;n muốn chia sẻ để mọi người c&ugrave;ng biết.</h2>  <h3><strong>Dần h&igrave;nh th&agrave;nh nền c&ocirc;ng nghiệp an to&agrave;n th&ocirc;ng tin nội địa</strong></h3>  <p>Chia sẻ tại lễ c&ocirc;ng bố v&agrave; trao danh hiệu &ldquo;Ch&igrave;a kh&oacute;a v&agrave;ng&rdquo; năm 2021 vừa được Hiệp hội An to&agrave;n th&ocirc;ng tin Việt Nam (VNISA) tổ chức, &ocirc;ng Nguyễn Th&agrave;nh Ph&uacute;c, Cục trưởng Cục An to&agrave;n th&ocirc;ng tin, Bộ TT&amp;TT cho biết: Bộ TT&amp;TT đ&atilde; x&aacute;c định vấn đề l&agrave;m chủ giải ph&aacute;p, c&ocirc;ng nghệ bảo đảm an to&agrave;n th&ocirc;ng tin mạng l&agrave; yếu tố căn cơ, then chốt trong c&ocirc;ng t&aacute;c bảo đảm an to&agrave;n th&ocirc;ng tin.</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/anhminhhoa_1280x960-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>&Ocirc;ng Nguyễn Th&agrave;nh Ph&uacute;c, Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng</p>  <p>Với vai tr&ograve; quản l&yacute;, dẫn dắt, thời gian qua Bộ TT&amp;TT đ&atilde; c&ugrave;ng với VNISA hỗ trợ cộng đồng doanh nghiệp an to&agrave;n th&ocirc;ng tin mạng để tập trung ph&aacute;t triển, l&agrave;m chủ Hệ sinh th&aacute;i sản phẩm, an to&agrave;n an ninh mạng Make in Vietnam.</p>  <p>T&iacute;nh đến nay, Việt Nam đ&atilde; c&oacute; hệ sinh th&aacute;i gồm đa dạng, đầy đủ c&aacute;c chủng loại sản phẩm an to&agrave;n th&ocirc;ng tin mạng, với chất lượng tương đương sản phẩm nước ngo&agrave;i. Một số sản phẩm đ&atilde; được đ&aacute;nh gi&aacute;, c&ocirc;ng nhận, trao giải thưởng ở nước ngo&agrave;i.&nbsp;</p>  <p>Từ kết quả c&ocirc;ng t&aacute;c thẩm định, đ&aacute;nh gi&aacute; c&aacute;c sản phẩm, dịch vụ an to&agrave;n th&ocirc;ng tin mạng tham dự &ldquo;Ch&igrave;a kh&oacute;a v&agrave;ng&rdquo; năm nay, &ocirc;ng Vũ Quốc Kh&aacute;nh, Ph&oacute; Chủ tịch VNISA, Ph&oacute; Chủ tịch Hội đồng b&igrave;nh chọn cho biết, qua số lượng vượt trội của nhiều sản phẩm mới v&agrave; sự hiện diện của nhiều doanh nghiệp mới trong hạng mục &ldquo;Sản phẩm an to&agrave;n th&ocirc;ng tin triển vọng xuất sắc&rdquo;.</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/antoanmang_1280x720-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>Ảnh minh họa &quot;Ch&igrave;a kh&oacute;a v&agrave;ng&quot;</p>  <p>Đồng thời, chương tr&igrave;nh cũng cho thấy sự đa dạng của c&aacute;c sản phẩm v&agrave; dịch vụ an to&agrave;n th&ocirc;ng tin của c&aacute;c doanh nghiệp Việt Nam, với mức độ nội địa h&oacute;a v&agrave; tự ph&aacute;t triển giải ph&aacute;p khoa học kỹ thuật rất cao, ho&agrave;n to&agrave;n l&agrave;m chủ c&ocirc;ng nghệ trong nhiều lĩnh vực: Từ gi&aacute;m s&aacute;t an ninh mạng, cảnh b&aacute;o sớm đến phản ứng nhanh, chống tấn c&ocirc;ng mạng.</p>  <p>Từ c&aacute;c giải ph&aacute;p bảo vệ website đến c&aacute;c phần mềm chống m&atilde; độc; từ c&aacute;c sản phẩm mật m&atilde; d&acirc;n sự đến c&aacute;c giải ph&aacute;p l&agrave;m việc từ xa an to&agrave;n; từ c&aacute;c giải ph&aacute;p nền tảng phục vụ cho chuyển đổi số đến c&aacute;c giải ph&aacute;p giao dịch điện tử an to&agrave;n; Từ c&aacute;c dịch vụ đ&aacute;nh gi&aacute; v&agrave; bảo vệ an to&agrave;n th&ocirc;ng tin cho hệ thống đến c&aacute;c dịch vụ tư vấn an to&agrave;n th&ocirc;ng tin...</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/antoanmang11_1280x800-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>Ảnh minh họa dịch vụ an to&agrave;n th&ocirc;ng tin</p>  <p>&ldquo;Thực tế, nhiều sản phẩm, dịch vụ của c&aacute;c doanh nghiệp Việt Nam ho&agrave;n to&agrave;n c&oacute; thể thay thế sản phẩm, dịch vụ tương tự của nước ngo&agrave;i&rdquo;, &ocirc;ng Vũ Quốc Kh&aacute;nh nhận x&eacute;t.</p>  <h3><strong>Giải b&agrave;i to&aacute;n mở rộng thị trường cho sản phẩm Make in Vietnam</strong></h3>  <p>Tuy nhi&ecirc;n, Cục trưởng Cục An to&agrave;n th&ocirc;ng tin Nguyễn Th&agrave;nh Ph&uacute;c cũng chỉ r&otilde;: Số liệu doanh thu h&agrave;ng qu&yacute;, h&agrave;ng năm của sản phẩm an to&agrave;n th&ocirc;ng tin mạng nội địa v&agrave; sản phẩm nước ngo&agrave;i vẫn c&ograve;n ch&ecirc;nh lệch; doanh thu sản phẩm nội địa c&ograve;n thấp so với doanh thu sản phẩm nước ngo&agrave;i.</p>  <p>Trả lời cho c&acirc;u hỏi &ldquo;Đ&acirc;u l&agrave; lời giải cho b&agrave;i to&aacute;n về sự ch&ecirc;nh lệch doanh thu giữa sản phẩm nội địa v&agrave; sản phẩm của nước ngo&agrave;i?&quot;, &ocirc;ng Nguyễn Th&agrave;nh Ph&uacute;c nhấn mạnh, thị trường l&agrave; mở, l&agrave; tu&acirc;n theo quy luật cung cầu.</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/baomatkhihoptructuyen-1587704997_750x0_1280x777-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>Sản phẩm Make in Viet Nam ho&agrave;n to&agrave;n c&oacute; ưu thế về quy tr&igrave;nh hỗ trợ nghiệp vụ</p>  <p>Do vậy, sản phẩm tốt, dịch vụ tốt sẽ được người d&ugrave;ng lựa chọn. Một sản phẩm tốt cần: Tốt về t&iacute;nh năng kỹ thuật; tốt về quy tr&igrave;nh hỗ trợ nghiệp vụ; tốt về nhận sự hỗ trợ; tốt về giải quyết được vấn đề an to&agrave;n th&ocirc;ng tin của Việt Nam.</p>  <p>&quot;Trong 4 c&aacute;i cần tốt kể tr&ecirc;n, sản phẩm Make in Viet Nam ho&agrave;n to&agrave;n c&oacute; ưu thế về quy tr&igrave;nh hỗ trợ nghiệp vụ, về nhận sự hỗ trợ cũng như việc giải quyết được c&aacute;c vấn đề an to&agrave;n th&ocirc;ng tin của Việt Nam. &quot;Ch&uacute;ng ta phải tận dụng được lợi thế n&agrave;y để cạnh tranh với sản phẩm nước ngo&agrave;i&rdquo;, &ocirc;ng Nguyễn Th&agrave;nh Ph&uacute;c n&ecirc;u quan điểm.</p>  <p>Nh&igrave;n lại h&agrave;nh tr&igrave;nh gần 1 năm vừa qua, đại diện Cục An to&agrave;n th&ocirc;ng tin đ&aacute;nh gi&aacute;: Năm 2021 đ&aacute;nh dấu bước tiến quan trọng của lĩnh vực an to&agrave;n th&ocirc;ng tin, đặc biệt l&agrave; ảnh hưởng của dịch bệnh Covid-19 đ&atilde; l&agrave;m cho động lực cần chuyển đổi số mạnh hơn bao giờ hết. Việc đảm bảo an to&agrave;n th&ocirc;ng tin mạng giai đoạn hiện nay trở n&ecirc;n cấp thiết, trọng yếu hơn bao hết.</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/tin-tac-nga-tan-cong-my-9586362_4102020_1280x846-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>Đảm bảo an to&agrave;n th&ocirc;ng tin mạng giai đoạn hiện nay trở n&ecirc;n cấp thiết, trọng yếu hơn bao hết</p>  <p>Đại diện Cục An to&agrave;n th&ocirc;ng tin cho rằng, đ&acirc;y l&agrave; cơ hội lớn v&agrave; cũng l&agrave; th&aacute;ch thức với c&aacute;c doanh nghiệp an to&agrave;n th&ocirc;ng tin mạng Việt Nam trong việc mở rộng thị trường, đưa sản phẩm an to&agrave;n th&ocirc;ng tin mạng Make in Vietnam đến tay người sử dụng trong nước v&agrave; vươn ra quốc tế.</p>  <p>&quot;Bộ TT&amp;TT k&ecirc;u gọi c&aacute;c doanh nghiệp trong lĩnh vực an to&agrave;n th&ocirc;ng tin mạng đẩy mạnh nghi&ecirc;n cứu, ph&aacute;t triển sản phẩm mới, đi trước một bước để ph&aacute;t triển những sản phẩm m&agrave; thế giới chưa ho&agrave;n thiện để khẳng định thương hiệu Make in Vietnam trong lĩnh vực an to&agrave;n th&ocirc;ng tin mạng. Bộ TT&amp;TT cũng tin tưởng lĩnh vực n&agrave;y sớm c&oacute; thể trở th&agrave;nh mũi nhọn trong việc khẳng định chất lượng của sản phẩm Việt Nam, của tr&iacute; tuệ người Việt&rdquo;, đại diện Cục An to&agrave;n th&ocirc;ng tin n&oacute;i.</p>  <p><img alt=\"antoanmang\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404929/baomatthongtin_1280x670-800-resize.jpg\" title=\"antoanmang\" /></p>  <p>C&aacute;c doanh nghiệp trong lĩnh vực an to&agrave;n th&ocirc;ng tin mạng cần đẩy mạnh nghi&ecirc;n cứu, ph&aacute;t triển sản phẩm mới</p>  <p>Ở g&oacute;c độ của VNISA, Chủ tịch Nguyễn Th&agrave;nh Hưng cũng n&ecirc;u khuyến nghị c&aacute;c doanh nghiệp: Với c&aacute;c sản phẩm, dịch vụ an to&agrave;n th&ocirc;ng tin đ&atilde; khẳng định tr&ecirc;n thị trường, n&ecirc;n c&oacute; hướng tiếp tục ph&aacute;t triển tiệm cận c&aacute;c ti&ecirc;u chuẩn quốc tế nhằm từng bước vươn ra thị trường quốc tế.</p>  <p>C&aacute;c doanh nghiệp cũng n&ecirc;n đầu tư ph&aacute;t triển c&aacute;c dịch vụ an to&agrave;n th&ocirc;ng tin cơ bản, chi ph&iacute; hợp l&yacute;, ph&ugrave; hợp số đ&ocirc;ng người d&ugrave;ng tại Việt Nam, phục vụ cho tiến tr&igrave;nh chuyển đổi số.&nbsp;</p>  <p>Bạn đ&aacute;nh gi&aacute; như thế n&agrave;o về&nbsp;hệ sinh th&aacute;i sản phẩm an to&agrave;n th&ocirc;ng tin mạng Việt Nam? Để tăng cường bảo mật cho m&aacute;y t&iacute;nh v&agrave; c&aacute;c dữ liệu c&aacute; nh&acirc;n của m&igrave;nh th&igrave; c&aacute;c bạn c&oacute; thể chon mua phần mềm bảo vệ&nbsp;Kaspersky c&oacute; gi&aacute; kh&aacute; tốt bằng c&aacute;ch bấm v&agrave;o n&uacute;t cam b&ecirc;n dưới.</p>  <p>&nbsp;</p>', 'https://cdn.tgdd.vn/Files/2021/12/17/1404929/anhdaibai_1280x720-800-resize.jpg', 1),
(3, 'MediaTek bật mí về chip Dimensity 8000, GPU được cho là nhanh gấp đôi và tiết kiệm điện năng hơn 22% so với thế hệ trước', 'Tại buổi họp báo mới đây, MediaTek đã xác nhận rằng chip Dimensity 9000 sẽ được trang bị cho OPPO Find X4 và Redmi K50 sắp tới. Chưa hết, hãng còn bật mí sự tồn tại của chip Dimensity 8000 mới, dĩ nhiên là giá thành sẽ thấp hơn Dimensity 9000.', '<h1>MediaTek bật m&iacute; về chip Dimensity 8000, GPU được cho l&agrave; nhanh gấp đ&ocirc;i v&agrave; tiết kiệm điện năng hơn 22% so với thế hệ trước</h1>  <p><img alt=\"\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404952/dimensity-8000-teaser_1280x720-800-resize.jpg\" /></p>  <p>Tại buổi họp b&aacute;o mới đ&acirc;y, MediaTek đ&atilde; x&aacute;c nhận rằng chip Dimensity 9000 sẽ được trang bị cho&nbsp;<a href=\"https://www.thegioididong.com/dtdd/oppo-find-x4\" target=\"_blank\" title=\"Chi tiết OPPO Find X4\" type=\"Chi tiết OPPO Find X4\">OPPO Find X4</a>&nbsp;v&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-k50\" target=\"_blank\" title=\"Chi tiết Xiaomi Redmi K50\" type=\"Chi tiết Xiaomi Redmi K50\">Redmi K50</a>&nbsp;sắp tới. Chưa hết, h&atilde;ng c&ograve;n bật m&iacute; sự tồn tại của chip Dimensity 8000 mới, dĩ nhi&ecirc;n l&agrave; gi&aacute; th&agrave;nh sẽ thấp hơn&nbsp;Dimensity 9000.</p>  <p>Tuy&nbsp;MediaTek kh&ocirc;ng&nbsp;tiết lộ nhiều th&ocirc;ng tin về&nbsp;Dimensity 8000 trong b&agrave;i thuyết tr&igrave;nh ở buổi họp b&aacute;o, nhưng về ph&iacute;a leaker nổi tiếng&nbsp;Digital Chat Station cho biết rằng con chip mới n&agrave;y sẽ được sản xuất tr&ecirc;n quy tr&igrave;nh&nbsp;5 nm của TSMC thay v&igrave; quy tr&igrave;nh 4 nm ti&ecirc;n tiến.</p>  <p>Chip&nbsp;Dimensity 8000 được cho l&agrave;&nbsp;sẽ sử dụng kiến tr&uacute;c ARMv8 cũ hơn với CPU 8 nh&acirc;n bao gồm 4 nh&acirc;n Cortex-A78 tốc độ 2.75 GHz v&agrave; 4 nh&acirc;n Cortex-A55 tốc độ 2.0 GHz, thay v&igrave; Cortex-A710 v&agrave; Cortex-A510 mới được sử dụng trong Dimensity 9000</p>  <p>MediaTek bật m&iacute; về chip Dimensity 8000 tại buổi họp b&aacute;o mới đ&acirc;y</p>  <h2>Tại buổi họp b&aacute;o mới đ&acirc;y, MediaTek đ&atilde; x&aacute;c nhận rằng chip Dimensity 9000 sẽ được trang bị cho&nbsp;<a href=\"https://www.thegioididong.com/dtdd/oppo-find-x4\" target=\"_blank\" title=\"Chi tiết OPPO Find X4\" type=\"Chi tiết OPPO Find X4\">OPPO Find X4</a>&nbsp;v&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/xiaomi-redmi-k50\" target=\"_blank\" title=\"Chi tiết Xiaomi Redmi K50\" type=\"Chi tiết Xiaomi Redmi K50\">Redmi K50</a>&nbsp;sắp tới. Chưa hết, h&atilde;ng c&ograve;n bật m&iacute; sự tồn tại của chip Dimensity 8000 mới, dĩ nhi&ecirc;n l&agrave; gi&aacute; th&agrave;nh sẽ thấp hơn&nbsp;Dimensity 9000.</h2>  <p>Tuy&nbsp;MediaTek kh&ocirc;ng&nbsp;tiết lộ nhiều th&ocirc;ng tin về&nbsp;Dimensity 8000 trong b&agrave;i thuyết tr&igrave;nh ở buổi họp b&aacute;o, nhưng về ph&iacute;a leaker nổi tiếng&nbsp;Digital Chat Station cho biết rằng con chip mới n&agrave;y sẽ được sản xuất tr&ecirc;n quy tr&igrave;nh&nbsp;5 nm của TSMC thay v&igrave; quy tr&igrave;nh 4 nm ti&ecirc;n tiến.</p>  <p>Chip&nbsp;Dimensity 8000 được cho l&agrave;&nbsp;sẽ sử dụng kiến tr&uacute;c ARMv8 cũ hơn với CPU 8 nh&acirc;n bao gồm 4 nh&acirc;n Cortex-A78 tốc độ 2.75 GHz v&agrave; 4 nh&acirc;n Cortex-A55 tốc độ 2.0 GHz, thay v&igrave; Cortex-A710 v&agrave; Cortex-A510 mới được sử dụng trong Dimensity 9000.</p>  <p><img alt=\"Chip Dimensity 8000 sẽ phổ biến ở phân khúc smartphone tầm trung\" src=\"https://cdn.tgdd.vn/Files/2021/12/17/1404952/chip-dimensity-8000_1280x720-800-resize.jpg\" title=\"Chip Dimensity 8000 sẽ phổ biến ở phân khúc smartphone tầm trung\" /></p>  <p>Chip Dimensity 8000 sẽ phổ biến ở ph&acirc;n kh&uacute;c smartphone tầm trung</p>  <p>Về đồ họa, Dimensity 8000 sẽ song h&agrave;nh c&ugrave;ng GPU Mali-G510 MC6 mới. Được biết, G510 nhanh gấp đ&ocirc;i v&agrave; tiết kiệm điện năng hơn 22% so với thế hệ GPU ARM trước đ&acirc;y. Theo đ&oacute;, con chip mới n&agrave;y được dự đo&aacute;n sẽ phổ biến cho c&aacute;c d&ograve;ng&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" title=\"Đặt mua smartphone tại Thegioididong.com\" type=\"Đặt mua smartphone tại Thegioididong.com\">smartphone</a>&nbsp;tầm trung trong thời gian tới, nhất l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd-xiaomi-redmi\" target=\"_blank\" title=\"Đặt mua smartphone Redmi tại Thegioididong.com\" type=\"Đặt mua smartphone Redmi tại Thegioididong.com\">Redmi</a>&nbsp;v&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd-realme\" target=\"_blank\" title=\"Đặt mua smartphone Realme tại Thegioididong.com\" type=\"Đặt mua smartphone Realme tại Thegioididong.com\">Realme</a>&nbsp;rất quan t&acirc;m.</p>  <p>Dimensity 8000 dự kiến&nbsp;tương th&iacute;ch với bộ nhớ&nbsp;LPDDR5 v&agrave; UFS 3.1, hỗ trợ tốc độ l&agrave;m tươi m&agrave;n h&igrave;nh 168 Hz ở độ ph&acirc;n giải 1.080+ v&agrave; 120 Hz ở độ ph&acirc;n giải 1.440p+.</p>  <p>Bạn nhận x&eacute;t thế n&agrave;o về th&ocirc;ng tin r&ograve; rỉ ph&iacute;a tr&ecirc;n của chip&nbsp;Dimensity 8000 sắp tới? Trong l&uacute;c chờ đợi smartphone tầm trung d&ugrave;ng chip&nbsp;Dimensity 8000 ra mắt, c&aacute;c bạn c&oacute; thể tham khảo th&ecirc;m nhiều&nbsp;smartphone cấu h&igrave;nh tốt trong tầm gi&aacute; từ 4-7 triệu đồng&nbsp;tại&nbsp;<a href=\"https://www.thegioididong.com/\" target=\"_blank\" title=\"Thế Giới Di Động\" type=\"Thế Giới Di Động\">Thế Giới Di Động</a>,&nbsp;bằng c&aacute;ch&nbsp;click v&agrave;o n&uacute;t m&agrave;u cam b&ecirc;n dưới.</p>', 'https://cdn.tgdd.vn/Files/2021/12/17/1404952/dimensity-8000-teaser_1280x720-800-resize.jpg', 1),
(5, 'Cấu hình của laptop đồ họa giá rẻ dưới 20 triệu sẽ như thế nào? Gửi đến bạn 3 gợi ý đáng đồng tiền bát gạo tại Thế Giới Di Động', 'Vậy cấu hình của những chiếc laptop đồ họa dưới 20 triệu sẽ như thế nào? Cùng 24h Công nghệ tìm hiểu nhé!\r\nBên dưới sẽ là những thông số về cấu hình của dòng laptop đồ họa dưới 20 triệu cùng với 3 gợi ý laptop đáng giá mà mình muốn gửi đến các bạn.', '<h1>Cấu h&igrave;nh của laptop đồ họa gi&aacute; rẻ dưới 20 triệu sẽ như thế n&agrave;o? Gửi đến bạn 3 gợi &yacute; đ&aacute;ng đồng tiền b&aacute;t gạo tại Thế Giới Di Động</h1>\r\n\r\n<p><a href=\"https://www.thegioididong.com/tin-tuc/profile/0\">Nguyễn Th&aacute;i Quy</a>&nbsp;3 giờ trước&nbsp;4 b&igrave;nh luận</p>\r\n\r\n<p><img alt=\"Laptop đồ họa giá rẻ dưới 20 triệu\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/laptopdohoa1_1280x720-800-resize.jpg\" title=\"Laptop đồ họa giá rẻ dưới 20 triệu\" /></p>\r\n\r\n<h2>Những chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop\" target=\"_blank\" title=\"laptop\" type=\"laptop\">laptop</a>&nbsp;phục vụ cho nhu cầu c&ocirc;ng việc &#39;hạng nặng&#39; như thiết kế đồ họa thường phải c&oacute; cấu h&igrave;nh mạnh, m&agrave;n h&igrave;nh đẹp, đi k&egrave;m với đ&oacute; l&agrave; gi&aacute; th&agrave;nh kh&aacute; cao. Tuy nhi&ecirc;n, những chiếc laptop đồ họa gi&aacute; rẻ trong tầm gi&aacute; 20 triệu vẫn c&oacute; thể đ&aacute;p ứng được c&aacute;c nhu cầu s&aacute;ng tạo của bạn. Vậy cấu h&igrave;nh của những chiếc&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/cau-hinh-laptop-do-hoa-gia-re-duoi-20-trieu-1380709\" target=\"_blank\" title=\"laptop đồ họa dưới 20 triệu\" type=\"laptop đồ họa dưới 20 triệu\">laptop đồ họa dưới 20 triệu</a>&nbsp;sẽ như thế n&agrave;o? C&ugrave;ng&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc\" target=\"_blank\" title=\"24h Công Nghệ\" type=\"24h Công Nghệ\">24h C&ocirc;ng nghệ</a>&nbsp;t&igrave;m hiểu nh&eacute;!</h2>\r\n\r\n<p>B&ecirc;n dưới sẽ l&agrave; những th&ocirc;ng số về cấu h&igrave;nh của d&ograve;ng laptop đồ họa dưới 20 triệu c&ugrave;ng với 3 gợi &yacute; laptop đ&aacute;ng gi&aacute; m&agrave; m&igrave;nh muốn gửi đến c&aacute;c bạn.</p>\r\n\r\n<h3><strong>Cấu h&igrave;nh laptop đồ họa dưới 20 triệu</strong></h3>\r\n\r\n<p><strong>Vi xử l&yacute;</strong></p>\r\n\r\n<p>Những chiếc laptop đồ họa dưới 20 triệu thường được trang bị vi xử l&yacute; Intel Core i5 hoặc AMD Ryzen 5. Với những con chip n&agrave;y, cho bạn khả năng chạy c&aacute;c phần mềm đồ họa như Photoshop, Illustrator, CorelDraw,... một c&aacute;ch ổn định, mượt m&agrave;.</p>\r\n\r\n<p><img alt=\"Vi xử lý\" src=\"https://cdn.tgdd.vn/Files/2021/08/06/1373534/corei5_1280x720-800-resize.jpg\" title=\"Vi xử lý\" /></p>\r\n\r\n<p>Một số mẫu laptop dưới 20 triệu c&ograve;n được trang bị chip&nbsp;Intel Core i7 hoặc AMD Ryzen 7 nhưng b&ugrave; lại bạn thường sẽ phải đ&aacute;nh đổi với những th&ocirc;ng số kh&aacute;c của m&aacute;y đấy nh&eacute;!</p>\r\n\r\n<p><strong>Ổ cứng v&agrave; RAM</strong></p>\r\n\r\n<p><img alt=\"ổ cứng\" src=\"https://cdn.tgdd.vn/Files/2021/08/06/1373534/ocung_1280x720-800-resize.jpg\" title=\"ổ cứng\" /></p>\r\n\r\n<p>Về ổ cứng, m&aacute;y laptop đồ họa dưới 20 triệu thường mang trong m&igrave;nh ổ cứng SSD mạnh mẽ, cho kh&ocirc;ng gian lưu trữ lớn, thường c&oacute; dung lượng 256 GB hoặc 512 GB. B&ecirc;n cạnh đ&oacute; ch&uacute;ng ta sẽ c&oacute; 8 GB RAM, thoải m&aacute;i để bạn vừa bật phần mềm đồ họa c&ugrave;ng với v&agrave;i tab tr&igrave;nh duyệt.</p>\r\n\r\n<p>Ngo&agrave;i ra, tr&ecirc;n một số chiếc laptop sẽ cho khả năng n&acirc;ng cấp ổ cứng v&agrave; RAM gi&uacute;p đ&aacute;p ứng c&aacute;c nhu cầu cao hơn của người d&ugrave;ng, rất cần thiết cho d&acirc;n thiết kế.</p>\r\n\r\n<p><strong>Card đồ họa</strong></p>\r\n\r\n<p><img alt=\"Card đồ họa\" src=\"https://cdn.tgdd.vn/Files/2021/08/06/1373534/carddohoa_1280x720-800-resize.jpg\" title=\"Card đồ họa\" /></p>\r\n\r\n<p>Với mức gi&aacute; dưới 20 triệu th&igrave; những chiếc laptop đồ họa sẽ được trang bị c&aacute;c card đồ họa rời hoặc card đồ họa t&iacute;ch hợp tầm trung, b&aacute;n chuy&ecirc;n như:&nbsp;NVIDIA GeForce GTX, GeForce MX, Intel Iris, AMD Radeon,...</p>\r\n\r\n<p><strong>M&agrave;n h&igrave;nh</strong></p>\r\n\r\n<p><img alt=\"Man hinh\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/msi-prestige-15-30_1280x720-800-resize.jpg\" title=\"Man hinh\" /></p>\r\n\r\n<p>Đối với một người l&agrave;m thiết kế đồ hoạ th&igrave; chức năng quan trọng nhất ch&iacute;nh l&agrave; khả năng hiển thị của m&aacute;y. M&aacute;y phải c&oacute; một m&agrave;n h&igrave;nh tốt, tr&aacute;nh bị sai lệch m&agrave;u qu&aacute; nhiều để cho ra một sản phẩm chuẩn nhất. Hiện nay c&oacute; 2 loại m&agrave;n h&igrave;nh phổ biến LCD v&agrave; OLED tr&ecirc;n c&aacute;c d&ograve;ng laptop n&oacute;i chung v&agrave; laptop đồ hoạ n&oacute;i ri&ecirc;ng.</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.thegioididong.com/tin-tuc/cau-hinh-laptop-do-hoa-gia-re-duoi-20-trieu-1380709\" /></p>\r\n\r\n<p>Video so s&aacute;nh m&agrave;n h&igrave;nh LCD v&agrave; OLED</p>\r\n\r\n<p>C&aacute;c mẫu laptop đồ hoạ thường được trang bị m&agrave;n h&igrave;nh với độ ph&acirc;n giải Full HD (1920 x 1080) c&ugrave;ng với k&iacute;ch thước từ 14 inch cho đến 15.5 inch t&ugrave;y v&agrave;o nhu cầu của mỗi người. Ngo&agrave;i ra, ở một số mẫu m&aacute;y, m&agrave;n h&igrave;nh đ&atilde; c&oacute; c&ocirc;ng nghệ OLED hiện đại v&agrave; c&oacute; độ bao phủ m&agrave;u DCI-P3 100%.</p>\r\n\r\n<h3><strong>TOP 3 laptop đồ họa dưới 20 triệu tốt nhất</strong></h3>\r\n\r\n<p><em>*Danh s&aacute;ch được m&igrave;nh xếp theo thứ tự gi&aacute; b&aacute;n giảm dần v&agrave; gi&aacute; một số mẫu sẽ thay đổi khi hết khuyến m&atilde;i bạn nh&eacute;!</em></p>\r\n\r\n<h3><strong>1.&nbsp;MSI Modern 15 A5M R7</strong></h3>\r\n\r\n<p><img alt=\"msi modern 15\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/msimodern15-guidingtech_1280x720-800-resize.jpg\" title=\"msi modern 15\" /></p>\r\n\r\n<p>M&agrave;n h&igrave;nh m&aacute;y cho m&agrave;u sắc rực rỡ. Nguồn: Guiding Tech</p>\r\n\r\n<p>Mở đầu danh s&aacute;ch l&agrave; đại diện đến từ thương hiệu m&aacute;y t&iacute;nh&nbsp;<a href=\"https://www.thegioididong.com/laptop-msi\" target=\"_blank\" title=\"MSI\" type=\"MSI\">MSI</a>&nbsp;nổi tiếng -&nbsp;<a href=\"https://www.thegioididong.com/laptop/msi-modern-15-a5m-r7-237vn\" target=\"_blank\" title=\"MSI Modern 15\" type=\"MSI Modern 15\">MSI Modern 15</a>. Chiếc m&aacute;y n&agrave;y sở hữu cho m&igrave;nh một m&agrave;n h&igrave;nh lớn với k&iacute;ch thước 15.6 inch c&ugrave;ng với độ ph&acirc;n giải Full HD cho bạn một kh&ocirc;ng gian l&agrave;m việc thoải m&aacute;i, g&oacute;c nh&igrave;n rộng.</p>\r\n\r\n<p><img alt=\"msi modern 15\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/msimodern15-guidingtech2_1280x720-800-resize.jpg\" title=\"msi modern 15\" /></p>\r\n\r\n<p>Laptop MSI Modern 15 cho hiệu suất xử l&yacute; đồ hoạ ấn tượng. Nguồn: Guiding Tech</p>\r\n\r\n<p>M&aacute;y được trang bị vi xử l&yacute; AMD Ryzen 7 - 5700U c&ugrave;ng với 8 GB RAM cho một hiệu năng v&ocirc; c&ugrave;ng mạnh mẽ, chưa hết m&aacute;y c&ograve;n được bổ sung th&ecirc;m sức mạnh đồ hoạ nhờ v&agrave;o Card đồ họa t&iacute;ch hợp - AMD Radeon Graphics. Do đ&oacute; c&aacute;c phần mềm đồ họa nặng kh&ocirc;ng phải l&agrave; vấn đề lớn với chiếc m&aacute;y n&agrave;y.</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/laptop/msi-modern-15-a5m-r7-237vn\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/263792/msi-modern-15-a5m-r7-237vn-021221-110854-600x600.jpg\" title=\"MSI Modern 15 A5M R7 5700U (237VN)\" /></a></p>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/laptop/msi-modern-15-a5m-r7-237vn\">MSI Modern 15 A5M R7 5700U (237VN)</a></h3>\r\n\r\n<p><strong>19.990.000₫</strong></p>\r\n\r\n<p>Qu&agrave;&nbsp;<strong>740.000₫</strong></p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/laptop/msi-modern-15-a5m-r7-237vn\">XEM CHI TIẾT</a></p>\r\n\r\n<h3><strong>2.&nbsp;Dell Inspiron 15 3511</strong></h3>\r\n\r\n<p>Tiếp nối TOP 3 laptop đồ họa dưới 20 triệu đ&aacute;ng mua h&ocirc;m nay l&agrave; một đại diện đến từ thương hiệu m&aacute;y t&iacute;nh&nbsp;<a href=\"https://www.thegioididong.com/laptop-dell\" target=\"_blank\" title=\"Dell\" type=\"Dell\">Dell</a>&nbsp;-&nbsp;<a href=\"https://www.thegioididong.com/laptop/dell-inspiron-15-3511-i5-p112f001bbl\" target=\"_blank\" title=\"Dell Inspiron 15 3511\" type=\"Dell Inspiron 15 3511\">Dell Inspiron 15 3511</a>.&nbsp;</p>\r\n\r\n<p><img alt=\"dell 3511\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/dell3511-technologyandthings_1280x720-800-resize.jpg\" title=\"dell 3511\" /></p>\r\n\r\n<p>M&aacute;y c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh lớn, m&agrave;u sắc rực rỡ. Nguồn: Technology and things</p>\r\n\r\n<p>M&agrave;n h&igrave;nh 15.6 inch sở hữu độ ph&acirc;n giải Full HD hỗ trợ bạn l&agrave;m việc với c&aacute;c phần mềm đồ hoạ tối ưu v&agrave; giải tr&iacute; với h&igrave;nh ảnh ch&acirc;n thật, sắc n&eacute;t.</p>\r\n\r\n<p>G&oacute;c nh&igrave;n được n&acirc;ng l&ecirc;n đến 178 độ nhờ c&ocirc;ng nghệ WVA, cho ph&eacute;p bạn l&agrave;m việc ở cả những nơi c&oacute; điều kiện &aacute;nh s&aacute;ng kh&ocirc;ng thuận lợi m&agrave; kh&ocirc;ng lo mỏi hay l&oacute;a mắt nhờ c&ocirc;ng nghệ chống ch&oacute;i Anti Glare.</p>\r\n\r\n<p><img alt=\"dell 3511\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/dell3511-shivtechsmart_1280x774-800-resize.jpg\" title=\"dell 3511\" /></p>\r\n\r\n<p>M&aacute;y c&oacute; khả năng xử l&yacute; tốt c&aacute;c phần mềm đồ hoạ, video. Nguồn: Shiv Tech Smart</p>\r\n\r\n<p>Dell Inspiron 15 mang trong m&igrave;nh một tr&aacute;i tim Intel Core I5 Tiger Lake mạnh mẽ c&ugrave;ng với 4 GB RAM (c&oacute; thể n&acirc;ng cấp th&ecirc;m) vừa đủ để bạn l&agrave;m việc thoải m&aacute;i.</p>\r\n\r\n<p>Đam m&ecirc; s&aacute;ng tạo được khơi nguồn nhờ card đồ họa t&iacute;ch hợp Intel Iris Xe Graphics, cho bạn thỏa sức chỉnh sửa ảnh, render video cơ bản,... với c&aacute;c ứng dụng Photoshop, Ai, Premiere,..</p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/laptop/dell-inspiron-15-3511-i5-p112f001bbl\"><img src=\"https://cdn.tgdd.vn/Products/Images/44/252242/dell-inspiron-15-3511-i5-p112f001bbl-211021-043051-600x600.jpg\" title=\"Dell Inspiron 15 3511 i5 1135G7 (P112F001BBL)\" /></a></p>\r\n\r\n<h3><a href=\"https://www.thegioididong.com/laptop/dell-inspiron-15-3511-i5-p112f001bbl\">Dell Inspiron 15 3511 i5 1135G7 (P112F001BBL)</a></h3>\r\n\r\n<p><strong>19.990.000₫</strong></p>\r\n\r\n<p>Qu&agrave;&nbsp;<strong>100.000₫</strong></p>\r\n\r\n<p><a href=\"https://www.thegioididong.com/laptop/dell-inspiron-15-3511-i5-p112f001bbl\">XEM CHI TIẾT</a></p>\r\n\r\n<h3><strong>3.&nbsp;Asus VivoBook A515EA OLED</strong></h3>\r\n\r\n<p>Ứng cử vi&ecirc;n kh&eacute;p lại danh s&aacute;ch cũng l&agrave; một chiếc laptop s&aacute;ng gi&aacute; cho c&aacute;c bạn l&agrave;m đồ hoạ ở tầm gi&aacute; dưới 20 triệu, chiếc&nbsp;<a href=\"https://www.thegioididong.com/laptop/asus-vivobook-a515ea-oled-i5-l12032w\" target=\"_blank\" title=\"Asus VivoBook OLED\" type=\"Asus VivoBook OLED\">Asus VivoBook A515EA OLED</a>&nbsp;hứa hẹn đem lại cho bạn nhiều trải nghiệm sử dụng đ&aacute;ng gi&aacute;.</p>\r\n\r\n<p><img alt=\"asus vivo book oled\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/asusvivobookoled1-jazzmanshardware_1282x720-800-resize.jpg\" title=\"asus vivo book oled\" /></p>\r\n\r\n<p>M&aacute;y sở hữu m&agrave;n h&igrave;nh OLED v&ocirc; c&ugrave;ng chất lượng. Nguồn: Jazzman&#39;s Hardware</p>\r\n\r\n<p>Đ&uacute;ng như t&ecirc;n gọi của sản phẩm, mẫu Laptop n&agrave;y được trang bị m&agrave;n h&igrave;nh OLED k&iacute;ch thước 15.6 inch sắc n&eacute;t rực rỡ. M&agrave;n h&igrave;nh c&oacute; độ ph&acirc;n giải Full HD c&ugrave;ng với độ s&aacute;ng l&ecirc;n tới 600 nit sẽ gi&uacute;p c&aacute;c bạn c&oacute; thể l&agrave;m việc ở mọi điều kiện kh&ocirc;ng gian &aacute;nh s&aacute;ng kh&aacute;c nhau.</p>\r\n\r\n<p>Chưa dừng lại ở đ&oacute;, m&aacute;y c&ograve;n c&oacute; độ phủ m&agrave;u DCI-P3 100% cực kỳ th&iacute;ch hợp cho c&aacute;c bạn l&agrave;m đồ hoạ để tr&aacute;nh sai m&agrave;u nhất c&oacute; thể.</p>\r\n\r\n<p><img alt=\"asus vivobook oled\" src=\"https://cdn.tgdd.vn/Files/2021/09/06/1380709/asusvivobookoled2_1280x739-800-resize.jpg\" title=\"asus vivobook oled\" /></p>\r\n\r\n<p>M&aacute;y xử l&yacute; tốt c&aacute;c t&aacute;c vụ đồ hoạ</p>\r\n\r\n<p>Về phần hiệu năng b&ecirc;n trong, Asus VivoBook được cung cấp sức mạnh bởi vi xử l&yacute; Intel Core i5 Tiger Lake mạnh mẽ c&ugrave;ng với 8 GB RAM (c&oacute; thể n&acirc;ng cấp th&agrave;nh 16 GB RAM) cho hiệu suất xử l&yacute; h&igrave;nh ảnh, kết xuất video mượt m&agrave; v&agrave; nhanh ch&oacute;ng.</p>\r\n\r\n<p>Hơn nữa, bạn sẽ t&igrave;m thấy một năng lượng l&agrave;m việc, đam m&ecirc; s&aacute;ng tạo kh&ocirc;ng ngừng nghỉ với card t&iacute;ch hợp Intel Iris Xe Graphics c&oacute; sẵn tr&ecirc;n chiếc m&aacute;y n&agrave;y.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'https://cdn.tgdd.vn/Files/2021/09/06/1380709/thumbnail1_800x450-300x200.png', 1),
(17, '3 cách tải hình nền giáng sinh 2021 cực đẹp cho máy tính, giúp bạn mang không khí Noel về góc làm việc nhỏ của mình', 'Giáng sinh đang đến gần, không khí cũng bắt đầu se lạnh và mọi người cũng đã trang trí Noel khắp mọi nơi rồi. Hãy bắt đầu trang trí cho chiếc máy tính của bạn, người bạn luôn luôn ở cạnh và giúp bạn có mùa giáng sinh ‘không có lạnh’.', '<h1 style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 45px;font-family: Roboto Condensed\", sans-serif;\">3 cách tải hình nền giáng sinh 2021 cực đẹp cho máy tính, giúp bạn mang không khí Noel về góc làm việc nhỏ của mình</span></h1>\n<p style=\"text-align:start;\"><a href=\"https://www.thegioididong.com/tin-tuc/profile/0\" target=\"_self\"><span style=\"color: rgb(40,138,214);font-size: 12px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Nguyễn Thang Khang</span></a> <span style=\"color: rgb(153,153,153);font-size: 12px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">1 giờ trước</span> <a href=\"javascript:;\" target=\"_self\"><span style=\"color: rgb(51,51,51);font-size: 12px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Lưu bài viết</span></a></p>\n<p style=\"text-align:start;\"></p>\n<div style=\"text-align:none;\"><img src=\"https://cdn.tgdd.vn/Files/2021/12/16/1404787/huongdancachtaihinhnengiangsinh20212131231-_1366x768-800-resize.jpg\" alt=\"Hướng dẫn cách tải hình nền giáng sinh 2021\" style=\"height: auto;width: auto\"/></div>\n<h2 style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Giáng sinh đang đến gần, không khí cũng bắt đầu se lạnh và mọi người cũng đã trang trí Noel khắp mọi nơi rồi. Hãy bắt đầu trang trí cho chiếc</span> <a href=\"https://www.thegioididong.com/laptop\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">máy tính</span></a> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">của bạn, người bạn luôn luôn ở cạnh và giúp bạn có mùa giáng sinh ‘không có lạnh’. Và sau đây, mình sẽ hướng dẫn các bạn</span> <a href=\"https://www.thegioididong.com/tin-tuc/cach-tai-hinh-nen-giang-sinh-cho-may-tinh-1404787\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">cách tải hình nền giáng sinh cho máy tính</span></a> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">cực kỳ đẹp nhé.</span></h2>\n<h3 style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 30px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>1. Cách tải hình nền giáng sinh cho máy tính</strong></span></h3>\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>Cách 1</strong>. Đầu tiên và đơn giản nhất để bạn có thể tải được hình ảnh giáng sinh đẹp và chất lượng cao là <strong>tìm kiếm trên Google hình ảnh</strong> &gt; mở công cụ lọc</span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>ảnh dung lượng cao</strong></span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">lên với những từ khóa liên quan giáng sinh.</span></p>\n<p style=\"text-align:start;\"></p>\n<img src=\"https://cdn.tgdd.vn/Files/2021/12/16/1404787/huongdancachtaihinhnengiangsinh20217-_1366x768-800-resize.jpg\" alt=\"Hướng dẫn cách tải hình nền giáng sinh 2021\" style=\"height: auto;width: auto\"/>\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>Cách 2</strong>. Bạn cũng có thể truy cập các</span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>đường link dưới đây và chọn mục Download</strong></span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">để tải hình ảnh về.</span></p>\n<ul>\n<li><a href=\"https://www.deviantart.com/adni18/art/White-Christmas-72931923\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Link tải hình nên giáng sinh Deviant Artist</span></a></li>\n<li><a href=\"https://www.hdwallpapers.net/tags/christmas\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Link tải hình nền giáng sinh HD Wallpaper</span></a></li>\n<li><a href=\"https://getwallpapers.com/collection/christmas-penguin-wallpaper\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Link tải hình nền giáng sinh Getwapapers</span></a></li>\n</ul>\n<p style=\"text-align:start;\"></p>\n<img src=\"https://cdn.tgdd.vn/Files/2021/12/16/1404787/huongdancachtaihinhnengiangsinh20216-_1366x768-800-resize.jpg\" alt=\"Hướng dẫn cách tải hình nền giáng sinh 2021\" style=\"height: auto;width: auto\"/>\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Có vài</span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>công cụ yêu cầu bạn phải đăng nhập</strong></span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">hoặc nếu chưa có bạn có thể</span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>đăng ký tài khoản</strong></span> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">theo form nhé.</span></p>\n<p style=\"text-align:start;\"></p>\n<img src=\"https://cdn.tgdd.vn/Files/2021/12/16/1404787/huongdancachtaihinhnengiangsinh20215-_1366x768-800-resize.jpg\" alt=\"Hướng dẫn cách tải hình nền giáng sinh 2021\" style=\"height: auto;width: auto\"/>\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><strong>Cách 3</strong>. Cuối cùng, mình có một vài tấm hình giáng sinh trong đường link dưới đây. Nếu bạn thấy thích có thể tải về và tham khảo ở bên dưới.</span>&nbsp;</p>\n', 'https://cdn.tgdd.vn/Files/2021/12/16/1404787/huongdancachtaihinhnengiangsinh20212131231-_1366x768-800-resize.jpg', 1),
(24, 'Cách reset iPhone không cần máy tính trên iOS 15.2, rất tiện lợi khi bạn lỡ nhập sai mật khẩu quá nhiều lần', 'Cách reset iPhone không cần máy tính trên iOS 15.2, rất tiện lợi khi bạn lỡ nhập sai mật khẩu quá nhiều lần\r\nCách reset iPhone không cần máy tính trên iOS 15.2, rất tiện lợi khi bạn lỡ nhập sai mật khẩu quá nhiều lần\r\nCách reset iPhone không cần máy tính trên iOS 15.2, rất tiện lợi khi bạn lỡ nhập sai mật khẩu quá nhiều lần', '<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Trong Windows 11, Start Menu nằm ở giữa màn hình, rất giống với hệ điều hành macOS. Tuy nhiên, bạn vẫn có thể di chuyển trở lại bên trái như Windows 10 nếu muốn. </span></p>\r\n<p></p>\r\n<iframe width=\"auto\" height=\"auto\" src=\"https://www.youtube.com/embed/w2F67LbEtnk\" frameBorder=\"0\"></iframe>\r\n<p></p>\r\n<h3 style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Impact;\"><strong><ins>Start Menu trong Windows 11 đơn giản hơn, chỉ có một danh sách các ứng dụng đã ghim (Pinned) và các tài liệu mở gần đây. Ngoài ra còn có thanh tìm kiếm lớn ở trên cùng, cho phép người dùng tìm các ứng dụng, chương trình một cách nhanh hơn. </ins></strong></span></h3>\r\n<p style=\"text-align:start;\"></p>\r\n<img src=\"https://cdn.tgdd.vn/Files/2021/07/21/1369862/windows11-2_1280x921-800-resize.jpg\" alt=\"Windows 11 sở hữu giao diện Start Menu và Taskbar mới\" style=\"height: auto;width: auto\"/>\r\n<p style=\"text-align:center;\"><span style=\"color: rgb(153,153,153);font-size: 14px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><em>Nguồn: betanews.com</em></span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Trên Windows 10, người dùng có thể di chuyển thanh Taskbar sang bên trái hoặc bên phải màn hình. Tuy nhiên, trên Windows 11, thanh Taskbar sẽ bị khóa và chỉ có thể ở mép dưới cùng mà thôi. </span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Ngoài ra, ở Windows 11 cũng không hỗ trợ Live Tiles. Nếu bạn muốn xem nhanh thông tin trong Start Menu thì có lẽ Windows 10 sẽ thực hiện tốt hơn.</span></p>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Microsoft đã thu gọn hộp tìm kiếm thành một biểu tượng và cũng loại bỏ chức năng</span>&nbsp;</p>\r\n', 'https://cdn.tgdd.vn/Files/2021/07/21/1369862/win11-2_1280x720-800-resize.png', 1),
(25, 'Huawei P50 Pro cập bến thị trường toàn cầu và quốc gia này là điểm đến đầu tiên, giá bán hấp dẫn kèm quà tặng xịn sò', 'Huawei P50 Pro cập bến thị trường toàn cầu và quốc gia này là điểm đến đầu tiên, giá bán hấp dẫn kèm quà tặng xịn sò', '<ul>\r\n<li style=\"text-align:left;\"><span style=\"color: rgb(51,51,51);font-size: 45px;font-family: Roboto Condensed\", sans-serif;\"><strong><em><ins>Huawei P50 Pro cập bến thị trường toàn cầu và quốc gia này là điểm đến đầu tiên, giá bán</ins></em></strong></span></li>\r\n</ul>\r\n<iframe width=\"auto\" height=\"auto\" src=\"https://www.youtube.com/embed/w2F67LbEtnk\" frameBorder=\"0\"></iframe>\r\n<p><span style=\"color: rgb(51,51,51);font-size: 45px;font-family: Roboto Condensed\", sans-serif;\"><strong><em><ins> hấp dẫn kèm quà tặng xịn sò</ins></em></strong></span></p>\r\n<p style=\"text-align:start;\"></p>\r\n<div style=\"text-align:left;\"><img src=\"https://cdn.tgdd.vn/UserUpload/Social2019/IMG_1697_2NDE3F.jpg\" alt=\"\" style=\"height: 20px;width: 20px\"/></div>\r\n<p style=\"text-align:start;\"></p>\r\n<img src=\"https://cdn.tgdd.vn/Files/2022/01/12/1410521/huawei-p50-pro-legend-reborn_1280x720-800-resize.jpg\" alt=\"Huawei P50 Pro cập bến thị trường toàn cầu\" style=\"height: auto;width: auto\"/>\r\n<p style=\"text-align:center;\"><span style=\"color: rgb(153,153,153);font-size: 14px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\"><em>Huawei P50 Pro cập bến thị trường toàn cầu</em></span></p>\r\n<h2 style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Sau nhiều tháng mong đợi, Huawei cuối cùng đã công bố</span> <a href=\"https://www.thegioididong.com/dtdd/huawei-p50-pro-5g\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Huawei P50 Pro</span></a> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">trên thị trường toàn cầu và Malaysia là điểm đến đầu tiên. Dự kiến trong những tuần tới, chiếc</span> <a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">smartphone</span></a> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">này sẽ thẳng tiến các thị trường Đông Nam Á khác như Singapore và Philippines.</span></h2>\r\n<p style=\"text-align:start;\"><span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Cụ thể, hiện người dùng tại Malaysia đã có thể đặt mua trước Huawei P50 Pro phiên bản RAM 8 GB + ROM 256 GB với giá 4.199 MYR (gần 22.8 triệu đồng), kèm quà tặng là chiếc</span> <a href=\"https://www.thegioididong.com/dong-ho-thong-minh\" target=\"_blank\"><span style=\"color: rgb(40,138,214);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">đồng hồ thông minh</span></a> <span style=\"color: rgb(51,51,51);font-size: 16px;font-family: Helvetica, Arial, \"DejaVu Sans\", \"Liberation Sans\", Freesans, sans-serif;\">Huawei Watch GT 2 Pro màu xám và g</span>&nbsp;</p>\r\n', 'https://cdn.tgdd.vn/Files/2022/01/12/1410521/huawei-p50-pro-legend-reborn_1280x720-800-resize.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `baohanh`
--

CREATE TABLE `baohanh` (
  `MABAOHANH` int(11) NOT NULL,
  `IMEI` varchar(20) NOT NULL,
  `NGAYBAOHANH` datetime NOT NULL,
  `CHIPHI` float NOT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chitietgiohang`
--

CREATE TABLE `chitietgiohang` (
  `MAGIOHANG` int(11) NOT NULL,
  `MASANPHAM` int(11) NOT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  `DUNGLUONG` varchar(45) NOT NULL,
  `MAUSAC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietgiohang`
--

INSERT INTO `chitietgiohang` (`MAGIOHANG`, `MASANPHAM`, `SOLUONG`, `DUNGLUONG`, `MAUSAC`) VALUES
(19, 68, 1, '64GB', 'xanh');

-- --------------------------------------------------------

--
-- Table structure for table `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `SOHOADON` int(11) NOT NULL,
  `IMEI` varchar(20) NOT NULL,
  `TIEN` float NOT NULL,
  `DADANHGIA` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 :chưa đánh giá\r\n1: đã đánh giá'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`SOHOADON`, `IMEI`, `TIEN`, `DADANHGIA`) VALUES
(168, 'iphone-trang-64-1', 15000000, 1),
(169, 'vivo-trang-64', 8000000, 1),
(170, 'note20-trang-128-1', 14000000, 1),
(170, 'note20-xanh-128-1', 14000000, 1),
(172, 'vivo-trang-64', 8000000, 1),
(174, 'iphone-trang-128-1', 19000000, 0),
(174, 'vivo-trang-64', 8000000, 1),
(175, 'note20-trang-128-1', 14000000, 1),
(181, 'vivo-trang-64', 8000000, 1),
(182, 'note20-xanh-128-1', 14000000, 1),
(182, 'note20-xanh-64-1', 12000000, 1),
(183, 'iphone-trang-128-1', 19000000, 0),
(184, 'iphone-trang-128-1', 19000000, 0),
(184, 'iphone-xanh-64-1', 15000000, 1),
(184, 'note20-trang-128-1', 14000000, 1),
(185, 'iphone-trang-128-1', 19000000, 0),
(186, 'iphone-trang-128-1', 19000000, 0),
(190, 'vivo-trang-64', 8000000, 1),
(193, 'note20-trang-128-1', 14000000, 1),
(194, 'iphone-trang-128-1', 19000000, 0),
(194, 'iphone-trang-128-2', 19000000, 1),
(195, 'iphone-trang-128-3', 19000000, 1),
(196, 'iphone-trang-128-4', 19000000, 1),
(196, 'iphone-trang-128-5', 19000000, 1),
(197, 'note20-trang-128-1', 14000000, 1),
(203, 'iphone-trang-128-1', 19000000, 0),
(203, 'iphone-trang-128-5', 19000000, 1),
(213, 'vivo-trang-64', 8000000, 1),
(225, 'iphone-xanh-64-1', 15000000, 0),
(225, 'oppo-reno-1', 4000000, 1),
(227, 'iphone-trang-128-1', 19000000, 0),
(227, 'iphone-xanh-64-1', 15000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chitietsanpham`
--

CREATE TABLE `chitietsanpham` (
  `IMEI` varchar(20) NOT NULL,
  `MASANPHAM` int(11) NOT NULL,
  `NGAYSANXUAT` datetime NOT NULL,
  `TINHTRANG` varchar(30) NOT NULL,
  `MAUSAC` varchar(45) NOT NULL,
  `DUNGLUONG` varchar(45) DEFAULT NULL,
  `GIAMOI` float DEFAULT NULL,
  `IMAGE` varchar(400) DEFAULT NULL,
  `soluongton` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietsanpham`
--

INSERT INTO `chitietsanpham` (`IMEI`, `MASANPHAM`, `NGAYSANXUAT`, `TINHTRANG`, `MAUSAC`, `DUNGLUONG`, `GIAMOI`, `IMAGE`, `soluongton`) VALUES
('asus-gaming-1', 76, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 15000000, '/laptop/ASUS/asus/gaming/Đen', 0),
('asus-gaming-2', 76, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 15000000, '/laptop/ASUS/asus/gaming/Đen', 0),
('asus-gaming-3', 76, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 15000000, '/laptop/ASUS/asus/gaming/Đen', 0),
('asus-gaming-4', 76, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 15000000, '/laptop/ASUS/asus/gaming/Đen', 0),
('asus-gaming-5', 76, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 15000000, '/laptop/ASUS/asus/gaming/Đen', 0),
('dell-latitude-1', 78, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 12000000, '/laptop/Dell/Dell/latitude/Đen', 0),
('dell-latitude-2', 78, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 12000000, '/laptop/Dell/Dell/latitude/Đen', 0),
('dell-latitude-3', 78, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 12000000, '/laptop/Dell/Dell/latitude/Đen', 0),
('dell-latitude-4', 78, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 12000000, '/laptop/Dell/Dell/latitude/Đen', 0),
('dell-latitude-5', 78, '2022-01-12 07:00:00', 'Sẵn có', 'Đen', '1T', 12000000, '/laptop/Dell/Dell/latitude/Đen', 0),
('iphone-trang-128-1', 67, '2022-01-02 07:00:00', 'Sẵn có', 'Trắng', '128GB', 19000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-128-2', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 19000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-128-3', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 19000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-128-4', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 19000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-128-5', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 19000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-64-1', 67, '2022-01-02 07:00:00', 'Sẵn có', 'Trắng', '64GB', 15000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-64-2', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 15000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-64-3', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 15000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-64-4', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 15000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-trang-64-5', 67, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 15000000, '/mobile/Apple/iphone/13/Trắng', 0),
('iphone-xanh-64-1', 67, '2022-01-02 07:00:00', 'Sẵn có', 'xanh', '64GB', 15000000, '/mobile/Apple/iphone/13/xanh', 0),
('iphone-xanh-64-2', 67, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 15000000, '/mobile/Apple/iphone/13/xanh', 0),
('iphone-xanh-64-3', 67, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 15000000, '/mobile/Apple/iphone/13/xanh', 0),
('iphone-xanh-64-4', 67, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 15000000, '/mobile/Apple/iphone/13/xanh', 0),
('iphone-xanh-64-5', 67, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 15000000, '/mobile/Apple/iphone/13/xanh', 0),
('note20-trang-128-1', 68, '2022-01-02 07:00:00', 'Sẵn có', 'Trắng', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/Trắng', 0),
('note20-trang-128-2', 68, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/Trắng', 0),
('note20-trang-128-3', 68, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/Trắng', 0),
('note20-trang-128-4', 68, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/Trắng', 0),
('note20-trang-128-5', 68, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/Trắng', 0),
('note20-xanh-128-1', 68, '2022-01-02 07:00:00', 'Sẵn có', 'xanh', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-128-2', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-128-3', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-128-4', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-128-5', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '128GB', 14000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-64-1', 68, '2022-01-02 07:00:00', 'Sẵn có', 'xanh', '64GB', 12000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-64-2', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 12000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-64-3', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 12000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-64-4', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 12000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('note20-xanh-64-5', 68, '2022-01-10 07:00:00', 'Sẵn có', 'xanh', '64GB', 12000000, '/mobile/Samsung/Samsung/Galaxy Note 20/xanh', 0),
('oppo-reno-1', 75, '2022-01-12 07:00:00', 'Sẵn có', 'Tím', '64GB', 4000000, '/mobile/Oppo/oppo/reno 3 pro/Tím', 0),
('oppo-reno-2', 75, '2022-01-12 07:00:00', 'Sẵn có', 'Tím', '64GB', 4000000, '/mobile/Oppo/oppo/reno 3 pro/Tím', 0),
('oppo-reno-3', 75, '2022-01-12 07:00:00', 'Sẵn có', 'Tím', '64GB', 4000000, '/mobile/Oppo/oppo/reno 3 pro/Tím', 0),
('oppo-reno-4', 75, '2022-01-12 07:00:00', 'Sẵn có', 'Tím', '64GB', 4000000, '/mobile/Oppo/oppo/reno 3 pro/Tím', 0),
('oppo-reno-5', 75, '2022-01-12 07:00:00', 'Sẵn có', 'Tím', '64GB', 4000000, '/mobile/Oppo/oppo/reno 3 pro/Tím', 0),
('vivo-trang-64', 69, '2022-01-02 07:00:00', 'Sẵn có', 'Trắng', '64GB', 8000000, '/mobile/Vivo/Vivo/V23e/Trắng', 0),
('vivo-trang-64-2', 69, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 8000000, '/mobile/Vivo/Vivo/V23e/Trắng', 0),
('vivo-trang-64-3', 69, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 8000000, '/mobile/Vivo/Vivo/V23e/Trắng', 0),
('vivo-trang-64-4', 69, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 8000000, '/mobile/Vivo/Vivo/V23e/Trắng', 0),
('vivo-trang-64-5', 69, '2022-01-10 07:00:00', 'Sẵn có', 'Trắng', '64GB', 8000000, '/mobile/Vivo/Vivo/V23e/Trắng', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chitietvanchuyen`
--

CREATE TABLE `chitietvanchuyen` (
  `MACHITIETVANCHUYEN` int(11) NOT NULL,
  `MAVANCHUYEN` int(11) NOT NULL,
  `THOIDIEM` datetime NOT NULL,
  `TRANGTHAI` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chitietvanchuyen`
--

INSERT INTO `chitietvanchuyen` (`MACHITIETVANCHUYEN`, `MAVANCHUYEN`, `THOIDIEM`, `TRANGTHAI`) VALUES
(6, 57, '2022-01-08 22:27:13', 'Đã xuất kho'),
(7, 58, '2022-01-08 22:42:51', 'Đã xuất kho'),
(8, 58, '2022-01-08 22:43:43', 'Đã xuất kho'),
(9, 59, '2022-01-08 23:12:34', 'Đã xuất kho'),
(10, 60, '2022-01-09 02:10:15', 'Đã xuất kho'),
(12, 62, '2022-01-09 09:09:50', 'Đã xuất kho'),
(13, 63, '2022-01-09 09:09:55', 'Đã xuất kho'),
(14, 70, '2022-01-10 15:25:22', 'Đã xuất kho'),
(15, 69, '2022-01-10 15:25:24', 'Đã xuất kho'),
(20, 99, '2022-01-13 07:59:48', 'Đã xuất kho'),
(21, 101, '2022-01-13 08:50:36', 'Đã xuất kho');

-- --------------------------------------------------------

--
-- Table structure for table `danhgia`
--

CREATE TABLE `danhgia` (
  `MADANHGIA` int(11) NOT NULL,
  `MASANPHAM` int(11) NOT NULL,
  `MAKHACHHANG` int(11) NOT NULL,
  `NOIDUNG` text DEFAULT NULL,
  `SOSAO` int(11) NOT NULL,
  `THOIGIAN` datetime NOT NULL,
  `IMAGE` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `danhgia`
--

INSERT INTO `danhgia` (`MADANHGIA`, `MASANPHAM`, `MAKHACHHANG`, `NOIDUNG`, `SOSAO`, `THOIGIAN`, `IMAGE`) VALUES
(7, 67, 41, 'Đặt trước nhận đúng hẹn 22/10. Mua thêm em 13 hồng rất xinh. Mọi người nên trãi nghiệm.\n\nĐặt trước nhận đúng hẹn 22/10. Mua thêm em 13 hồng rất xinh. Mọi người nên trãi nghiệm.\n\nĐặt trước nhận đúng hẹn 22/10. Mua thêm em 13 hồng rất xinh. Mọi người nên trãi nghiệm.\n\nĐặt trước nhận đúng hẹn 22/10. Mua thêm em 13 hồng rất xinh. Mọi người nên trãi nghiệm.\n\n', 5, '2022-01-02 14:39:30', 'https://cdn.tgdd.vn/comment/49098993/064D6679-4F50-40B5-A4C1-746BACE05FD0UD2ZW.jpeg'),
(8, 68, 41, 'Sản phẩm tốt', 5, '2022-01-02 19:09:10', NULL),
(12, 68, 41, 'tệ', 2, '2022-01-12 15:33:14', NULL),
(15, 67, 41, 'iphone 13 rat tot', 5, '2022-01-12 16:59:57', NULL),
(19, 67, 41, 'binh thuong', 4, '2022-01-12 17:39:03', NULL),
(20, 75, 41, 'tốt reno', 5, '2022-01-13 08:01:39', '/danhgia'),
(21, 67, 41, 'iphone tốt frmae', 4, '2022-01-13 08:02:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `danhsachyeuthich`
--

CREATE TABLE `danhsachyeuthich` (
  `MAKHACHHANG` int(11) NOT NULL,
  `MASANPHAM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `danhsachyeuthich`
--

INSERT INTO `danhsachyeuthich` (`MAKHACHHANG`, `MASANPHAM`) VALUES
(41, 67),
(43, 67);

-- --------------------------------------------------------

--
-- Table structure for table `giohang`
--

CREATE TABLE `giohang` (
  `MAGIOHANG` int(11) NOT NULL,
  `MAKHACHHANG` int(11) NOT NULL,
  `TONGTIEN` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giohang`
--

INSERT INTO `giohang` (`MAGIOHANG`, `MAKHACHHANG`, `TONGTIEN`) VALUES
(17, 41, 0),
(18, 43, 0),
(19, 44, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `SOHOADON` int(11) NOT NULL,
  `MAKHACHHANG` int(11) NOT NULL,
  `MAKHUYENMAI` int(11) DEFAULT NULL,
  `PHIVANCHUYEN` int(11) DEFAULT NULL,
  `NGAYHOADON` datetime DEFAULT NULL,
  `MANHANVIEN` int(11) DEFAULT NULL,
  `TONGTIEN` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`SOHOADON`, `MAKHACHHANG`, `MAKHUYENMAI`, `PHIVANCHUYEN`, `NGAYHOADON`, `MANHANVIEN`, `TONGTIEN`) VALUES
(168, 41, NULL, NULL, '2022-01-08 22:14:21', 1, 15000000),
(169, 43, NULL, NULL, '2022-01-08 22:42:39', 1, 8000000),
(170, 44, NULL, NULL, '2022-01-08 23:09:57', 1, 28000000),
(172, 43, NULL, 0, '2022-01-09 02:09:21', 1, 5600000),
(174, 43, 12, 0, '2022-01-09 08:23:49', 1, 18900000),
(175, 41, 12, 0, '2022-01-09 09:09:38', 1, 9800000),
(181, 41, NULL, 0, '2022-01-10 15:18:06', 1, 8040000),
(182, 41, NULL, 0, '2022-01-10 15:22:46', 1, 26000000),
(183, 41, NULL, 0, '2022-01-10 15:55:41', 1, 38000000),
(184, 41, NULL, 0, '2022-01-10 15:56:52', 1, 48000000),
(185, 41, NULL, 0, '2022-01-10 16:06:33', 1, 57000000),
(186, 41, NULL, 0, '2022-01-10 16:07:51', 1, 38000000),
(190, 41, NULL, 0, '2022-01-10 16:14:20', 1, 16000000),
(193, 44, NULL, 0, '2022-01-10 16:27:37', 1, 28000000),
(194, 41, NULL, 0, '2022-01-10 16:39:28', 1, 57000000),
(195, 41, NULL, 0, '2022-01-10 16:39:49', 1, 57000000),
(196, 41, NULL, 0, '2022-01-10 16:42:45', 1, 38000000),
(197, 41, NULL, 0, '2022-01-10 16:50:55', 1, 28000000),
(203, 41, NULL, 0, '2022-01-10 17:09:22', 1, 76000000),
(213, 41, NULL, 990000, '2022-01-11 19:38:18', 1, 8990000),
(225, 41, NULL, 50000, '2022-01-13 07:57:51', 1, 13350000),
(227, 41, 12, 40000, '2022-01-13 08:49:31', 1, 23840000);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MAKHACHHANG` int(11) NOT NULL,
  `TENKHACHHANG` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `SODIENTHOAI` varchar(20) DEFAULT NULL,
  `DIACHI` varchar(200) DEFAULT NULL,
  `NGAYSINH` datetime DEFAULT NULL,
  `LOAIKHACHHANG` varchar(30) DEFAULT NULL,
  `IMAGE` varchar(1000) DEFAULT NULL,
  `CCCD` varchar(45) DEFAULT NULL,
  `NGAYDANGKY` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MAKHACHHANG`, `TENKHACHHANG`, `EMAIL`, `SODIENTHOAI`, `DIACHI`, `NGAYSINH`, `LOAIKHACHHANG`, `IMAGE`, `CCCD`, `NGAYDANGKY`) VALUES
(41, 'Huy Võ Quang', '19521640@gm.uit.edu.vn', '0676656565', 'Tịnh Hòa ,Quảng Ngãi', '1970-01-22 07:00:00', 'Thành viên', '/khachhang', '65877987678787', '0001-01-01 00:00:00'),
(43, 'phạm quốc hùng', 'vqh.official2@gmail.com', '0867676', 'ktx khu B ĐHQG', '2002-02-08 07:00:00', 'Thành viên', '/khachhang', '189831', '2022-01-08 22:31:45'),
(44, 'trần vĩnh phong', 'phong@gmail.com', '08392738278', 'đắk lắk', '2019-01-13 07:00:00', 'Thành viên', '/khachhang', '317873298', '2022-01-08 23:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `khachhangdangnhap`
--

CREATE TABLE `khachhangdangnhap` (
  `REFRESHTOKEN` varchar(1000) NOT NULL,
  `MAKHACHHANG` int(11) NOT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(45) DEFAULT NULL,
  `THOIDIEM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khachhangdangnhap`
--

INSERT INTO `khachhangdangnhap` (`REFRESHTOKEN`, `MAKHACHHANG`, `IP`, `LOCATION`, `THOIDIEM`) VALUES
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxMTA5MDE0LCJleHAiOjE2NDE5NzMwMTQsImlhdCI6MTY0MTEwOTAxNH0.ZDY8X0wr4JHSYAIFd1reHhqKqeYJl10vL-Q5BtHDHgM', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzA5MTQ0LCJleHAiOjE2NDI1NzMxNDQsImlhdCI6MTY0MTcwOTE0NH0.gC4BkC0GNO8Vbg4d3QD-JCn1v7VoJxUlGmeZ4b_972M', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzExNzQzLCJleHAiOjE2NDI1NzU3NDMsImlhdCI6MTY0MTcxMTc0M30.eyllgtp1Le6jTLuxvNCPQ_biR6tZVfgQXMYYtyCFkrA', 41, '116.103.173.100', NULL, '2022-01-09 14:02:23'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzg4NTE5LCJleHAiOjE2NDI2NTI1MTksImlhdCI6MTY0MTc4ODUxOX0.qVEHLqdYpJ_TOCOLi7oCecPDQhoT5JKJA77N4YctsM4', 41, '116.103.173.100', NULL, '2022-01-10 11:21:59'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzg5NDIxLCJleHAiOjE2NDI2NTM0MjEsImlhdCI6MTY0MTc4OTQyMX0.7SMNKIEoaTWOL7BEfu8YVxuyYuAazjinGmuRzDMU6u8', 41, '116.103.173.100', NULL, '2022-01-10 11:37:01'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzk1OTM2LCJleHAiOjE2NDI2NTk5MzYsImlhdCI6MTY0MTc5NTkzNn0.cFaXFaNUpUJUlk6o0B5uVPXVXPHGO3Fm1nku44FrehM', 41, '116.103.173.100', NULL, '2022-01-10 13:25:36'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzQ0MjU3LCJleHAiOjE2NDI2MDgyNTcsImlhdCI6MTY0MTc0NDI1N30.pK2xb1VAklQyUTxQKGA1LwVAmx52t2IR6T3Bwkzpsfc', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzQ0MTc2LCJleHAiOjE2NDI2MDgxNzYsImlhdCI6MTY0MTc0NDE3Nn0.tkBK5mGQC57CQE7T3ojoXW7qBi5c9CPZKm1fmORjwgI', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxNzQ0MTIzLCJleHAiOjE2NDI2MDgxMjMsImlhdCI6MTY0MTc0NDEyM30.mbk4xAxjOnkd_XvZYcUs_7XOGoiZ1nxHtEbwzShr-l0', 41, '116.103.173.100', NULL, '2022-01-09 23:02:03'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODA1NjkxLCJleHAiOjE2NDI2Njk2OTEsImlhdCI6MTY0MTgwNTY5MX0.ojFBG7TSjogyGS44gcCchGY1HP9qu2Z5M-nWkkqnF3s', 41, '116.103.173.100', NULL, '2022-01-10 16:08:11'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODA1ODEwLCJleHAiOjE2NDI2Njk4MTAsImlhdCI6MTY0MTgwNTgxMH0.-hFF0UDADbCXTOo8LuV3YnCXacJfzFSrKC7bfRna9JE', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODA3NTQ3LCJleHAiOjE2NDI2NzE1NDcsImlhdCI6MTY0MTgwNzU0N30.TuQepz2EQM0gBSJnGfVP-Z7byFPyAWx1y49OQviIhl4', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODA4NjczLCJleHAiOjE2NDI2NzI2NzMsImlhdCI6MTY0MTgwODY3M30.PNGVsv3168i_DHcLr9nUx70fGOKxJuBtnyyeFQgynxk', 41, '116.103.173.100', NULL, '2022-01-10 16:57:53'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODAyMTgyLCJleHAiOjE2NDI2NjYxODIsImlhdCI6MTY0MTgwMjE4Mn0.FqwIurrGi84Rg5U8-nWt3kSFEvLRtUWKvxxJNeBIB5w', 41, '116.103.173.100', NULL, '2022-01-10 15:09:42'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODAyNDIzLCJleHAiOjE2NDI2NjY0MjMsImlhdCI6MTY0MTgwMjQyM30.7gxn3RiQRFZU9Sfm5RiNYwTGgkBvjWS8EooVJ2h8Rng', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODMyOTU2LCJleHAiOjE2NDI2OTY5NTYsImlhdCI6MTY0MTgzMjk1Nn0.m-flP-rZQXD_QxNKEgjBJF-u4OJaKKfVfBFJQqejrAc', 41, '116.103.173.100', NULL, '2022-01-10 23:42:36'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODMzMDUxLCJleHAiOjE2NDI2OTcwNTEsImlhdCI6MTY0MTgzMzA1MX0.mvzirZuVWpvyhzAN4leRpnQhixnfu-eZW7rW0cqEKnQ', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODMzMTk4LCJleHAiOjE2NDI2OTcxOTgsImlhdCI6MTY0MTgzMzE5OH0.ZupAcleDI-GkrVQXDRIG5MiFtQBs4Ys59SSXDFOHvEc', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODMzMzMxLCJleHAiOjE2NDI2OTczMzEsImlhdCI6MTY0MTgzMzMzMX0.m7hDwZRIymgsv0o8owtWjEr2ZS04qGWxECy-amyW2Zw', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODMzNTg4LCJleHAiOjE2NDI2OTc1ODgsImlhdCI6MTY0MTgzMzU4OH0.Kb1An6D5wXeXjCD1QUOsgq6vGldOsLAb8A7mfBmHUdo', 41, '116.103.173.100', NULL, '2022-01-10 23:53:08'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODMzOTIxLCJleHAiOjE2NDI2OTc5MjEsImlhdCI6MTY0MTgzMzkyMX0.H77tZk71VZ02o9Lkj9ioWIp_1EzaAVcqeDSqolCgYoI', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODQzNzM4LCJleHAiOjE2NDI3MDc3MzgsImlhdCI6MTY0MTg0MzczOH0.Vz9eOS6ILbuWGu4d2lMs2fP7okjW5gQ5hU2CDhULdrE', 41, '116.103.173.100', NULL, '2022-01-11 02:42:18'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODY1MzQ4LCJleHAiOjE2NDI3MjkzNDgsImlhdCI6MTY0MTg2NTM0OH0.YtXMrqsSxpQGrktz2S8lsOBFyE0zXmzrRSmyErDbSpU', 41, '116.103.173.100', NULL, '2022-01-11 08:42:28'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxODY1NDIxLCJleHAiOjE2NDI3Mjk0MjEsImlhdCI6MTY0MTg2NTQyMX0.aH9oeIxrwnoE73pBbRgF9YjW-xNgoB316yAYlQihGuI', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxOTExNTIzLCJleHAiOjE2NDI3NzU1MjMsImlhdCI6MTY0MTkxMTUyM30.Bf7pfDDf9oJ-whYjENCtNHKSdbL62xIHQZsDCOk1TqE', 41, '116.110.224.51', NULL, '2022-01-11 21:32:03'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxOTk5ODY1LCJleHAiOjE2NDI4NjM4NjUsImlhdCI6MTY0MTk5OTg2NX0.y-0zsNLZcAZYGmf9ueM1hWjlL5ljipmqKs7nPqVt9v8', 41, '116.103.173.100', NULL, '2022-01-12 22:04:25'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQxOTk5OTI0LCJleHAiOjE2NDI4NjM5MjQsImlhdCI6MTY0MTk5OTkyNH0.3H-ZYp3SybB0f3E3TBpUzidcH222oGsWVQsNlNYKjMo', 41, '116.103.173.100', NULL, '2022-01-12 22:05:24'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQyMDA4NTI1LCJleHAiOjE2NDI4NzI1MjUsImlhdCI6MTY0MjAwODUyNX0.CeGEPo4Uh9bu9J955JdisV-j12tqLL22zJuCZkGrYZ8', 41, '116.103.173.100', NULL, '2022-01-13 00:28:45'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQyMDA5MTQ5LCJleHAiOjE2NDI4NzMxNDksImlhdCI6MTY0MjAwOTE0OX0.84v04h8T5c68NETClV5fBvnG3qVh-5Z4GPoZ8hX3QY0', 41, '116.103.173.100', NULL, '2022-01-13 00:39:09'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQyMDM1MTE2LCJleHAiOjE2NDI4OTkxMTYsImlhdCI6MTY0MjAzNTExNn0.hAsncY1F8P6NnFNORzWhp5Wc4EktWolgSpJUVg-hgU0', 41, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQyMDM1NzY4LCJleHAiOjE2NDI4OTk3NjgsImlhdCI6MTY0MjAzNTc2OH0.p1dKs95a7hQ4tbtEA_fwdO7R9yW_5I0yO7RJ9M90mFM', 41, '171.244.208.177', NULL, '2022-01-13 08:02:48'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQyMDM4NDExLCJleHAiOjE2NDI5MDI0MTEsImlhdCI6MTY0MjAzODQxMX0.JTEhHRcJeCdIrYW-rHcO71BCqKwtPvYsElGHr8Ux8oU', 41, '116.103.173.100', NULL, '2022-01-13 08:46:51'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjQxIiwicm9sZSI6IkdVRVNUIiwibmJmIjoxNjQyMDM4NzIyLCJleHAiOjE2NDI5MDI3MjIsImlhdCI6MTY0MjAzODcyMn0.uWuRjH0Lc2bbEO9b8SiKrPboQH1i26XrA48GZ9tRAPw', 41, '116.103.173.100', NULL, '2022-01-13 08:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `MAKHUYENMAI` int(11) NOT NULL,
  `TENKHUYENMAI` varchar(30) NOT NULL,
  `TILEKHUYENMAI` float NOT NULL,
  `NGAYBATDAU` datetime NOT NULL,
  `NGAYKETTHUC` datetime NOT NULL,
  `DIEUKIEN` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khuyenmai`
--

INSERT INTO `khuyenmai` (`MAKHUYENMAI`, `TENKHUYENMAI`, `TILEKHUYENMAI`, `NGAYBATDAU`, `NGAYKETTHUC`, `DIEUKIEN`) VALUES
(12, 'Tri ân khách hàng', 0.3, '2022-01-01 07:00:00', '2022-03-30 07:00:00', 'Áp dụng cho tất cả đơn hàng'),
(13, 'Mừng năm mới', 0.1, '2022-01-01 07:00:00', '2022-01-19 07:00:00', 'Áp dụng cho tất cả đơn hàng'),
(19, 'frame', 0.3, '2022-01-01 07:00:00', '2022-01-18 07:00:00', 'Áp dụng cho tất cả đơn hàng');

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmaicuatoi`
--

CREATE TABLE `khuyenmaicuatoi` (
  `MAKHACHHANG` int(11) NOT NULL,
  `MAKHUYENMAI` int(11) NOT NULL,
  `NGAYTHEM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khuyenmaicuatoi`
--

INSERT INTO `khuyenmaicuatoi` (`MAKHACHHANG`, `MAKHUYENMAI`, `NGAYTHEM`) VALUES
(41, 12, '2022-01-09 09:09:28'),
(41, 13, '2022-01-12 22:06:58'),
(43, 12, '2022-01-09 02:09:09'),
(44, 12, '2022-01-08 23:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MALOAI` int(11) NOT NULL,
  `TENLOAI` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MALOAI`, `TENLOAI`) VALUES
(1, 'Điện thoại'),
(2, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MANHACUNGCAP` int(11) NOT NULL,
  `TENNHACUNGCAP` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SODIENTHOAI` varchar(20) NOT NULL,
  `DIACHI` varchar(200) NOT NULL,
  `IMAGE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`MANHACUNGCAP`, `TENNHACUNGCAP`, `EMAIL`, `SODIENTHOAI`, `DIACHI`, `IMAGE`) VALUES
(1, 'Apple', 'apple@apple.com', '123456789', 'LosA', '/nhacungcap'),
(2, 'Samsung', 'khanhlemaiduy123@gmail.com', '01242434', '12', '/nhacungcap'),
(3, 'LG', 'LG@gmail.com', '01242434', 'Hàn Quốc', '/nhacungcap');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MANHANVIEN` int(11) NOT NULL,
  `TENNHANVIEN` varchar(30) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `SODIENTHOAI` varchar(20) NOT NULL,
  `DIACHI` varchar(200) NOT NULL,
  `NGAYVAOLAM` datetime NOT NULL,
  `CCCD` varchar(20) NOT NULL,
  `NGAYSINH` datetime NOT NULL,
  `CHUCVU` varchar(20) NOT NULL,
  `IMAGE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MANHANVIEN`, `TENNHANVIEN`, `EMAIL`, `SODIENTHOAI`, `DIACHI`, `NGAYVAOLAM`, `CCCD`, `NGAYSINH`, `CHUCVU`, `IMAGE`) VALUES
(1, 'Võ Quang Huy', 'vqh.official@gmail.com', '0914630145', 'Quảng Ngãi', '2021-11-14 07:00:00', '123456789', '2020-12-31 07:00:00', 'Giám đốc', 'https://scontent.fdad3-5.fna.fbcdn.net/v/t39.');

-- --------------------------------------------------------

--
-- Table structure for table `nhanviendangnhap`
--

CREATE TABLE `nhanviendangnhap` (
  `REFRESHTOKEN` varchar(1000) NOT NULL,
  `MANHANVIEN` int(11) NOT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `LOCATION` varchar(1024) DEFAULT NULL,
  `THOIDIEM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhanviendangnhap`
--

INSERT INTO `nhanviendangnhap` (`REFRESHTOKEN`, `MANHANVIEN`, `IP`, `LOCATION`, `THOIDIEM`) VALUES
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE2NjEwNjUsImV4cCI6MTY0MjUyNTA2NSwiaWF0IjoxNjQxNjYxMDY1fQ.QmZQw1HMB4PCTlS5Q0CzAcoImm00SdOA83CZWCSPeys', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE2NTkxOTEsImV4cCI6MTY0MjUyMzE5MSwiaWF0IjoxNjQxNjU5MTkxfQ.dgFCVJdVbpLFqH0xPODR396sOrDth1WiSwutXCyLfww', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE4Njg3NzcsImV4cCI6MTY0MjczMjc3NywiaWF0IjoxNjQxODY4Nzc3fQ.2ujMBhc_bsE0yDuOzpGRpLusV1uBxHVw4tNhFq0BgDA', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5NzQ1OTEsImV4cCI6MTY0MjgzODU5MSwiaWF0IjoxNjQxOTc0NTkxfQ.oct0YcC6cLFiEBYdbHko4UiR9kg5lDYxQUAFIh-DM_c', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5NzQwMTQsImV4cCI6MTY0MjgzODAxNCwiaWF0IjoxNjQxOTc0MDE0fQ._YLxBYudg3SW73ar3odd0ocLR7vmtJTi8dOxrkXpK9M', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5NzYyODYsImV4cCI6MTY0Mjg0MDI4NiwiaWF0IjoxNjQxOTc2Mjg2fQ.mAalYDS8qRqbqhmNhvCh3Dh_hjDnWFGsmDrjPWWoD44', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5ODQwNjIsImV4cCI6MTY0Mjg0ODA2MiwiaWF0IjoxNjQxOTg0MDYyfQ.hlgQJOCU0kPwLgm01BW6qLWPSpyOgxwMUJXOT6CRzFg', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5OTc4MjgsImV4cCI6MTY0Mjg2MTgyOCwiaWF0IjoxNjQxOTk3ODI4fQ.YdmEMptZ9V5UZou1V2vuXbmgNqzMA2FEB95E56RdmMU', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5OTgyMDIsImV4cCI6MTY0Mjg2MjIwMiwiaWF0IjoxNjQxOTk4MjAyfQ.h8VHzsRhUFkV6lPDUkAmavDwTryL02rvrHTxJY7DMlI', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5OTgyMzUsImV4cCI6MTY0Mjg2MjIzNSwiaWF0IjoxNjQxOTk4MjM1fQ.yaBC7b-20i6gam0S_YL_Gumg6kkYVRgrdkzEj7HGwAQ', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5OTQ1ODEsImV4cCI6MTY0Mjg1ODU4MSwiaWF0IjoxNjQxOTk0NTgxfQ.fD3mX7bybxX99TjGGWW8O_CuuKHJWnrnq8fxsQnUtEY', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDE5OTQ4NTIsImV4cCI6MTY0Mjg1ODg1MiwiaWF0IjoxNjQxOTk0ODUyfQ.OGJl9ddhc26F9BB0BNT5OTs5TuMitA2Ao2fEizO4hXU', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMDI4NTAsImV4cCI6MTY0Mjg2Njg1MCwiaWF0IjoxNjQyMDAyODUwfQ.hEzYJk71FLjNagtoM1SHc_8HpF_pOldlpG9ETFd9hfI', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMDMzODUsImV4cCI6MTY0Mjg2NzM4NSwiaWF0IjoxNjQyMDAzMzg1fQ.r5ysQScnjh-NVub1LKm8ylFrUFiRRkGBs8GCSiPmdpM', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMDU3NjAsImV4cCI6MTY0Mjg2OTc2MCwiaWF0IjoxNjQyMDA1NzYwfQ.bQWmTRr8B_gNJV3Koe6OL7hU0aXEW1SIBpxLDUR089Q', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMDY0MjQsImV4cCI6MTY0Mjg3MDQyNCwiaWF0IjoxNjQyMDA2NDI0fQ.DUEOtk9XWeOQgvMMRwxdiDUaa7ZwQK7oeJbReikoqWQ', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMzA2NDUsImV4cCI6MTY0Mjg5NDY0NSwiaWF0IjoxNjQyMDMwNjQ1fQ.VoOw_dgUGL04fnGoJlbpX53BiT922UfWdXML-_9oyEI', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMzg0ODksImV4cCI6MTY0MjkwMjQ4OSwiaWF0IjoxNjQyMDM4NDg5fQ.lYg9BEJoR1YDyjDzoh2dMqykG7kjA_XsaGF0BeTu1CU', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMzM5NTksImV4cCI6MTY0Mjg5Nzk1OSwiaWF0IjoxNjQyMDMzOTU5fQ.wWF_KLIteV3viAdQ9-UcTmBEowF-etrSZbHama0Wpb8', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMzMwNDIsImV4cCI6MTY0Mjg5NzA0MiwiaWF0IjoxNjQyMDMzMDQyfQ.rc8dLu6escgg24GXhlLtK1NBTSug7_mOhjmLCa3Bris', 1, NULL, NULL, '0001-01-01 00:00:00'),
('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOSVNUUkFUT1IiLCJuYmYiOjE2NDIwMzMyNjksImV4cCI6MTY0Mjg5NzI2OSwiaWF0IjoxNjQyMDMzMjY5fQ.xMfoEyXF5tMvJ1NknTVOKO8uNcBb-fJ-V2se692xg3A', 1, NULL, NULL, '0001-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `phieunhapsanpham`
--

CREATE TABLE `phieunhapsanpham` (
  `MAPHIEUNHAP` int(11) NOT NULL,
  `MASANPHAM` int(11) NOT NULL,
  `MANHACUNGCAP` int(11) NOT NULL,
  `SOLUONGNHAP` int(11) NOT NULL,
  `NGAYNHAP` datetime NOT NULL,
  `TIENNHAP` float NOT NULL,
  `GHICHU` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phivanchuyen`
--

CREATE TABLE `phivanchuyen` (
  `maphivanchuyen` int(11) NOT NULL,
  `khoangcachmin` int(11) NOT NULL,
  `khoangcachmax` int(11) DEFAULT NULL,
  `chiphi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phivanchuyen`
--

INSERT INTO `phivanchuyen` (`maphivanchuyen`, `khoangcachmin`, `khoangcachmax`, `chiphi`) VALUES
(5, 0, 20, 0),
(6, 20, 50, 20000),
(7, 50, 200, 30000),
(8, 200, 1000, 40000),
(9, 1000, 100000, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MASANPHAM` int(11) NOT NULL,
  `TENSANPHAM` varchar(100) NOT NULL,
  `MALOAI` int(11) NOT NULL,
  `MATHUONGHIEU` int(11) NOT NULL,
  `MOTA` longtext DEFAULT NULL,
  `IMAGE` text DEFAULT NULL,
  `THOIDIEMRAMAT` datetime DEFAULT NULL,
  `DONGIA` float DEFAULT NULL,
  `THOIGIANBAOHANH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MASANPHAM`, `TENSANPHAM`, `MALOAI`, `MATHUONGHIEU`, `MOTA`, `IMAGE`, `THOIDIEMRAMAT`, `DONGIA`, `THOIGIANBAOHANH`) VALUES
(67, 'iphone 13', 1, 1, '<h3>Trong khi sức hút đ&ecirc;́n từ b&ocirc;̣ 4 phi&ecirc;n bản&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-12\" target=\"_blank\" title=\"Tham khảo điện thoại iPhone 12 chính hãng tại Thegioididong.com \">iPhone 12</a>&nbsp;v&acirc;̃n chưa ngu&ocirc;̣i đi, th&igrave;&nbsp;<a href=\"https://www.thegioididong.com/apple\" target=\"_blank\" title=\"Tham khảo sản phẩm Apple chính hãng tại Thegioididong.com \">Apple</a>&nbsp;đ&atilde; mang đến cho người d&ugrave;ng một si&ecirc;u phẩm mới iPhone 13 -&nbsp;<a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" title=\"Tham khảo điện thoại chính hãng tại Thegioididong.com \">điện thoại</a>&nbsp;c&oacute; nhiều cải tiến th&uacute; vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người d&ugrave;ng.</h3>\n\n<h3>Hiệu năng vượt trội nhờ chip Apple A15 Bionic</h3>\n\n<p>Con chip&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-apple-a15-bionic-suc-manh-cuc-khung-duoc-he-1339072\" title=\"Tìm hiểu về con chip Apple A15 Bionic\">Apple A15 Bionic</a>&nbsp;si&ecirc;u mạnh được sản xuất tr&ecirc;n quy tr&igrave;nh 5 nm gi&uacute;p&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-13\" title=\"Tham khảo điện thoại iPhone 13 chính hãng tại thegioididong.com\">iPhone 13</a>&nbsp;đạt hiệu năng ấn tượng, với CPU nhanh hơn 50%,&nbsp;GPU nhanh hơn 30% so với c&aacute;c đối thủ trong c&ugrave;ng ph&acirc;n kh&uacute;c.</p>\n\n<p><a href=\"https://www.thegioididong.com/images/42/223602/iphone-13-1-1.jpg\" onclick=\"return false;\"><img alt=\"Chip Apple A15 Bionic mạnh mẽ - iPhone 13 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-1-1.jpg\" title=\"Chip Apple A15 Bionic mạnh mẽ - iPhone 13 128GB\" /></a></p>\n\n<p>Nhờ hiệu năng được cải tiến, người d&ugrave;ng c&oacute; được những trải nghiệm tốt hơn tr&ecirc;n điện thoại khi d&ugrave;ng c&aacute;c ứng dụng chỉnh sửa ảnh hay chiến c&aacute;c tựa game đồ họa cao mượt m&agrave;.</p>\n\n<p><a href=\"https://www.thegioididong.com/images/42/223602/iphone-13-2.jpg\" onclick=\"return false;\"><img alt=\"Đồ họa mượt mà - iPhone 13 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-2.jpg\" title=\"Đồ họa mượt mà - iPhone 13 128GB\" /></a></p>\n\n<p>iPhone 13 trang bị&nbsp;<a href=\"https://www.thegioididong.com/dtdd-rom-128gb\" target=\"_blank\" title=\"Tham khảo điện thoại có bộ nhớ trong 128 GB tại Thegioididong.com\">bộ nhớ trong 128 GB</a>&nbsp;dung lượng l&yacute; tưởng&nbsp;cho ph&eacute;p bạn thỏa th&iacute;ch lưu trữ mọi nội dung theo &yacute; muốn m&agrave; kh&ocirc;ng lo nhanh đầy bộ nhớ.</p>\n\n<p><a href=\"https://www.thegioididong.com/images/42/223602/iphone-13-19.jpg\" onclick=\"return false;\"><img alt=\"Dung lượng bộ nhớ - iPhone 13 128GB\" src=\"https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-19.jpg\" title=\"Dung lượng bộ nhớ - iPhone 13 128GB\" /></a></p>\n\n<h3>Tốc độ 5G tốt hơn&nbsp;</h3>\n\n<p>Mạng 5G được cải thiện chất lượng với nhiều băng tần hơn, với 5G gi&uacute;p điện thoại xem trực tuyến hay tải xuống c&aacute;c ứng dụng v&agrave; t&agrave;i liệu đều đạt tốc độ nhanh ch&oacute;ng. Kh&ocirc;ng chỉ vậy, si&ecirc;u phẩm mới n&agrave;y c&ograve;n c&oacute; chế độ dữ liệu th&ocirc;ng minh, tự động ph&aacute;t hiện v&agrave; giảm tải tốc độ mạng để tiết kiệm năng lượng khi kh&ocirc;ng cần d&ugrave;ng tốc độ cao.</p>\n', '/mobile/Apple/iphone/13', '2022-01-02 07:00:00', 20000000, 2),
(68, 'Samsung Galaxy Note 20', 1, 2, '<h3>Th&aacute;ng 8/2020,&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-note-20\" target=\"_blank\" title=\"Tham khảo mẫu điện thoại tại Thế Giới Di Động\" type=\"Tham khảo mẫu điện thoại tại Thế Giới Di Động\">Galaxy Note 20</a>&nbsp;ch&iacute;nh thức được l&ecirc;n kệ, với thiết kế camera trước nốt ruồi quen thuộc, cụm camera h&igrave;nh chữ nhật mới lạ c&ugrave;ng với vi xử l&yacute; Exynos 990 cao cấp của ch&iacute;nh&nbsp;<a href=\"https://thegioididong.com/samsung\" target=\"_blank\" title=\"Tham khảo sản phẩm Samsung kinh doanh tại Thegioididong.com\" type=\"Tham khảo sản phẩm Samsung kinh doanh tại Thegioididong.com\">Samsung</a>&nbsp;chắc hẳn sẽ mang lại một trải nghiệm th&uacute; vị c&ugrave;ng hiệu năng mạnh mẽ.</h3>\n\n<h3>Camera cụm h&igrave;nh chữ nhật độc đ&aacute;o c&ugrave;ng thiết kế mạnh mẽ</h3>\n\n<p><a href=\"https://www.thegioididong.com/dtdd\" target=\"_blank\" title=\"Tham khảo điện thoại kinh doanh tại Thế Giới Di Động\">Điện thoại</a>&nbsp;sở hữu thiết kế khung kim loại chắc chắn, mặt lưng nhựa b&oacute;ng bẩy, kiểu d&aacute;ng mạnh mẽ với những g&oacute;c cạnh vu&ocirc;ng vức nhưng vẫn mang lại cảm gi&aacute;c cầm nắm thoải m&aacute;i.</p>\n\n<p><a href=\"https://www.thegioididong.com/images/42/218355/samsung-galaxy-note-20-235720-125702.jpg\" onclick=\"return false;\"><img alt=\"Thiết kế mặt lưng nhám sang trọng - Samsung Galaxy Note 20\" src=\"https://cdn.tgdd.vn/Products/Images/42/218355/samsung-galaxy-note-20-235720-125702.jpg\" title=\"Thiết kế mặt lưng nhám sang trọng - Samsung Galaxy Note 20\" /></a></p>\n\n<p>Camera của Galaxy Note 20&nbsp;được thiết kế trong cụm h&igrave;nh chữ nhật được đặt gọn ở ph&iacute;a sau bao gồm 1 camera ch&iacute;nh 64 MP, camera g&oacute;c si&ecirc;u rộng 12 MP v&agrave; camera tele 12 MP hỗ trợ người d&ugrave;ng dễ d&agrave;ng lưu lại sắc n&eacute;t những khoảng khắc đ&aacute;ng nhớ c&ugrave;ng gia đ&igrave;nh v&agrave; bạn b&egrave;.</p>\n\n<p><a href=\"https://www.thegioididong.com/images/42/218355/samsung-galaxy-note-20-235520-015514.jpg\" onclick=\"return false;\"><img alt=\"Cụm 3 camera sau - Samsung Galaxy Note 20\" src=\"https://cdn.tgdd.vn/Products/Images/42/218355/samsung-galaxy-note-20-235520-015514.jpg\" title=\"Cụm 3 camera sau - Samsung Galaxy Note 20\" /></a></p>\n\n<p>Camera Galaxy Note 20 hỗ trợ zoom đến 30x ở chế độ chụp b&igrave;nh thường, trong khi đ&oacute;, ở chế độ chụp ban đ&ecirc;m, m&aacute;y vẫn hỗ trợ zoom đến 10x, chi tiết trong điều kiện thiếu s&aacute;ng nhiều nhưng vẫn cho chất lượng h&igrave;nh tốt v&agrave; chi tiết.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p><img src=\"https://cdn.tgdd.vn/Products/Images/42/218355/samsung-galaxy-note-20-224320-024303.jpg\" />Ảnh chụp g&oacute;c thường 1x tr&ecirc;n Galaxy Note 20</p>\n', '/mobile/Samsung/Samsung/Galaxy Note 20', '2022-01-02 07:00:00', 15000000, 1),
(69, 'Vivo V23e', 1, 4, 'null', '/mobile/Vivo/Vivo/V23e', '2022-01-02 07:00:00', 8500000, 1),
(71, 'Samsung Galaxy S21', 1, 2, 'null', '/mobile/Samsung/Samsung/Galaxy S21', '2022-01-10 07:00:00', 10000000, 3),
(72, 'xiaomi 12 pro', 1, 5, 'null', '/mobile/Xiaomi/xiaomi/12 pro', '2022-01-10 07:00:00', 7000000, 1),
(73, 'OPPO F11', 1, 3, 'null', '/mobile/Oppo/OPPO/F11', '2022-01-12 07:00:00', 6000000, 2),
(74, 'vsmart active 3', 1, 7, 'null', '/mobile/Vsmart/vsmart/active 3', '2022-01-12 07:00:00', 3000000, 2),
(75, 'oppo reno 3 pro', 1, 3, 'null', '/mobile/Oppo/oppo/reno 3 pro', '2022-01-12 07:00:00', 5000000, 2),
(76, 'asus gaming', 2, 10, 'null', '/laptop/ASUS/asus/gaming', '2022-01-12 07:00:00', 20000000, 2),
(78, 'Dell latitude', 2, 16, 'null', '/laptop/Dell/Dell/latitude', '2022-01-12 07:00:00', 20000000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoankhachhang`
--

CREATE TABLE `taikhoankhachhang` (
  `USERNAME` varchar(300) DEFAULT NULL,
  `PASSWORD` varchar(300) DEFAULT NULL,
  `MAKHACHHANG` int(11) NOT NULL,
  `KICHHOAT` tinyint(4) DEFAULT NULL,
  `GOOGLEID` varchar(300) DEFAULT NULL,
  `TOKENEMAIL` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taikhoankhachhang`
--

INSERT INTO `taikhoankhachhang` (`USERNAME`, `PASSWORD`, `MAKHACHHANG`, `KICHHOAT`, `GOOGLEID`, `TOKENEMAIL`) VALUES
('huy', 'huy', 41, 1, '110096396072922567361', NULL),
('hung', 'hung', 43, 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQzIiwibmJmIjoxNjQxNjU1OTA1LCJleHAiOjE2NDE3NDIzMDUsImlhdCI6MTY0MTY1NTkwNX0.NnSUShappAm4I6TJ7hxoNFg5fzQn43uu3tnxsHhxnYQ'),
('phong', 'phong', 44, 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ0IiwibmJmIjoxNjQxNjU4MTU0LCJleHAiOjE2NDE3NDQ1NTQsImlhdCI6MTY0MTY1ODE1NH0.Fom_9a1AOeKVyfXpIkdMjZ1cIcJfWEfgTz90JFSZfBI');

-- --------------------------------------------------------

--
-- Table structure for table `taikhoannhanvien`
--

CREATE TABLE `taikhoannhanvien` (
  `USERNAME` varchar(300) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `MANHANVIEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taikhoannhanvien`
--

INSERT INTO `taikhoannhanvien` (`USERNAME`, `PASSWORD`, `MANHANVIEN`) VALUES
('admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thongsokithuat`
--

CREATE TABLE `thongsokithuat` (
  `MATHONGSO` int(11) NOT NULL,
  `MASANPHAM` int(11) NOT NULL,
  `TEN` varchar(45) DEFAULT NULL,
  `NOIDUNG` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thongsokithuat`
--

INSERT INTO `thongsokithuat` (`MATHONGSO`, `MASANPHAM`, `TEN`, `NOIDUNG`) VALUES
(235, 67, 'Màn hình', 'OLED6.1\"Super Retina XDR'),
(236, 67, 'Hệ điều hành:', 'iOS 15'),
(237, 67, 'Camera sau:', '2 camera 12 MP'),
(238, 67, 'Camera trước:', '12 MP'),
(239, 67, 'Chip', 'Apple A15 Bionic'),
(240, 67, 'RAM', '4 GB'),
(241, 67, 'Bộ nhớ trong:', '128 GB'),
(242, 67, 'SIM:', '1 Nano SIM & 1 eSIMHỗ trợ 5G'),
(243, 67, 'Pin, Sạc:', '3240 mAh20 W');

-- --------------------------------------------------------

--
-- Table structure for table `thuonghieu`
--

CREATE TABLE `thuonghieu` (
  `MATHUONGHIEU` int(11) NOT NULL,
  `TENTHUONGHIEU` varchar(30) NOT NULL,
  `XUATXU` varchar(30) DEFAULT NULL,
  `IMAGE` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thuonghieu`
--

INSERT INTO `thuonghieu` (`MATHUONGHIEU`, `TENTHUONGHIEU`, `XUATXU`, `IMAGE`) VALUES
(1, 'Apple', 'Mỹ', '/thuonghieu'),
(2, 'Samsung', 'Hàn quốc', '/thuonghieu'),
(3, 'Oppo', 'Trung quốc', '/thuonghieu'),
(4, 'Vivo', 'Trung quốc', '/thuonghieu'),
(5, 'Xiaomi', 'Trung quốc', '/thuonghieu'),
(6, 'Sony', 'Nhật bản', '/thuonghieu'),
(7, 'Vsmart', 'Việt nam', '/thuonghieu'),
(8, 'NOKIA', 'Trung quốc', '/thuonghieu'),
(9, 'Realme', 'Trung quốc', '/thuonghieu'),
(10, 'ASUS', 'Đài loan', '/thuonghieu'),
(11, 'Oneplus', 'Trung quốc', '/thuonghieu'),
(16, 'Dell', 'Myx', '/thuonghieu');

-- --------------------------------------------------------

--
-- Table structure for table `truycapandanh`
--

CREATE TABLE `truycapandanh` (
  `MATRUYCAP` int(11) NOT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `THOIDIEM` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `truycapandanh`
--

INSERT INTO `truycapandanh` (`MATRUYCAP`, `IP`, `THOIDIEM`) VALUES
(26, '1.52.203.189', '2021-12-31 03:17:32'),
(27, '202.60.105.229', '2021-12-31 03:17:46'),
(28, '27.71.216.10', '2021-12-31 04:38:32'),
(29, '14.179.225.55', '2021-12-31 12:38:17'),
(30, '14.179.225.55', '2021-12-31 06:14:44'),
(31, '14.179.225.55', '2021-12-31 06:28:08'),
(32, '14.179.225.55', '2021-12-31 06:28:20'),
(33, '14.179.225.55', '2021-12-31 06:28:26'),
(34, '14.179.225.55', '2021-12-31 14:33:58'),
(35, '27.71.216.10', '2021-12-31 08:10:00'),
(36, '14.179.225.55', '2021-12-31 09:12:17'),
(37, '14.179.225.55', '2021-12-31 16:26:36'),
(38, '113.165.173.14', '2021-12-31 09:39:53'),
(39, '27.71.216.10', '2021-12-31 10:02:34'),
(40, '27.71.216.10', '2021-12-31 10:04:31'),
(41, '27.71.216.10', '2021-12-31 10:12:55'),
(42, '27.71.216.10', '2021-12-31 10:13:02'),
(43, '1.52.203.189', '2021-12-31 10:13:02'),
(44, '27.71.216.10', '2021-12-31 10:13:18'),
(45, '1.52.203.189', '2021-12-31 10:13:29'),
(46, '27.71.216.10', '2021-12-31 10:15:04'),
(47, '1.52.203.189', '2021-12-31 10:23:00'),
(48, '27.71.216.10', '2021-12-31 10:31:59'),
(49, '27.71.216.10', '2021-12-31 10:39:14'),
(50, '1.52.203.189', '2021-12-31 11:03:09'),
(51, '1.52.203.189', '2021-12-31 11:08:34'),
(52, '1.52.203.189', '2021-12-31 11:08:43'),
(53, '1.52.203.189', '2021-12-31 11:10:50'),
(54, '1.52.203.189', '2021-12-31 11:19:29'),
(55, '27.71.216.10', '2021-12-31 11:19:50'),
(56, '1.52.203.189', '2021-12-31 11:30:09'),
(57, '14.179.225.55', '2021-12-31 19:10:28'),
(58, '14.179.225.55', '2021-12-31 19:12:16'),
(59, '14.179.225.55', '2021-12-31 13:23:37'),
(60, '14.179.225.55', '2021-12-31 20:26:07'),
(61, '14.179.225.55', '2021-12-31 13:29:26'),
(62, '14.179.225.55', '2021-12-31 13:30:04'),
(63, '27.71.216.10', '2021-12-31 13:41:50'),
(64, '27.71.216.10', '2021-12-31 13:47:23'),
(65, '27.71.216.10', '2021-12-31 13:51:08'),
(66, '1.52.203.189', '2021-12-31 13:52:20'),
(67, '27.71.216.10', '2021-12-31 13:56:33'),
(68, '27.71.216.10', '2021-12-31 14:00:31'),
(69, '1.52.203.189', '2021-12-31 14:09:40'),
(70, '113.165.173.14', '2021-12-31 14:19:13'),
(71, '1.52.203.189', '2021-12-31 14:30:34'),
(72, '113.165.173.14', '2021-12-31 14:35:27'),
(73, '27.71.216.10', '2021-12-31 14:39:04'),
(74, '113.165.173.14', '2021-12-31 14:40:01'),
(75, '27.71.216.10', '2021-12-31 14:42:27'),
(76, '116.111.214.53', '2021-12-31 14:43:30'),
(77, '116.111.214.53', '2021-12-31 14:43:54'),
(78, '27.71.216.10', '2021-12-31 14:44:19'),
(79, '116.111.214.53', '2021-12-31 14:45:19'),
(80, '113.165.173.14', '2021-12-31 14:45:48'),
(81, '27.71.216.10', '2021-12-31 14:46:31'),
(82, '27.71.216.10', '2021-12-31 14:46:59'),
(83, '1.52.203.189', '2021-12-31 14:47:45'),
(84, '116.111.214.53', '2021-12-31 14:48:33'),
(85, '1.52.203.189', '2021-12-31 14:48:58'),
(86, '1.52.203.189', '2021-12-31 14:49:14'),
(87, '113.165.173.14', '2021-12-31 15:02:27'),
(88, '113.165.173.14', '2021-12-31 15:07:35'),
(89, '113.165.173.14', '2021-12-31 15:08:54'),
(90, '14.179.225.55', '2021-12-31 22:17:55'),
(91, '27.71.216.10', '2021-12-31 15:21:43'),
(92, '14.179.225.55', '2021-12-31 22:27:02'),
(93, '14.179.225.55', '2021-12-31 22:27:08'),
(94, '27.71.216.10', '2021-12-31 15:29:04'),
(95, '14.179.225.55', '2021-12-31 22:31:02'),
(96, '14.179.225.55', '2021-12-31 22:36:56'),
(97, '27.71.216.10', '2021-12-31 15:37:27'),
(98, '27.71.216.10', '2021-12-31 15:41:59'),
(99, '27.71.216.10', '2021-12-31 15:46:28'),
(100, '14.179.225.55', '2021-12-31 23:02:05'),
(101, '14.179.225.55', '2021-12-31 23:02:11'),
(102, '1.52.203.189', '2021-12-31 16:08:47'),
(103, '113.165.173.14', '2021-12-31 16:16:17'),
(104, '113.165.173.14', '2021-12-31 16:32:58'),
(105, '27.71.216.10', '2021-12-31 16:49:19'),
(106, '14.179.225.55', '2021-12-31 17:13:05'),
(107, '14.179.225.55', '2021-12-31 17:14:03'),
(108, '14.179.225.55', '2021-12-31 17:41:49'),
(109, '14.179.225.55', '2021-12-31 18:16:43'),
(110, '116.111.214.53', '2021-12-31 18:26:06'),
(111, '116.111.214.53', '2021-12-31 18:26:21'),
(112, '116.111.214.53', '2021-12-31 18:49:09'),
(113, '116.111.214.53', '2021-12-31 18:50:22'),
(114, '14.179.225.55', '2021-12-31 18:55:07'),
(115, '113.165.173.14', '2021-12-31 19:06:54'),
(116, '113.165.173.14', '2021-12-31 19:41:42'),
(117, '116.111.214.53', '2021-12-31 19:48:20'),
(118, '116.111.214.53', '2021-12-31 20:57:11'),
(119, '113.165.173.14', '2021-12-31 23:50:41'),
(120, '116.111.214.53', '2022-01-02 12:28:29'),
(121, '116.111.214.53', '2022-01-02 12:29:44'),
(122, '116.111.214.53', '2022-01-02 12:33:58'),
(123, '116.111.214.53', '2022-01-02 12:34:38'),
(124, '116.111.214.53', '2022-01-02 12:36:00'),
(125, '116.111.214.53', '2022-01-02 12:53:57'),
(126, '116.111.214.53', '2022-01-02 13:00:47'),
(127, '116.111.214.53', '2022-01-02 13:00:48'),
(128, '116.111.214.53', '2022-01-02 13:00:51'),
(129, '116.111.214.53', '2022-01-02 13:01:26'),
(130, '116.111.214.53', '2022-01-02 13:01:27'),
(131, '116.111.214.53', '2022-01-02 13:01:30'),
(132, '116.111.214.53', '2022-01-02 13:01:34'),
(133, '116.111.214.53', '2022-01-02 13:03:04'),
(134, '116.111.214.53', '2022-01-02 13:08:40'),
(135, '116.111.214.53', '2022-01-02 13:09:11'),
(136, '116.111.214.53', '2022-01-02 13:10:03'),
(137, '116.111.214.53', '2022-01-02 13:11:12'),
(138, '116.111.214.53', '2022-01-02 13:11:32'),
(139, '116.111.214.53', '2022-01-02 13:13:44'),
(140, '116.111.214.53', '2022-01-02 13:17:01'),
(141, '116.111.214.53', '2022-01-02 13:18:47'),
(142, '116.111.214.53', '2022-01-02 13:24:03'),
(143, '116.111.214.53', '2022-01-02 13:25:01'),
(144, '116.111.214.53', '2022-01-02 13:25:02'),
(145, '116.111.214.53', '2022-01-02 13:25:12'),
(146, '116.111.214.53', '2022-01-02 13:25:13'),
(147, '116.111.214.53', '2022-01-02 13:25:23'),
(148, '116.111.214.53', '2022-01-02 13:25:24'),
(149, '116.111.214.53', '2022-01-02 13:25:29'),
(150, '116.111.214.53', '2022-01-02 13:25:30'),
(151, '116.111.214.53', '2022-01-02 13:25:33'),
(152, '116.111.214.53', '2022-01-02 13:25:35'),
(153, '116.111.214.53', '2022-01-02 13:30:34'),
(154, '116.111.214.53', '2022-01-02 13:30:35'),
(155, '116.111.214.53', '2022-01-02 13:30:41'),
(156, '116.111.214.53', '2022-01-02 13:32:27'),
(157, '116.111.214.53', '2022-01-02 13:34:21'),
(158, '116.111.214.53', '2022-01-02 13:34:32'),
(159, '116.111.214.53', '2022-01-02 13:36:53'),
(160, '116.111.214.53', '2022-01-02 13:37:32'),
(161, '116.111.214.53', '2022-01-02 13:39:00'),
(162, '116.111.214.53', '2022-01-02 13:39:16'),
(163, '116.111.214.53', '2022-01-02 13:39:23'),
(164, '116.111.214.53', '2022-01-02 13:39:25'),
(165, '116.111.214.53', '2022-01-02 13:39:34'),
(166, '116.111.214.53', '2022-01-02 13:41:21'),
(167, '116.111.214.53', '2022-01-02 13:41:34'),
(168, '116.111.214.53', '2022-01-02 13:41:37'),
(169, '116.111.214.53', '2022-01-02 13:42:53'),
(170, '116.111.214.53', '2022-01-02 13:43:10'),
(171, '116.111.214.53', '2022-01-02 13:44:14'),
(172, '116.111.214.53', '2022-01-02 13:45:37'),
(173, '116.111.214.53', '2022-01-02 13:46:06'),
(174, '116.111.214.53', '2022-01-02 13:47:04'),
(175, '116.111.214.53', '2022-01-02 13:48:08'),
(176, '116.111.214.53', '2022-01-02 13:48:53'),
(177, '116.111.214.53', '2022-01-02 13:50:40'),
(178, '116.111.214.53', '2022-01-02 13:51:46'),
(179, '116.111.214.53', '2022-01-02 13:52:03'),
(180, '116.111.214.53', '2022-01-02 13:53:51'),
(181, '116.111.214.53', '2022-01-02 13:54:16'),
(182, '116.111.214.53', '2022-01-02 13:54:59'),
(183, '116.111.214.53', '2022-01-02 13:55:01'),
(184, '116.111.214.53', '2022-01-02 13:57:43'),
(185, '116.111.214.53', '2022-01-02 14:03:38'),
(186, '116.111.214.53', '2022-01-02 14:04:19'),
(187, '116.111.214.53', '2022-01-02 14:05:03'),
(188, '116.111.214.53', '2022-01-02 14:05:17'),
(189, '116.111.214.53', '2022-01-02 14:12:29'),
(190, '116.111.214.53', '2022-01-02 14:13:02'),
(191, '116.111.214.53', '2022-01-02 14:13:23'),
(192, '116.111.214.53', '2022-01-02 14:15:49'),
(193, '116.111.214.53', '2022-01-02 14:18:10'),
(194, '116.111.214.53', '2022-01-02 14:19:35'),
(195, '116.111.214.53', '2022-01-02 14:20:23'),
(196, '116.111.214.53', '2022-01-02 14:22:31'),
(197, '116.111.214.53', '2022-01-02 14:26:32'),
(198, '116.111.214.53', '2022-01-02 14:28:31'),
(199, '116.111.214.53', '2022-01-02 14:29:18'),
(200, '116.111.214.53', '2022-01-02 14:30:26'),
(201, '116.111.214.53', '2022-01-02 14:31:11'),
(202, '116.111.214.53', '2022-01-02 14:31:22'),
(203, '116.111.214.53', '2022-01-02 14:35:39'),
(204, '116.111.214.53', '2022-01-02 14:35:44'),
(205, '116.111.214.53', '2022-01-02 14:37:33'),
(206, '116.111.214.53', '2022-01-02 15:10:41'),
(207, '116.111.214.53', '2022-01-02 15:29:37'),
(208, '116.111.214.53', '2022-01-02 15:31:55'),
(209, '116.111.214.53', '2022-01-02 15:36:37'),
(210, '116.111.214.53', '2022-01-02 15:36:41'),
(211, '116.111.214.53', '2022-01-02 15:38:15'),
(212, '116.111.214.53', '2022-01-02 15:38:19'),
(213, '116.111.214.53', '2022-01-02 15:41:34'),
(214, '116.111.214.53', '2022-01-02 15:43:05'),
(215, '116.111.214.53', '2022-01-02 15:44:34'),
(216, '116.111.214.53', '2022-01-02 15:44:36'),
(217, '116.111.214.53', '2022-01-02 15:45:24'),
(218, '116.111.214.53', '2022-01-02 15:47:28'),
(219, '116.111.214.53', '2022-01-02 15:52:08'),
(220, '116.111.214.53', '2022-01-02 15:52:18'),
(221, '116.111.214.53', '2022-01-02 15:52:59'),
(222, '116.111.214.53', '2022-01-02 15:54:11'),
(223, '116.111.214.53', '2022-01-02 15:54:54'),
(224, '116.111.214.53', '2022-01-02 15:55:27'),
(225, '116.111.214.53', '2022-01-02 15:57:43'),
(226, '116.111.214.53', '2022-01-02 15:58:37'),
(227, '116.111.214.53', '2022-01-02 16:02:49'),
(228, '116.111.214.53', '2022-01-02 16:03:28'),
(229, '116.111.214.53', '2022-01-02 16:04:25'),
(230, '116.111.214.53', '2022-01-02 16:09:32'),
(231, '116.111.214.53', '2022-01-02 16:19:28'),
(232, '116.111.214.53', '2022-01-02 16:22:00'),
(233, '116.111.214.53', '2022-01-02 16:23:39'),
(234, '116.111.214.53', '2022-01-02 16:26:15'),
(235, '116.111.214.53', '2022-01-02 16:27:36'),
(236, '116.111.214.53', '2022-01-02 16:27:49'),
(237, '116.111.214.53', '2022-01-02 16:28:59'),
(238, '116.111.214.53', '2022-01-02 16:29:57'),
(239, '116.111.214.53', '2022-01-02 16:31:31'),
(240, '116.111.214.53', '2022-01-02 16:33:05'),
(241, '116.111.214.53', '2022-01-02 16:33:59'),
(242, '116.111.214.53', '2022-01-02 16:35:27'),
(243, '116.111.214.53', '2022-01-02 16:37:23'),
(244, '116.111.214.53', '2022-01-02 16:42:07'),
(245, '116.111.214.53', '2022-01-02 16:42:12'),
(246, '116.111.214.53', '2022-01-02 16:42:47'),
(247, '116.111.214.53', '2022-01-02 16:44:06'),
(248, '116.111.214.53', '2022-01-02 16:48:22'),
(249, '116.111.214.53', '2022-01-02 16:52:37'),
(250, '116.111.214.53', '2022-01-02 16:53:31'),
(251, '116.111.214.53', '2022-01-02 16:56:26'),
(252, '116.111.214.53', '2022-01-02 16:58:49'),
(253, '116.111.214.53', '2022-01-02 17:02:07'),
(254, '116.111.214.53', '2022-01-02 17:02:19'),
(255, '116.111.214.53', '2022-01-02 17:02:28'),
(256, '116.111.214.53', '2022-01-02 17:02:31'),
(257, '116.111.214.53', '2022-01-02 17:03:37'),
(258, '116.111.214.53', '2022-01-02 17:04:27'),
(259, '116.111.214.53', '2022-01-02 17:05:08'),
(260, '116.111.214.53', '2022-01-02 17:05:19'),
(261, '116.111.214.53', '2022-01-02 17:05:22'),
(262, '116.111.214.53', '2022-01-02 17:06:35'),
(263, '116.111.214.53', '2022-01-02 17:06:39'),
(264, '116.111.214.53', '2022-01-02 17:06:53'),
(265, '116.111.214.53', '2022-01-02 17:07:52'),
(266, '116.111.214.53', '2022-01-02 17:08:17'),
(267, '116.111.214.53', '2022-01-02 17:09:41'),
(268, '116.111.214.53', '2022-01-02 17:10:33'),
(269, '116.111.214.53', '2022-01-02 17:15:00'),
(270, '116.111.214.53', '2022-01-02 17:16:25'),
(271, '116.111.214.53', '2022-01-02 17:17:17'),
(272, '116.111.214.53', '2022-01-02 17:17:59'),
(273, '116.111.214.53', '2022-01-02 17:23:53'),
(274, '116.111.214.53', '2022-01-02 17:24:04'),
(275, '116.111.214.53', '2022-01-02 17:29:50'),
(276, '116.111.214.53', '2022-01-02 17:31:28'),
(277, '116.111.214.53', '2022-01-02 17:33:15'),
(278, '116.111.214.53', '2022-01-02 17:33:15'),
(279, '116.111.214.53', '2022-01-02 17:33:16'),
(280, '116.111.214.53', '2022-01-02 17:36:18'),
(281, '116.111.214.53', '2022-01-02 17:37:43'),
(282, '116.111.214.53', '2022-01-02 17:37:43'),
(283, '116.111.214.53', '2022-01-02 17:41:24'),
(284, '116.111.214.53', '2022-01-02 17:41:32'),
(285, '116.111.214.53', '2022-01-02 17:42:54'),
(286, '116.111.214.53', '2022-01-02 17:43:07'),
(287, '116.111.214.53', '2022-01-02 17:44:09'),
(288, '116.111.214.53', '2022-01-02 17:44:20'),
(289, '116.111.214.53', '2022-01-02 17:46:34'),
(290, '116.111.214.53', '2022-01-02 17:46:50'),
(291, '116.111.214.53', '2022-01-02 17:47:23'),
(292, '116.111.214.53', '2022-01-02 17:48:50'),
(293, '116.111.214.53', '2022-01-02 17:53:41'),
(294, '116.111.214.53', '2022-01-02 17:58:21'),
(295, '116.111.214.53', '2022-01-02 18:00:28'),
(296, '116.111.214.53', '2022-01-02 18:02:16'),
(297, '116.111.214.53', '2022-01-02 18:03:40'),
(298, '116.111.214.53', '2022-01-02 18:08:40'),
(299, '116.111.214.53', '2022-01-02 18:15:11'),
(300, '116.111.214.53', '2022-01-02 18:16:37'),
(301, '116.111.214.53', '2022-01-02 18:17:21'),
(302, '116.111.214.53', '2022-01-02 18:18:11'),
(303, '116.111.214.53', '2022-01-02 18:19:08'),
(304, '116.111.214.53', '2022-01-02 18:19:53'),
(305, '116.111.214.53', '2022-01-02 18:22:41'),
(306, '116.111.214.53', '2022-01-02 18:24:42'),
(307, '116.111.214.53', '2022-01-02 18:25:04'),
(308, '116.111.214.53', '2022-01-02 18:30:32'),
(309, '116.111.214.53', '2022-01-02 18:30:32'),
(310, '116.111.214.53', '2022-01-02 18:30:37'),
(311, '116.111.214.53', '2022-01-02 18:31:43'),
(312, '116.111.214.53', '2022-01-02 18:35:01'),
(313, '116.111.214.53', '2022-01-02 18:36:13'),
(314, '116.111.214.53', '2022-01-02 18:37:50'),
(315, '116.111.214.53', '2022-01-02 18:37:54'),
(316, '116.111.214.53', '2022-01-02 18:38:13'),
(317, '116.111.214.53', '2022-01-02 18:39:42'),
(318, '116.111.214.53', '2022-01-02 18:40:08'),
(319, '116.111.214.53', '2022-01-02 18:40:12'),
(320, '116.111.214.53', '2022-01-02 18:40:57'),
(321, '116.111.214.53', '2022-01-02 18:41:39'),
(322, '116.111.214.53', '2022-01-02 18:42:34'),
(323, '116.111.214.53', '2022-01-02 18:42:39'),
(324, '116.111.214.53', '2022-01-02 18:42:57'),
(325, '116.111.214.53', '2022-01-02 18:44:52'),
(326, '116.111.214.53', '2022-01-02 18:50:41'),
(327, '116.111.214.53', '2022-01-02 19:06:30'),
(328, '116.111.214.53', '2022-01-02 19:10:31'),
(329, '116.111.214.53', '2022-01-02 19:10:34'),
(330, '116.111.214.53', '2022-01-02 19:10:37'),
(331, '116.111.214.53', '2022-01-02 19:13:02'),
(332, '116.111.214.53', '2022-01-02 19:13:35'),
(333, '116.111.214.53', '2022-01-02 19:13:59'),
(334, '116.111.214.53', '2022-01-03 01:54:10'),
(335, '116.111.214.53', '2022-01-03 02:17:40'),
(336, '116.111.214.53', '2022-01-03 02:23:28'),
(337, '116.103.173.100', '2022-01-08 16:10:04'),
(338, '116.103.173.100', '2022-01-08 16:14:13'),
(339, '116.103.173.100', '2022-01-08 16:14:54'),
(340, '116.103.173.100', '2022-01-08 16:17:06'),
(341, '116.103.173.100', '2022-01-08 16:19:41'),
(342, '116.103.173.100', '2022-01-08 16:24:31'),
(343, '116.103.173.100', '2022-01-08 16:29:42'),
(344, '116.103.173.100', '2022-01-08 16:29:43'),
(345, '116.103.173.100', '2022-01-08 16:29:50'),
(346, '116.103.173.100', '2022-01-08 16:29:53'),
(347, '116.103.173.100', '2022-01-08 16:29:55'),
(348, '116.103.173.100', '2022-01-08 16:30:18'),
(349, '116.103.173.100', '2022-01-08 16:31:28'),
(350, '116.103.173.100', '2022-01-08 16:32:32'),
(351, '116.103.173.100', '2022-01-08 16:35:44'),
(352, '116.103.173.100', '2022-01-08 16:36:42'),
(353, '116.103.173.100', '2022-01-08 16:38:31'),
(354, '116.103.173.100', '2022-01-08 16:38:53'),
(355, '116.103.173.100', '2022-01-08 16:41:12'),
(356, '116.103.173.100', '2022-01-08 18:33:40'),
(357, '116.103.173.100', '2022-01-08 20:54:30'),
(358, '116.103.173.100', '2022-01-08 21:13:40'),
(359, '116.103.173.100', '2022-01-08 22:06:35'),
(360, '116.103.173.100', '2022-01-08 22:17:31'),
(361, '116.103.173.100', '2022-01-08 22:19:48'),
(362, '116.103.173.100', '2022-01-08 22:20:07'),
(363, '116.103.173.100', '2022-01-08 22:20:28'),
(364, '116.103.173.100', '2022-01-08 22:23:19'),
(365, '116.103.173.100', '2022-01-08 22:23:56'),
(366, '116.103.173.100', '2022-01-08 22:27:03'),
(367, '116.103.173.100', '2022-01-08 22:29:15'),
(368, '116.103.173.100', '2022-01-08 22:29:41'),
(369, '116.103.173.100', '2022-01-08 22:29:49'),
(370, '116.103.173.100', '2022-01-08 22:29:56'),
(371, '116.103.173.100', '2022-01-08 22:30:20'),
(372, '116.103.173.100', '2022-01-08 22:36:11'),
(373, '116.103.173.100', '2022-01-08 22:36:43'),
(374, '116.103.173.100', '2022-01-08 22:37:34'),
(375, '116.103.173.100', '2022-01-08 22:41:59'),
(376, '116.103.173.100', '2022-01-08 22:42:24'),
(377, '116.103.173.100', '2022-01-08 22:47:57'),
(378, '116.103.173.100', '2022-01-08 22:47:57'),
(379, '116.103.173.100', '2022-01-08 22:49:06'),
(380, '116.103.173.100', '2022-01-08 22:49:07'),
(381, '116.103.173.100', '2022-01-08 22:50:04'),
(382, '116.103.173.100', '2022-01-08 22:50:05'),
(383, '116.103.173.100', '2022-01-08 22:51:37'),
(384, '116.103.173.100', '2022-01-08 22:57:35'),
(385, '116.103.173.100', '2022-01-08 22:57:35'),
(386, '116.103.173.100', '2022-01-08 22:57:40'),
(387, '116.103.173.100', '2022-01-08 22:58:09'),
(388, '116.103.173.100', '2022-01-08 22:58:23'),
(389, '116.103.173.100', '2022-01-08 22:59:22'),
(390, '116.103.173.100', '2022-01-08 23:06:30'),
(391, '116.103.173.100', '2022-01-08 23:08:10'),
(392, '116.103.173.100', '2022-01-08 23:22:51'),
(393, '116.103.173.100', '2022-01-08 23:26:25'),
(394, '116.103.173.100', '2022-01-08 23:26:34'),
(395, '116.103.173.100', '2022-01-08 23:31:42'),
(396, '116.103.173.100', '2022-01-08 23:34:42'),
(397, '116.103.173.100', '2022-01-08 23:43:52'),
(398, '116.103.173.100', '2022-01-08 23:48:11'),
(399, '116.103.173.100', '2022-01-08 23:55:02'),
(400, '116.103.173.100', '2022-01-08 23:56:03'),
(401, '116.103.173.100', '2022-01-08 23:57:29'),
(402, '116.103.173.100', '2022-01-08 23:58:02'),
(403, '116.103.173.100', '2022-01-09 00:02:33'),
(404, '116.103.173.100', '2022-01-09 00:04:33'),
(405, '116.103.173.100', '2022-01-09 00:13:41'),
(406, '116.103.173.100', '2022-01-09 00:14:39'),
(407, '116.103.173.100', '2022-01-09 00:15:22'),
(408, '116.103.173.100', '2022-01-09 01:02:35'),
(409, '116.103.173.100', '2022-01-09 01:02:37'),
(410, '116.103.173.100', '2022-01-09 01:12:02'),
(411, '116.103.173.100', '2022-01-09 01:24:16'),
(412, '116.103.173.100', '2022-01-09 01:54:13'),
(413, '116.103.173.100', '2022-01-09 01:57:07'),
(414, '116.103.173.100', '2022-01-09 02:01:47'),
(415, '116.103.173.100', '2022-01-09 02:07:54'),
(416, '116.103.173.100', '2022-01-09 02:08:35'),
(417, '116.103.173.100', '2022-01-09 02:09:54'),
(418, '116.103.173.100', '2022-01-09 02:24:26'),
(419, '116.103.173.100', '2022-01-09 02:24:49'),
(420, '116.103.173.100', '2022-01-09 02:25:43'),
(421, '116.103.173.100', '2022-01-09 02:28:23'),
(422, '116.103.173.100', '2022-01-09 02:32:49'),
(423, '116.103.173.100', '2022-01-09 02:34:49'),
(424, '116.103.173.100', '2022-01-09 02:34:59'),
(425, '116.103.173.100', '2022-01-09 02:36:00'),
(426, '116.103.173.100', '2022-01-09 02:36:10'),
(427, '116.103.173.100', '2022-01-09 02:36:13'),
(428, '116.103.173.100', '2022-01-09 02:36:15'),
(429, '116.103.173.100', '2022-01-09 02:36:17'),
(430, '116.103.173.100', '2022-01-09 02:36:19'),
(431, '116.103.173.100', '2022-01-09 07:59:50'),
(432, '116.103.173.100', '2022-01-09 08:00:23'),
(433, '116.103.173.100', '2022-01-09 09:14:55'),
(434, '116.103.173.100', '2022-01-09 09:23:00'),
(435, '116.103.173.100', '2022-01-09 09:23:36'),
(436, '116.103.173.100', '2022-01-09 13:41:47'),
(437, '116.103.173.100', '2022-01-09 13:41:48'),
(438, '116.103.173.100', '2022-01-09 13:41:51'),
(439, '116.103.173.100', '2022-01-09 14:02:27'),
(440, '116.103.173.100', '2022-01-09 14:05:47'),
(441, '116.103.173.100', '2022-01-09 14:05:58'),
(442, '116.103.173.100', '2022-01-09 16:22:38'),
(443, '116.103.173.100', '2022-01-09 17:36:10'),
(444, '116.103.173.100', '2022-01-09 17:36:19'),
(445, '116.103.173.100', '2022-01-09 17:36:55'),
(446, '116.103.173.100', '2022-01-09 21:32:01'),
(447, '116.103.173.100', '2022-01-09 21:41:12'),
(448, '116.103.173.100', '2022-01-09 21:47:42'),
(449, '116.103.173.100', '2022-01-09 23:02:42'),
(450, '116.103.173.100', '2022-01-09 23:04:09'),
(451, '116.103.173.100', '2022-01-10 11:22:00'),
(452, '116.103.173.100', '2022-01-10 11:37:05'),
(453, '116.103.173.100', '2022-01-10 13:25:37'),
(454, '116.103.173.100', '2022-01-10 15:10:41'),
(455, '116.103.173.100', '2022-01-10 15:12:17'),
(456, '116.103.173.100', '2022-01-10 15:24:58'),
(457, '116.103.173.100', '2022-01-10 15:53:47'),
(458, '116.103.173.100', '2022-01-10 15:57:45'),
(459, '116.103.173.100', '2022-01-10 16:10:01'),
(460, '116.103.173.100', '2022-01-10 16:10:03'),
(461, '116.103.173.100', '2022-01-10 16:10:05'),
(462, '116.103.173.100', '2022-01-10 16:28:12'),
(463, '116.103.173.100', '2022-01-10 16:39:02'),
(464, '116.103.173.100', '2022-01-10 16:41:31'),
(465, '116.103.173.100', '2022-01-10 17:30:36'),
(466, '116.103.173.100', '2022-01-10 17:30:58'),
(467, '116.103.173.100', '2022-01-10 17:32:40'),
(468, '116.103.173.100', '2022-01-10 17:39:53'),
(469, '116.103.173.100', '2022-01-10 17:41:22'),
(470, '116.103.173.100', '2022-01-10 17:43:24'),
(471, '116.103.173.100', '2022-01-10 21:42:18'),
(472, '116.103.173.100', '2022-01-10 21:53:34'),
(473, '116.103.173.100', '2022-01-10 21:59:53'),
(474, '116.103.173.100', '2022-01-10 22:56:59'),
(475, '116.103.173.100', '2022-01-10 23:25:47'),
(476, '116.103.173.100', '2022-01-10 23:29:15'),
(477, '116.103.173.100', '2022-01-10 23:43:58'),
(478, '116.103.173.100', '2022-01-10 23:46:21'),
(479, '116.103.173.100', '2022-01-10 23:48:41'),
(480, '116.103.173.100', '2022-01-10 23:50:18'),
(481, '116.103.173.100', '2022-01-10 23:58:22'),
(482, '116.103.173.100', '2022-01-11 01:36:54'),
(483, '116.103.173.100', '2022-01-11 01:45:11'),
(484, '116.103.173.100', '2022-01-11 08:17:18'),
(485, '116.103.173.100', '2022-01-11 08:25:38'),
(486, '116.103.173.100', '2022-01-11 08:43:31'),
(487, '116.103.173.100', '2022-01-11 09:45:13'),
(488, '116.103.173.100', '2022-01-11 09:50:38'),
(489, '116.103.173.100', '2022-01-11 09:50:41'),
(490, '116.103.173.100', '2022-01-11 09:51:03'),
(491, '116.103.173.100', '2022-01-11 09:51:33'),
(492, '116.103.173.100', '2022-01-11 10:29:16'),
(493, '116.103.173.100', '2022-01-11 10:30:38'),
(494, '116.103.173.100', '2022-01-11 10:32:44'),
(495, '116.103.173.100', '2022-01-11 10:32:57'),
(496, '116.103.173.100', '2022-01-11 10:33:00'),
(497, '116.103.173.100', '2022-01-11 10:34:43'),
(498, '116.103.173.100', '2022-01-11 10:34:54'),
(499, '116.103.173.100', '2022-01-11 10:35:21'),
(500, '116.103.173.100', '2022-01-11 10:40:41'),
(501, '116.103.173.100', '2022-01-11 10:49:39'),
(502, '116.103.173.100', '2022-01-11 10:50:22'),
(503, '116.103.173.100', '2022-01-11 10:52:55'),
(504, '116.103.173.100', '2022-01-11 10:56:54'),
(505, '116.103.173.100', '2022-01-11 10:59:20'),
(506, '116.103.173.100', '2022-01-11 11:05:25'),
(507, '116.103.173.100', '2022-01-11 11:05:31'),
(508, '116.103.173.100', '2022-01-11 11:08:51'),
(509, '116.103.173.100', '2022-01-11 11:10:48'),
(510, '116.103.173.100', '2022-01-11 11:42:00'),
(511, '116.103.173.100', '2022-01-11 11:42:03'),
(512, '116.103.173.100', '2022-01-11 11:42:06'),
(513, '116.103.173.100', '2022-01-11 11:42:09'),
(514, '116.103.173.100', '2022-01-11 11:42:25'),
(515, '116.103.173.100', '2022-01-11 11:43:41'),
(516, '116.103.173.100', '2022-01-11 11:48:34'),
(517, '116.103.173.100', '2022-01-11 11:51:21'),
(518, '116.110.224.51', '2022-01-11 18:54:10'),
(519, '116.110.224.51', '2022-01-11 20:03:10'),
(520, '116.110.224.51', '2022-01-11 20:41:22'),
(521, '116.110.224.51', '2022-01-11 21:23:42'),
(522, '116.110.224.51', '2022-01-11 21:25:06'),
(523, '116.110.224.51', '2022-01-11 21:31:42'),
(524, '116.110.224.51', '2022-01-11 21:48:38'),
(525, '116.110.224.51', '2022-01-11 22:01:48'),
(526, '116.110.224.51', '2022-01-11 22:23:32'),
(527, '116.110.224.51', '2022-01-11 22:23:32'),
(528, '116.110.224.51', '2022-01-11 22:23:33'),
(529, '116.110.224.51', '2022-01-11 22:23:34'),
(530, '116.110.224.51', '2022-01-11 22:23:34'),
(531, '116.110.224.51', '2022-01-11 22:23:35'),
(532, '116.110.224.51', '2022-01-11 22:23:35'),
(533, '116.110.224.51', '2022-01-11 22:23:36'),
(534, '116.110.224.51', '2022-01-11 22:23:36'),
(535, '116.110.224.51', '2022-01-11 22:23:37'),
(536, '116.110.224.51', '2022-01-11 22:23:38'),
(537, '116.110.224.51', '2022-01-11 22:23:38'),
(538, '116.110.224.51', '2022-01-11 22:23:39'),
(539, '116.110.224.51', '2022-01-11 22:23:40'),
(540, '116.110.224.51', '2022-01-11 22:23:40'),
(541, '116.110.224.51', '2022-01-11 22:23:41'),
(542, '116.110.224.51', '2022-01-11 22:23:41'),
(543, '116.110.224.51', '2022-01-11 22:23:41'),
(544, '116.110.224.51', '2022-01-11 22:46:11'),
(545, '116.110.224.51', '2022-01-11 22:48:26'),
(546, '116.110.224.51', '2022-01-11 22:48:29'),
(547, '116.110.224.51', '2022-01-11 22:51:01'),
(548, '116.110.224.51', '2022-01-11 22:55:00'),
(549, '116.110.224.51', '2022-01-11 22:55:07'),
(550, '116.110.224.51', '2022-01-11 22:55:18'),
(551, '116.110.224.51', '2022-01-11 22:55:50'),
(552, '116.110.224.51', '2022-01-11 22:55:51'),
(553, '116.110.224.51', '2022-01-11 22:55:52'),
(554, '116.110.224.51', '2022-01-11 22:56:02'),
(555, '116.110.224.51', '2022-01-11 22:56:28'),
(556, '116.110.224.51', '2022-01-11 22:56:32'),
(557, '116.110.224.51', '2022-01-11 22:57:51'),
(558, '116.110.224.51', '2022-01-11 23:02:04'),
(559, '116.110.224.51', '2022-01-11 23:03:52'),
(560, '116.110.224.51', '2022-01-11 23:04:34'),
(561, '116.110.224.51', '2022-01-11 23:05:07'),
(562, '116.110.224.51', '2022-01-11 23:06:57'),
(563, '116.110.224.51', '2022-01-11 23:10:07'),
(564, '116.110.224.51', '2022-01-11 23:25:20'),
(565, '116.110.224.51', '2022-01-11 23:26:30'),
(566, '116.110.224.51', '2022-01-11 23:28:27'),
(567, '116.110.224.51', '2022-01-11 23:30:09'),
(568, '116.110.224.51', '2022-01-11 23:32:49'),
(569, '116.110.224.51', '2022-01-11 23:33:53'),
(570, '116.110.224.51', '2022-01-11 23:36:31'),
(571, '116.110.224.51', '2022-01-11 23:39:28'),
(572, '116.110.224.51', '2022-01-11 23:42:13'),
(573, '116.110.224.51', '2022-01-11 23:46:07'),
(574, '116.110.224.51', '2022-01-11 23:46:33'),
(575, '116.110.224.51', '2022-01-11 23:46:59'),
(576, '116.103.173.100', '2022-01-12 15:01:31'),
(577, '116.103.173.100', '2022-01-12 15:03:08'),
(578, '116.103.173.100', '2022-01-12 15:10:00'),
(579, '116.103.173.100', '2022-01-12 15:31:23'),
(580, '116.103.173.100', '2022-01-12 17:27:20'),
(581, '116.103.173.100', '2022-01-12 20:40:44'),
(582, '116.103.173.100', '2022-01-12 20:44:09'),
(583, '116.103.173.100', '2022-01-12 21:30:16'),
(584, '116.103.173.100', '2022-01-12 21:36:51'),
(585, '116.103.173.100', '2022-01-12 21:37:05'),
(586, '116.103.173.100', '2022-01-12 22:04:58'),
(587, '116.103.173.100', '2022-01-12 22:15:46'),
(588, '116.103.173.100', '2022-01-12 23:01:27'),
(589, '116.103.173.100', '2022-01-12 23:03:02'),
(590, '116.103.173.100', '2022-01-12 23:16:00'),
(591, '116.103.173.100', '2022-01-12 23:42:37'),
(592, '116.103.173.100', '2022-01-12 23:53:42'),
(593, '116.103.173.100', '2022-01-13 06:31:51'),
(594, '171.254.155.10', '2022-01-13 06:37:21'),
(595, '171.254.155.10', '2022-01-13 07:03:21'),
(596, '171.251.126.157', '2022-01-13 07:21:06'),
(597, '171.244.208.177', '2022-01-13 07:32:30'),
(598, '171.244.208.177', '2022-01-13 07:33:41'),
(599, '171.244.208.177', '2022-01-13 07:37:15'),
(600, '171.244.208.177', '2022-01-13 07:38:50'),
(601, '171.244.208.177', '2022-01-13 08:04:20'),
(602, '116.103.173.100', '2022-01-13 08:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `vanchuyen`
--

CREATE TABLE `vanchuyen` (
  `MAVANCHUYEN` int(11) NOT NULL,
  `SOHOADON` int(11) NOT NULL,
  `TRANGTHAI` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vanchuyen`
--

INSERT INTO `vanchuyen` (`MAVANCHUYEN`, `SOHOADON`, `TRANGTHAI`) VALUES
(57, 168, 'Đang giao'),
(58, 169, 'Đang giao'),
(59, 170, 'Đã giao'),
(60, 172, 'Đã giao'),
(62, 174, 'Đang giao'),
(63, 175, 'Đang giao'),
(69, 181, 'Đang giao'),
(70, 182, 'Đã giao'),
(71, 184, 'Đã hủy'),
(87, 213, 'Đã hủy'),
(99, 225, 'Đã giao'),
(101, 227, 'Đang giao');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`MABAIVIET`);

--
-- Indexes for table `baohanh`
--
ALTER TABLE `baohanh`
  ADD PRIMARY KEY (`MABAOHANH`),
  ADD KEY `FK_REFERENCE_17` (`IMEI`);

--
-- Indexes for table `chitietgiohang`
--
ALTER TABLE `chitietgiohang`
  ADD PRIMARY KEY (`MAGIOHANG`,`MASANPHAM`,`DUNGLUONG`,`MAUSAC`),
  ADD KEY `FK_REFERENCE_5` (`MASANPHAM`);

--
-- Indexes for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`SOHOADON`,`IMEI`),
  ADD KEY `FK_REFERENCE_15` (`IMEI`);

--
-- Indexes for table `chitietsanpham`
--
ALTER TABLE `chitietsanpham`
  ADD PRIMARY KEY (`IMEI`),
  ADD KEY `CHITIETSANPHAM_MAUSAC_FK_idx` (`MAUSAC`),
  ADD KEY `CHITIETSANPHAM_DUNGLUONG_FK_idx` (`DUNGLUONG`),
  ADD KEY `CHITIETSANPHAM_MASANPHAM_FK_idx` (`MASANPHAM`);

--
-- Indexes for table `chitietvanchuyen`
--
ALTER TABLE `chitietvanchuyen`
  ADD PRIMARY KEY (`MACHITIETVANCHUYEN`,`MAVANCHUYEN`),
  ADD KEY `FK_REFERENCE_19` (`MAVANCHUYEN`);

--
-- Indexes for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`MADANHGIA`),
  ADD KEY `FK_REFERENCE_11` (`MASANPHAM`),
  ADD KEY `FK_REFERENCE_12` (`MAKHACHHANG`);

--
-- Indexes for table `danhsachyeuthich`
--
ALTER TABLE `danhsachyeuthich`
  ADD PRIMARY KEY (`MAKHACHHANG`,`MASANPHAM`),
  ADD KEY `MAKHACHHANG_FK_idx` (`MAKHACHHANG`),
  ADD KEY `MASANPHAM_FK_idx` (`MASANPHAM`);

--
-- Indexes for table `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MAGIOHANG`),
  ADD KEY `FK_REFERENCE_13` (`MAKHACHHANG`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`SOHOADON`),
  ADD KEY `FK_REFERENCE_7` (`MAKHACHHANG`),
  ADD KEY `FK_REFERENCE_8` (`MAKHUYENMAI`),
  ADD KEY `FK_REFERENCE_16` (`MANHANVIEN`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MAKHACHHANG`);

--
-- Indexes for table `khachhangdangnhap`
--
ALTER TABLE `khachhangdangnhap`
  ADD PRIMARY KEY (`REFRESHTOKEN`),
  ADD KEY `FK_KHACHHANGDANGNHAP_TAIKHOANKHACHHANG_idx` (`MAKHACHHANG`);

--
-- Indexes for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`MAKHUYENMAI`);

--
-- Indexes for table `khuyenmaicuatoi`
--
ALTER TABLE `khuyenmaicuatoi`
  ADD PRIMARY KEY (`MAKHACHHANG`,`MAKHUYENMAI`),
  ADD KEY `FK_KHACHHANG_KHUYENMAI_MAKHUYENMAI_idx` (`MAKHUYENMAI`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MALOAI`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MANHACUNGCAP`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MANHANVIEN`);

--
-- Indexes for table `nhanviendangnhap`
--
ALTER TABLE `nhanviendangnhap`
  ADD PRIMARY KEY (`REFRESHTOKEN`),
  ADD KEY `FK_NHANVIENDANGNHAP_NHANVIEN_idx` (`MANHANVIEN`);

--
-- Indexes for table `phieunhapsanpham`
--
ALTER TABLE `phieunhapsanpham`
  ADD PRIMARY KEY (`MAPHIEUNHAP`),
  ADD KEY `FK_REFERENCE_2` (`MASANPHAM`),
  ADD KEY `FK_REFERENCE_4` (`MANHACUNGCAP`);

--
-- Indexes for table `phivanchuyen`
--
ALTER TABLE `phivanchuyen`
  ADD PRIMARY KEY (`maphivanchuyen`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MASANPHAM`),
  ADD KEY `FK_REFERENCE_1` (`MALOAI`),
  ADD KEY `FK_REFERENCE_3` (`MATHUONGHIEU`);

--
-- Indexes for table `taikhoankhachhang`
--
ALTER TABLE `taikhoankhachhang`
  ADD PRIMARY KEY (`MAKHACHHANG`);

--
-- Indexes for table `taikhoannhanvien`
--
ALTER TABLE `taikhoannhanvien`
  ADD PRIMARY KEY (`USERNAME`),
  ADD KEY `FK_REFERENCE_9` (`MANHANVIEN`);

--
-- Indexes for table `thongsokithuat`
--
ALTER TABLE `thongsokithuat`
  ADD PRIMARY KEY (`MATHONGSO`),
  ADD KEY `FK_THONGSOKITHUAT_SANPHAM_idx` (`MASANPHAM`);

--
-- Indexes for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  ADD PRIMARY KEY (`MATHUONGHIEU`);

--
-- Indexes for table `truycapandanh`
--
ALTER TABLE `truycapandanh`
  ADD PRIMARY KEY (`MATRUYCAP`);

--
-- Indexes for table `vanchuyen`
--
ALTER TABLE `vanchuyen`
  ADD PRIMARY KEY (`MAVANCHUYEN`),
  ADD KEY `FK_REFERENCE_10` (`SOHOADON`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `MABAIVIET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `baohanh`
--
ALTER TABLE `baohanh`
  MODIFY `MABAOHANH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chitietvanchuyen`
--
ALTER TABLE `chitietvanchuyen`
  MODIFY `MACHITIETVANCHUYEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `MADANHGIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `giohang`
--
ALTER TABLE `giohang`
  MODIFY `MAGIOHANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `SOHOADON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MAKHACHHANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `MAKHUYENMAI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MALOAI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MANHACUNGCAP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MANHANVIEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `phieunhapsanpham`
--
ALTER TABLE `phieunhapsanpham`
  MODIFY `MAPHIEUNHAP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `phivanchuyen`
--
ALTER TABLE `phivanchuyen`
  MODIFY `maphivanchuyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MASANPHAM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `thongsokithuat`
--
ALTER TABLE `thongsokithuat`
  MODIFY `MATHONGSO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `thuonghieu`
--
ALTER TABLE `thuonghieu`
  MODIFY `MATHUONGHIEU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `truycapandanh`
--
ALTER TABLE `truycapandanh`
  MODIFY `MATRUYCAP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=603;

--
-- AUTO_INCREMENT for table `vanchuyen`
--
ALTER TABLE `vanchuyen`
  MODIFY `MAVANCHUYEN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baohanh`
--
ALTER TABLE `baohanh`
  ADD CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`IMEI`) REFERENCES `chitietsanpham` (`IMEI`);

--
-- Constraints for table `chitietgiohang`
--
ALTER TABLE `chitietgiohang`
  ADD CONSTRAINT `FK_REFERENCE_20` FOREIGN KEY (`MAGIOHANG`) REFERENCES `giohang` (`MAGIOHANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_5` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `FK_REFERENCE_15` FOREIGN KEY (`IMEI`) REFERENCES `chitietsanpham` (`IMEI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_6` FOREIGN KEY (`SOHOADON`) REFERENCES `hoadon` (`SOHOADON`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietsanpham`
--
ALTER TABLE `chitietsanpham`
  ADD CONSTRAINT `CHITIETSANPHAM_MASANPHAM_FK` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE CASCADE;

--
-- Constraints for table `chitietvanchuyen`
--
ALTER TABLE `chitietvanchuyen`
  ADD CONSTRAINT `FK_REFERENCE_19` FOREIGN KEY (`MAVANCHUYEN`) REFERENCES `vanchuyen` (`MAVANCHUYEN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `FK_REFERENCE_11` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_12` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `danhsachyeuthich`
--
ALTER TABLE `danhsachyeuthich`
  ADD CONSTRAINT `FK_DANHSACHYEUTHICH_KHACHHANG_MAKHACHHANG` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DANHSACHYEUTHICH_KHACHHANG_MASANPHAM` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `FK_REFERENCE_13` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FK_REFERENCE_16` FOREIGN KEY (`MANHANVIEN`) REFERENCES `nhanvien` (`MANHANVIEN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_7` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_8` FOREIGN KEY (`MAKHUYENMAI`) REFERENCES `khuyenmai` (`MAKHUYENMAI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `khachhangdangnhap`
--
ALTER TABLE `khachhangdangnhap`
  ADD CONSTRAINT `FK_KHACHHANGDANGNHAP_KHACHHANG` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `khuyenmaicuatoi`
--
ALTER TABLE `khuyenmaicuatoi`
  ADD CONSTRAINT `FK_KHACHHANG_KHUYENMAI_MAKHACHHANG` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_KHACHHANG_KHUYENMAI_MAKHUYENMAI` FOREIGN KEY (`MAKHUYENMAI`) REFERENCES `khuyenmai` (`MAKHUYENMAI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhanviendangnhap`
--
ALTER TABLE `nhanviendangnhap`
  ADD CONSTRAINT `FK_NHANVIENDANGNHAP_NHANVIEN` FOREIGN KEY (`MANHANVIEN`) REFERENCES `nhanvien` (`MANHANVIEN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phieunhapsanpham`
--
ALTER TABLE `phieunhapsanpham`
  ADD CONSTRAINT `FK_REFERENCE_2` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_4` FOREIGN KEY (`MANHACUNGCAP`) REFERENCES `nhacungcap` (`MANHACUNGCAP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_REFERENCE_1` FOREIGN KEY (`MALOAI`) REFERENCES `loaisanpham` (`MALOAI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REFERENCE_3` FOREIGN KEY (`MATHUONGHIEU`) REFERENCES `thuonghieu` (`MATHUONGHIEU`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taikhoankhachhang`
--
ALTER TABLE `taikhoankhachhang`
  ADD CONSTRAINT `FK_REFERENCE_18` FOREIGN KEY (`MAKHACHHANG`) REFERENCES `khachhang` (`MAKHACHHANG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taikhoannhanvien`
--
ALTER TABLE `taikhoannhanvien`
  ADD CONSTRAINT `FK_REFERENCE_9` FOREIGN KEY (`MANHANVIEN`) REFERENCES `nhanvien` (`MANHANVIEN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thongsokithuat`
--
ALTER TABLE `thongsokithuat`
  ADD CONSTRAINT `FK_THONGSOKITHUAT_SANPHAM` FOREIGN KEY (`MASANPHAM`) REFERENCES `sanpham` (`MASANPHAM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vanchuyen`
--
ALTER TABLE `vanchuyen`
  ADD CONSTRAINT `FK_REFERENCE_10` FOREIGN KEY (`SOHOADON`) REFERENCES `hoadon` (`SOHOADON`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
