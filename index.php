
<?php
include "connect.php";
$model = new ProductModel($conn);

// Lấy dữ liệu từ URL
$keyword    = $_GET['keyword'] ?? '';
$category   = $_GET['category'] ?? '';
$Type       = $_GET['Type'] ?? '';
$min_price  = $_GET['min_price'] ?? '';
$max_price  = $_GET['max_price'] ?? '';
$sort       = $_GET['sort'] ?? '';
$page       = $_GET['page'] ?? 1;

// Gom filter lại đúng format
$filters = [
    'keyword'   => $keyword,
    'category'  => $category,
    'Type'      => $Type,
    'min_price' => $min_price,
    'max_price' => $max_price,
    'sort'      => $sort,
];

// Lấy danh sách sản phẩm
$result = $model->getProducts($filters, $page);

// Tổng số sản phẩm (phục vụ phân trang)
$total_products = $model->getTotalProducts($filters);
$total_pages    = $model->getTotalPages($filters);

// Check có phải chế độ tìm kiếm không
$is_search = $model->isSearchMode($filters);
class ProductModel {
    
    private $conn;
    private $limit = 12; // số sản phẩm mỗi trang

    public function __construct($db) {
        $this->conn = $db;
    }

    /** 
     * Lấy danh sách sản phẩm có phân trang + filter + sort
     */
    public function getProducts($filters = [], $page = 1) {
        $page = max((int)$page, 1);
        $offset = ($page - 1) * $this->limit;

        $sql = "SELECT MA_SP, TEN_SP, GIA_CA, HINH_ANH, MA_LOAISP 
                FROM sanpham 
                WHERE TINH_TRANG = 1";

        $params = [];
        $types = "";

        // Keyword
        if (!empty($filters['keyword'])) {
            $sql .= " AND TEN_SP LIKE ?";
            $params[] = "%" . $filters['keyword'] . "%";
            $types .= "s";
        }

        // Category / Type
        if (!empty($filters['category'])) {
            $sql .= " AND MA_LOAISP = ?";
            $params[] = $filters['category'];
            $types .= "s";
        } elseif (!empty($filters['Type'])) {
            $sql .= " AND MA_LOAISP = ?";
            $params[] = $filters['Type'];
            $types .= "s";
        }

        // Price filter
        if (isset($filters['min_price']) && is_numeric($filters['min_price'])) {
            $sql .= " AND GIA_CA >= ?";
            $params[] = (int)$filters['min_price'];
            $types .= "i";
        }

        if (isset($filters['max_price']) && is_numeric($filters['max_price'])) {
            $sql .= " AND GIA_CA <= ?";
            $params[] = (int)$filters['max_price'];
            $types .= "i";
        }

        // Sorting
        if (!empty($filters['sort'])) {
            if ($filters['sort'] === 'asc') {
                $sql .= " ORDER BY GIA_CA ASC";
            } elseif ($filters['sort'] === 'desc') {
                $sql .= " ORDER BY GIA_CA DESC";
            }
        }

        // Pagination
        $sql .= " LIMIT ? OFFSET ?";
        $params[] = $this->limit;
        $params[] = $offset;
        $types .= "ii";

        $stmt = $this->conn->prepare($sql);
        if (!$stmt) {
            die("Lỗi prepare: " . $this->conn->error);
        }

        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();

        return $result;
    }


    /**
     * Lấy tổng số sản phẩm sau khi đã filter (để tính tổng số trang)
     */
    public function getTotalProducts($filters = []) {
        $sql = "SELECT COUNT(*) AS total FROM sanpham WHERE TINH_TRANG = 1";

        $params = [];
        $types = "";

        if (!empty($filters['keyword'])) {
            $sql .= " AND TEN_SP LIKE ?";
            $params[] = "%" . $filters['keyword'] . "%";
            $types .= "s";
        }

        if (!empty($filters['category'])) {
            $sql .= " AND MA_LOAISP = ?";
            $params[] = $filters['category'];
            $types .= "s";
        } elseif (!empty($filters['Type'])) {
            $sql .= " AND MA_LOAISP = ?";
            $params[] = $filters['Type'];
            $types .= "s";
        }

        if (isset($filters['min_price']) && is_numeric($filters['min_price'])) {
            $sql .= " AND GIA_CA >= ?";
            $params[] = (int)$filters['min_price'];
            $types .= "i";
        }

        if (isset($filters['max_price']) && is_numeric($filters['max_price'])) {
            $sql .= " AND GIA_CA <= ?";
            $params[] = (int)$filters['max_price'];
            $types .= "i";
        }

        $stmt = $this->conn->prepare($sql);
        if (!$stmt) {
            die("Lỗi prepare: " . $this->conn->error);
        }

        if (!empty($params))
            $stmt->bind_param($types, ...$params);

        $stmt->execute();
        $result = $stmt->get_result()->fetch_assoc();

        return $result['total'];
    }


    /** 
     * Tính tổng số trang
     */
    public function getTotalPages($filters = []) {
        $total = $this->getTotalProducts($filters);
        return ($total > 0) ? ceil($total / $this->limit) : 1;
    }

    public function isSearchMode($filters = []) {
        return !empty($filters['keyword']) || 
               !empty($filters['category']) || 
               !empty($filters['Type']) || 
               isset($filters['min_price']) || 
               isset($filters['max_price']);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="assets/font-awesome-pro-v6-6.2.0/css/all.min.css" />
    <link rel="stylesheet" href="assets/css/base.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <title>Đặc sản 3 miền</title>
    <link href="./assets/img/logo.png" rel="icon" type="image/x-icon" />
</head>
<body>
    <!-- Header -->
    <?php include "includes/header.php"; ?>
    <!-- Close Header -->

    <!-- Banner -->
    <div class="Banner">
        <div class="container">
            <div class="inner-img">
                <img src="assets/img/banner.jpg" alt="banner" />
            </div>
        </div>
    </div>
    <!-- End Banner -->

    <!-- Service -->
    <div class="home-service" id="home-service">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                    <div class="inner-item">
                        <div class="inner-icon">
                            <i class="fa-solid fa-truck-fast"></i>
                        </div>
                        <div class="inner-info">
                            <div class="inner-chu1">GIAO HÀNG NHANH</div>
                            <div class="inner-chu2">Cho tất cả đơn hàng</div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                    <div class="inner-item">
                        <div class="inner-icon">
                            <i class="fa-solid fa-shield-heart"></i>
                        </div>
                        <div class="inner-info">
                            <div class="inner-chu1">SẢN PHẨM AN TOÀN</div>
                            <div class="inner-chu2">Cam kết chất lượng</div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                    <div class="inner-item">
                        <div class="inner-icon">
                            <i class="fa-solid fa-headset"></i>
                        </div>
                        <div class="inner-info">
                            <div class="inner-chu1">HỖ TRỢ 24/7</div>
                            <div class="inner-chu2">Tất cả ngày trong tuần</div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                    <div class="inner-item">
                        <div class="inner-icon">
                            <i class="fa-solid fa-coins"></i>
                        </div>
                        <div class="inner-info">
                            <div class="inner-chu1">HOÀN LẠI TIỀN</div>
                            <div class="inner-chu2">Nếu không hài lòng</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Service -->

    <!-- Products -->
    <div class="Products" id="product-list">
        <div class="container">
            <div class="row">
                <?php if ($total_products > 0): ?>
                    <div class="col-xl-12">
                        <div class="inner-title">
                            <?php echo $is_search ? 'Kết quả tìm kiếm' : 'Khám phá thực đơn của chúng tôi'; ?>
                        </div>
                    </div>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="inner-item">
                                <a href="chitietsp.php?id=<?= $row['MA_SP']; ?>" class="inner-img">
                                    <img src="<?= htmlspecialchars($row['HINH_ANH']); ?>" />
                                </a>
                                <div class="inner-info">
                                    <div class="inner-ten"><?= htmlspecialchars($row['TEN_SP']); ?></div>
                                    <div class="inner-gia"><?= number_format($row['GIA_CA'], 0, '.', '.'); ?>₫</div>
                                    <a href="chitietsp.php?id=<?= $row['MA_SP']; ?>" class="inner-muahang">
                                        <i class="fa-solid fa-cart-plus"></i> ĐẶT MÓN
                                    </a>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php else: ?>
                    <div class="col-xl-12">
                        <div class="home-products" id="home-products">
                            <div class="no-result">
                                <div class="no-result-h">Tìm kiếm không có kết quả</div>
                                <div class="no-result-p">Xin lỗi, chúng tôi không thể tìm được kết quả hợp với tìm kiếm của bạn</div>
                                <div class="no-result-i"><i class="fa-light fa-face-sad-cry"></i></div>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Phân trang -->
    <div id="pagination" class="Pagination">
        <div class="container">
            <ul>
                <?php
                // Tạo URL cơ bản với các tham số tìm kiếm
                $base_url = 'index.php?';
                $url_params = [];
                if (!empty($keyword)) {
                    $url_params[] = 'keyword=' . urlencode($keyword);
                }
                if (!empty($category)) {
                    $url_params[] = 'category=' . urlencode($category);
                }
                if (!empty($Type)) {
                    $url_params[] = 'Type=' . urlencode($Type);
                }
                if ($min_price !== '') {
                    $url_params[] = 'min_price=' . $min_price;
                }
                if ($max_price !== '') {
                    $url_params[] = 'max_price=' . $max_price;
                }
                if (!empty($sort)) {
                    $url_params[] = 'sort=' . $sort;
                }
                $base_url .= implode('&', $url_params);

                for ($i = 1; $i <= $total_pages; $i++) {
                    $active_class = ($i == $page) ? 'trang-chinh' : '';
                    $page_url = $base_url . (empty($url_params) ? '' : '&') . 'page=' . $i;
                    echo '<li><a href="' . htmlspecialchars($page_url) . '" class="inner-trang ' . $active_class . '">' . $i . '</a></li>';
                }
                ?>
            </ul>
        </div>
    </div>

    <?php if ($is_search && $total_products > 0): ?>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                document.getElementById('home-service').scrollIntoView({ behavior: 'smooth' });
            });
        </script>
    <?php endif; ?>

    <!-- Footer -->
    <?php include_once "includes/footer.php"; ?>

    <!-- JavaScript -->
    <script>
        function submitSearchForm() {
            document.getElementById('search-form').submit();
        }
    </script>
</body>
</html>