<?php
include 'header.php'; // Ensure you have the correct path
include '../koneksi.php'; // Ensure you have the correct path

// Fetch monthly sales data
$query = "
  SELECT 
    DATE_FORMAT(invoice_tanggal, '%Y-%m') AS month, 
    COUNT(*) AS total_invoices,
    SUM(invoice_total_bayar) AS total_sales 
  FROM invoice 
  GROUP BY month 
  ORDER BY month ASC";
$result = mysqli_query($koneksi, $query);

$months = [];
$total_invoices = [];
$total_sales = [];

while ($row = mysqli_fetch_assoc($result)) {
    $months[] = $row['month'];
    $total_invoices[] = $row['total_invoices'];
    $total_sales[] = $row['total_sales'];
}

$months = json_encode($months);
$total_invoices = json_encode($total_invoices);
$total_sales = json_encode($total_sales);

?>

<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Grafik Penjualan
      <small>Data Penjualan Bulanan</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Dashboard</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <section class="col-lg-12">
        <div class="box box-info">
          <div class="box-header">
            <h3 class="box-title">Grafik Penjualan Bulanan</h3>
          </div>
          <div class="box-body">
            <canvas id="salesChart"></canvas>
          </div>
        </div>
      </section>
    </div>
  </section>
</div>

<?php include 'footer.php';?>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const ctx = document.getElementById('salesChart').getContext('2d');
    const months = <?php echo $months; ?>;
    const totalInvoices = <?php echo $total_invoices; ?>;
    const totalSales = <?php echo $total_sales; ?>;
    
    const salesChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: months,
        datasets: [
          {
            label: 'Total Invoices',
            data: totalInvoices,
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
            yAxisID: 'y-axis-1'
          },
          {
            label: 'Total Sales (Rp)',
            data: totalSales,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            yAxisID: 'y-axis-2'
          }
        ]
      },
      options: {
        responsive: true,
        scales: {
          yAxes: [
            {
              id: 'y-axis-1',
              type: 'linear',
              position: 'left',
              ticks: {
                beginAtZero: true,
                callback: function(value) { return value; }
              },
              scaleLabel: {
                display: true,
                labelString: 'Total Invoices'
              }
            },
            {
              id: 'y-axis-2',
              type: 'linear',
              position: 'right',
              ticks: {
                beginAtZero: true,
                callback: function(value) { return 'Rp. ' + value.toLocaleString(); }
              },
              scaleLabel: {
                display: true,
                labelString: 'Total Sales (Rp)'
              },
              gridLines: {
                drawOnChartArea: false
              }
            }
          ],
          xAxes: [{
            scaleLabel: {
              display: true,
              labelString: 'Month'
            }
          }]
        }
      }
    });
  });
</script>



