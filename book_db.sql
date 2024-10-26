-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2024 lúc 07:04 PM
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
-- Cơ sở dữ liệu: `book_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `note` text DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `publisher`, `note`, `author`) VALUES
(2, 'KHOA HỌC VỀ GIẤC NGỦ', 'Khoa Học', 255000, 'khoahocvegiacngu.png', 'DK', 'Các chuyên gia trong nhiều lĩnh vực cảnh báo chúng ta rằng thiếu ngủ, hoặc ngủ không đúng giấc, sẽ mang đến một loạt hệ quả thảm khốc.\r\n\r\nThông điệp của Heather Darwall-Smith trong cuốn sách này rất đơn giản: đừng hoảng loạn!\r\n\r\nCon người được lập trình sinh học để ngủ được, và Heather khuyến khích chúng ta tìm ra những thay đổi có thể thực hiện trong lối sống để khiến đồng hồ sinh học hoạt động đúng nhịp, giúp chúng ta dễ dàng chìm vào giấc ngủ.\r\n\r\nKhoa học về giấc ngủ mang đến câu trả lời chuyên sâu cho các câu hỏi về những khó khăn liên quan đến giấc ngủ và phơi bày những ngộ nhận và xu hướng nhất thời về giấc ngủ bằng cách tiếp cận từ góc độ khoa học thường thức mà ai cũng có thể hiểu được như: Thiếu ngủ có ảnh hưởng đến sự phát triển của trẻ nhỏ không? Tại sao đứa con tuổi vị thành niên của tôi thi thoảng lại ngủ gật ban ngày? Càng già thì ta càng khó ngủ phải không? Tại sao tôi nghiến răng, mộng du, nói, bị bóng đè… trong khi ngủ? Chăn ga gối đệm, quần áo ngủ, âm nhạc và không gian xung quanh nói chung có giúp cải thiện giấc ngủ của tôi không?...', 'Heather Darwall-Smith'),
(3, 'BẬT MÍ BÍ MẬT VỀ… VŨ TRỤ', 'Khoa học', 65000, 'bimat.png', 'Dân Trí', 'BỘ SÁCH HẤP DẪN MANG ĐẾN CHO CÁC BẠN NHỎ KIẾN THỨC THÚ VỊ VỀ NHỮNG THỨ XUNG QUANH MÌNH!!!\r\n\r\nVũ trụ bao la với vô vàn ngôi sao lấp lánh đang chờ bạn khám phá.\r\n\r\nBạn sẽ phải bất ngờ về những bí mật được bật mí trong cuốn sách này...', 'Laura Cowan, Allysa Gonzalez'),
(4, 'BỘ GIÁO DỤC GIỚI TÍNH MẪU GIÁO TIỂU HỌC - TỚ BẢO VỆ CƠ THỂ MÌNH', 'Thiếu Nhi', 55250, 'baove.png', 'Hà Nội', 'BỘ SÁCH CHO TRẺ TỪ 4 TUỔI ĐƯỢC VIỆN KHOA HỌC NÃO BỘ KHUYÊN ĐỌC! \r\n\r\nBộ sách &#34;Giáo dục giới tính mẫu giáo tiểu học&#34; được viết bởi chuyên gia giáo dục giới tính Hồ Nguyệt, là kết quả của nhiều năm nghiên cứu, thực hành, cùng với sự hỗ trợ và kiểm chứng thông tin từ hội đồng cố vấn giàu kinh nghiệm. Trong bối cảnh chưa có nhiều sách giáo dục giới tính &#34;đo ni đóng giày&#34; cho trẻ em châu Á, sự hiện diện của bộ sách sẽ giúp cho các em có được những kiến thức vô cùng thiết thực và bổ ích về giới tính và về cơ thể mình, từ đó góp phần bảo vệ các em khỏi những nguy cơ, hiểm họa trong sinh hoạt hàng ngày.', 'Hồ Nguyệt'),
(5, 'KHÁM PHÁ CƠ THỂ 2 - TÌM HIỂU HỆ TUẦN HOÀN', 'Khoa Học', 84150, 'timhieuhetuanhoan.png', 'Thế Giới', 'Khi khám phá hệ tiêu hóa của Phi-bi, tàu Hippo bị trôi vào mạch máu, thế là nó lại phiêu lưu trong hệ tuần hoàn. Hệ tuần hoàn là một chu trình khép kín trong cơ thể, tức là Gi-ô và tiến sĩ Não có thể không bao giờ thoát ra được nữa! Ngoài kia, Phi-bi đã hồn nhiên lỉnh ra đường đi chơi từ hồi nào. Hệ tuần hoàn thiên la địa võng quăng quật Gi-ô và tiến sĩ Não đi khắp cơ thể...', 'Han Hyun Dong'),
(6, 'NHÂN VẬT NỔI TIẾNG THẾ GIỚI - KHOA HỌC VÀ PHÁT MINH', 'Khoa Học', 126650, 'khoahocvaphatminh.png', 'Hà Nội', 'Cuốn sách này miêu tả ngắn gọn cuộc đời và ý chí của hơn 300 vĩ nhân ghi dấu bằng các kỷ lục xuất sắc trong nhiều lĩnh vực khoa học. Việc học hỏi tri thức sẽ diễn ra rất tự nhiên khi bạn rung động và cảm phục những tấm gương xuất sắc của nhân loại.\r\n\r\nKhoa học là để phụng sự cuộc sống, hãy cảm nhận hơi thở khoa học trong từng giây phút cuộc đời các vĩ nhân!', 'Renzo Barsotti Eleonora Barsotti'),
(7, 'Hackers Toeic Vocabulary (Tái Bản 2023)', 'Tiếng Anh', 195300, 'toeichacker.png', 'Dân Trí', ' là cuốn sách được thiết kế nhằm giúp người học có thể hoàn thành mục tiêu nhớ và nắm được cách sử dụng của khoảng gần 7600 từ vựng theo các chủ đề khác nhau trong vòng 30 ngày. Ngoài ra, bạn còn được cung cấp những nội dung cần thiết liên quan như: câu hỏi theo định dạng bài thi thật, các xu hướng ra đề của bài thi dạng thức mới. “120 thành ngữ và cụm từ cố định cần biết để chinh phục bài thi TOEIC” ở cuối sách cũng là một nguồn tài liệu quý giá khiến cho các câu hỏi trong bài thi TOEIC không thể làm khó bạn trên con đường chinh phục điểm số mơ ước.', 'David Cho'),
(8, 'Ielts Writing Journey - Elevate To Band 8.0', 'Tiếng Anh', 188810, 'ielts.png', 'Thế Giới', 'Với tác giả Bùi Thành Việt - có kinh nghiệm gần 10 lần thi, đi từ 4.0 lên 8.5 overall, xuất phát điểm không quá cao, bằng con đường tự tìm tòi, tự học hỏi - tác giả hoàn toàn hiểu được những khó khăn mà người học gặp phải trong quá trình ôn tập. Từ đó, tác giả rút ra rất nhiều công thức cần thiết và thực tiễn, đúc kết lại một cách hoàn chỉnh nhất trong cuốn sách IELTS Writing Journey: Elevate to Band 8.0.', 'Bùi Thành Việt'),
(9, 'PM READERS SET 1 - Vui Học Tiếng Anh Qua Truyện Tranh', 'Tiếng Anh', 266000, 'Screenshot 2024-10-19 141251.png', 'Cengage', 'Chương trình học tiếng Anh qua truyện tranh tương tác cho trẻ.\r\n\r\nBộ truyện được NXB Cengage gợi ý sử dụng chung với bộ English Explorer Our World - Sách Giáo khoa Tiếng Anh Lớp 1', 'Cengage'),
(10, 'Tiếng Anh Trong Ngôn Ngữ Tình Yêu', 'Tiếng Anh', 56000, 'ngonngutienganh.png', 'NXB Tổng Hợp TPHCM', 'Những mẫu câu về chủ đề tình yêu\r\n\r\nNhững bài đối thoại  về chủ đề tình yêu\r\n\r\nNhững câu văn thấm đượm yêu thương trong các bức thư tình\r\n\r\nNhững bức thư tình điển hình\r\n\r\nNhững bài thơ tình cổ điển', 'Lê Huy Lâm'),
(11, 'Cổ Tích Của Ba', 'Thiếu Nhi', 50400, 'cotichcuaba.png', 'Trẻ', 'hững tản văn ngắn - cũng có thể gọi là truyện kể ngắn trong Cổ tích của ba chân thật và cảm động. Người bạn nhỏ của xứ Huế ngày xưa - giờ là ba của ba đứa trẻ, bồi hồi nhớ lại tuổi thơ mình mỗi lần về lại làng cũ, nhà xưa, dòng sông thơ ấu. Hồi nhỏ của người cha, tất nhiên khác với tuổi nhỏ bây giờ, từ chuyện chơi, chuyện ăn, chuyện mặc, chuyện đi học. Nhưng chính vì sự khác biệt này, lại là mảnh ghép quý giá, để chính những đứa trẻ ngày nay sẽ thêm tò mò về tuổi thơ của ba mẹ mình, về những câu chuyện ngày xưa,', 'Phi Tân'),
(12, '65 Truyện Ngắn Hay Dành Cho Thiếu Nhi', 'Thiếu Nhi', 478500, '65.png', 'Kim Đồng', 'Mỗi truyện ngắn trong tập sách này đều ấp ủ một thông điệp về tình yêu thương…\r\n\r\nDẫu là đồng thoại, cổ tích viết lại, giả tưởng hay đời thường thời hiện tại… với góc nhìn tinh tế, sự đồng điệu và sáng tạo hướng về trẻ thơ, vì trẻ thơ, các tác giả đã gieo lên cánh đồng tuổi thơ những hạt mầm lành thiện bé bỏng và thuần khiết…', 'Nhiều Tác Giả'),
(13, 'Những Thiếu Nhi Bên Bác Ngày Ấy', 'Thiếu Nhi', 22620, 'nhungthieunhibenbac.png', 'Kim Đồng', 'Chuyện kể về những thiếu nhi được chụp ảnh cùng Bác Hồ.\r\n\r\nTrong cuốn sách nhỏ này, tác giả Kiều Mai Sơn ghi lại sáu câu chuyện thú vị về những em bé vinh dự được chụp ảnh chung với Chủ tịch Hồ Chí Minh khi Người còn tại thế.', 'Kiều Mai Sơn'),
(14, 'Danh Tác Văn Học Việt Nam - Tắt Đèn ', 'Văn Học', 53900, 'tatden.png', 'Văn Học', '&#34;Theo tôi tiên tri, thì cuốn Tắt đèn còn phải sống lâu thọ hơn cả một số văn gia đương kim hôm nay. Chị Dậu, đích là tác giả Ngô Tất Tố hóa thân ra mà thôi. Chị Dậu là cái đốm sáng đặc biệt của Tắt đèn. Nếu ví toàn truyện Tắt đèn là một khóm cây thì chị Dậu là cả gốc cả ngọn cả cành, và chính chị Dậu đã nổi gió lên mà rung cho cả cái cây dạ hương Tắt đèn đó lên.&#34;\r\n\r\n(Nguyễn Tuân)', 'Ngô Tất Tố'),
(15, 'Danh Tác Văn Học Việt Nam - Chí Phèo', 'Văn Học', 69300, 'chipheo.png', 'Văn Học', 'Chí Phèo - Với những tình tiết hấp hẫn Nam Cao đã đưa người đọc tái hiện bức tranh chân thực nông thôn Việt Nam trước 1945, nghèo đói, xơ xác trên con đường phá sản, bần cùng, hết sức thê thảm, người nông dân bị đẩy vào con đường tha hóa, lưu manh hóa.\r\n\r\nNam Cao không hề bôi nhọ người nông dân, trái lại nhà văn đi sâu vào nội tâm nhân vật để khẳng định nhân phẩm và bản chất lương thiện ngay cả khi bị vùi dập, cướp mất cà nhân hình, nhân tính của người nông dân, đồng thời kết án đanh thép cái xã hội tàn bạo đó trước 1945.\r\n\r\nNhững sáng tác của Nam Cao ngoài giá trị hiện thực sâu sắc, các tác phẩm đi sâu vào nội tâm nhân vật, để lại những cảm xúc sâu lắng trong lòng người đọc.', 'Nam Cao'),
(16, 'Đoàn Binh Tây Tiến', 'Văn Học', 36900, 'taytien.png', 'NXB Kim Đồng', 'Có một “Tây Tiến” trong thơ và cũng có một “Tây Tiến” trong văn. Đó chính là những gì chứa đựng trong cuốn sách này!\r\n\r\nCảm xúc về một thời “Chiến trường đi chẳng tiếc đời xanh” của nhà thơ Quang Dũng trong bài thơ Tây Tiến dường như chưa đủ với ông. Tấm lòng thiết tha của tác giả những ngày hào hùng ấy đã dẫn đến thiên hồi ký “Đoàn Võ trang Tuyên truyền Biên khu Lào - Việt” (Đoàn binh Tây Tiến) ông viết mấy năm sau. Hơn là một phiên bản văn xuôi của bài thơ, tập hồi ký cho chúng ta biết thêm nhiều điều cụ thể về hoạt động của binh đoàn khi ấy, cũng như về các chiến sĩ Việt - Lào, những người cầm súng và cả những người cầm kèn trong Đoàn Võ trang Tuyên truyền cùng tham gia vào sứ mạng giải phóng đất nước mình và nước bạn khỏi ách thực dân xâm lược…', 'Quang Dũng'),
(17, 'Thơ Xuân Diệu', 'Văn Học', 35550, 'xuandieu.png', 'Xuân Diệu', 'Trong sự nghiệp sáng tác thơ văn của mình, Xuân Diệu được biết đến như là một nhà thơ lãng mạn trữ tình, “Nhà thơ mới nhất trong các nhà thơ mới” (Hoài Thanh), “Ông hoàng của thơ tình”.\r\n\r\nXuân Diệu là thành viên của Tự Lực Văn Đoàn và cũng đã là một trong những chủ soái của phong trào “Thơ Mới”. Tác phẩm tiêu biểu của ông ở giai đoạn này: Thơ Thơ (1938), Gửi hương cho gió (1945), truyện ngắn Phấn thông vàng (1939), Trường ca (1945).', 'Xuân Diệu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(1, 's', 'huynhhuyentran@gmai.com', '234234324', '356a192b7913b04c54574d18c28d46e6395428ab', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
