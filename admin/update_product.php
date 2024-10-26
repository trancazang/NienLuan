<?php

include '../components/connect.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:admin_login.php');
};
if(isset($_POST['update'])){

   $pid = $_POST['pid'];
   $pid = filter_var($pid, FILTER_SANITIZE_STRING);
   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $price = $_POST['price'];
   $price = filter_var($price, FILTER_SANITIZE_STRING);
   $category = $_POST['category'];
   $category = filter_var($category, FILTER_SANITIZE_STRING);
   $author = $_POST['author']; // Thêm tác giả
   $author = filter_var($author, FILTER_SANITIZE_STRING);
   $publisher = $_POST['publisher'];
   $publisher = filter_var($publisher, FILTER_SANITIZE_STRING);
   $note = $_POST['note'];
   $note = filter_var($note, FILTER_SANITIZE_STRING);

   // Cập nhật sản phẩm
   $update_product = $conn->prepare("UPDATE `products` SET name = ?, category = ?, price = ?, publisher = ?, note = ?, author = ? WHERE id = ?");
   $update_product->execute([$name, $category, $price, $publisher, $note, $author, $pid]);


   $message[] = 'Sách đã được cập nhật!';

   // Cập nhật hình ảnh (nếu có)
   $old_image = $_POST['old_image'];
   $image = $_FILES['image']['name'];
   $image = filter_var($image, FILTER_SANITIZE_STRING);
   $image_size = $_FILES['image']['size'];
   $image_tmp_name = $_FILES['image']['tmp_name'];
   $image_folder = '../uploaded_img/'.$image;

   if(!empty($image)){
      if($image_size > 2000000){
         $message[] = 'Image size is too large!';
      }else{
         $update_image = $conn->prepare("UPDATE `products` SET image = ? WHERE id = ?");
         $update_image->execute([$image, $pid]);
         move_uploaded_file($image_tmp_name, $image_folder);
         unlink('../uploaded_img/'.$old_image);
         $message[] = 'Image updated!';
      }
   }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Cập nhật sản phẩm</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../components/admin_header.php' ?>

<!-- update product section starts  -->

<section class="update-product">

   <h1 class="heading">Cập nhật sản phẩm</h1>

   <?php
      $update_id = $_GET['update'];
      $show_products = $conn->prepare("SELECT * FROM `products` WHERE id = ?");
      $show_products->execute([$update_id]);
      if($show_products->rowCount() > 0){
         while($fetch_products = $show_products->fetch(PDO::FETCH_ASSOC)){  
   ?>
   <form action="" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="pid" value="<?= $fetch_products['id']; ?>">
      <input type="hidden" name="old_image" value="<?= $fetch_products['image']; ?>">
      <img src="../uploaded_img/<?= $fetch_products['image']; ?>" alt="">
      <span>Cập nhật tên</span>
      <input type="text" required placeholder="enter product name" name="name" maxlength="100" class="box" value="<?= $fetch_products['name']; ?>">
      <span>Cập nhật giá</span>
      <input type="number" min="0" max="9999999999" required placeholder="enter product price" name="price" onkeypress="if(this.value.length == 10) return false;" class="box" value="<?= $fetch_products['price']; ?>">
      <span>Cập nhật danh mục</span>
      <select name="category" class="box" required>
         <option selected value="<?= $fetch_products['category']; ?>"><?= $fetch_products['category']; ?></option>
         <option value="Khoa học">Khoa Học</option>
         <option value="Tiếng Anh">Tiếng Anh</option>
         <option value="Thiếu Nhi">Thiếu Nhi</option>
         <option value="Văn Học">Văn Học</option>
      </select>
      <span>Cập nhật tác giả</span> <!-- Thêm trường tác giả -->
      <input type="text" required placeholder="Nhập tên tác giả" name="author" maxlength="100" class="box" value="<?= $fetch_products['author']; ?>"> 

      <span>Cập nhật nhà xuất bản</span>
      <input type="text" required placeholder="Nhập nhà xuất bản" name="publisher" maxlength="100" class="box" value="<?= $fetch_products['publisher']; ?>">
   
      <span>Cập nhật tóm tắt</span>
      <textarea placeholder="Nhập tóm tắt" name="note" class="box" rows="4"><?= $fetch_products['note']; ?></textarea>
   
      <span>Cập nhật ảnh sản phẩm</span>
      <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">
      <div class="flex-btn">
         <input type="submit" value="update" class="btn" name="update">
         <a href="products.php" class="option-btn">Trở lại</a>
      </div>
   </form>
   <?php
         }
      }else{
         echo '<p class="empty">no products added yet!</p>';
      }
   ?>

</section>

<!-- update product section ends -->










<!-- custom js file link  -->
<script src="../js/admin_script.js"></script>

</body>
</html>