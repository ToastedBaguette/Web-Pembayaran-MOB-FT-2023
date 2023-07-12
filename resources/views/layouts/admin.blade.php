<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- Favicon icon -->
  <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('img/logo.png') }}">
  <title>MOB FT 2023 - Admin</title>
  <!-- Custom CSS -->
  <link href="{{ asset('admin/assets/extra-libs/c3/c3.min.css') }}" rel="stylesheet">
  <link href="{{ asset('admin/assets/libs/chartist/dist/chartist.min.css') }}" rel="stylesheet">
  <link href="{{ asset('admin/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css') }}" rel="stylesheet" />
  <link href="{{ asset('admin/assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="{{ asset('admin/dist/css/style.min.css') }}" rel="stylesheet">
  <link rel="stylesheet" href="{{asset('admin/custom.css')}}">

  <style>
    td {
      vertical-align: middle !important
    }
  </style>

  {{-- <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" type="text/css">
    <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" type="text/javascript" charset="utf-8"></script> --}}
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
  <!-- ============================================================== -->
  <!-- Preloader - style you can find in spinners.css -->
  <!-- ============================================================== -->
  <div class="preloader">
    <div class="lds-ripple">
      <div class="lds-pos"></div>
      <div class="lds-pos"></div>
    </div>
  </div>
  <!-- ============================================================== -->
  <!-- Main wrapper - style you can find in pages.scss -->
  <!-- ============================================================== -->
  <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin6">
      <nav class="navbar top-navbar navbar-expand-md">
        <div class="navbar-header" data-logobg="skin6">
          <!-- This is for the sidebar toggle which is visible on mobile only -->
          <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
          <!-- ============================================================== -->
          <!-- Logo -->
          <!-- ============================================================== -->
          <div class="navbar-brand justify-content-center">
            <!-- Logo icon -->
            <a href="index.html">
              <b class="logo-icon">
                <!-- Dark Logo icon -->
                <img src="{{ asset('img/logo.png') }}" width="75" alt="homepage" class="dark-logo" />
                <!-- Light Logo icon -->
                <img src="{{ asset('img/logo.png') }}" width="75" alt="homepage" class="light-logo" />
              </b>
              <!--End Logo icon -->
              <!-- Logo text -->
              {{-- <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="{{ asset('img/logo.png') }}" width="100" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="{{ asset('img/logo.png') }}" width="100" class="light-logo" alt="homepage" />
                            </span> --}}
            </a>
          </div>
          <!-- ============================================================== -->
          <!-- End Logo -->
          <!-- ============================================================== -->
          <!-- ============================================================== -->
          <!-- Toggle which is visible on mobile only -->
          <!-- ============================================================== -->
          <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
        </div>
        <!-- ============================================================== -->
        <!-- End Logo -->
        <!-- ============================================================== -->
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
          <!-- ============================================================== -->
          <!-- toggle and nav items -->
          <!-- ============================================================== -->
          <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
          </ul>
          <!-- ============================================================== -->
          <!-- Right side toggle and nav items -->
          <!-- ============================================================== -->
          <ul class="navbar-nav float-right">
            <!-- ============================================================== -->
            <!-- User profile and search -->
            <!-- ============================================================== -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="{{ asset('img/user.png') }}" alt="user" class="rounded-circle" width="40">
                <span class="ml-2 d-none d-lg-inline-block"><span class="text-dark">{{ auth()->user()->name }}</span> <i data-feather="chevron-down" class="svg-icon"></i></span>
              </a>
              <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY" style="padding: 0;">
                <form action="{{ route('logout') }}" method="POST">
                  @csrf
                  <button class="dropdown-item text-danger" type="submit">
                    <i data-feather="power" class="svg-icon mr-2 ml-1"></i>
                    Keluar
                  </button>
                </form>
              </div>
            </li>
            <!-- ============================================================== -->
            <!-- User profile and search -->
            <!-- ============================================================== -->
          </ul>
        </div>
      </nav>
    </header>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" data-sidebarbg="skin6">
      <!-- Sidebar scroll-->
      <div class="scroll-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
          <ul id="sidebarnav">
            <li class="nav-small-cap"><span class="hide-menu secondary-font">Menu</span></li>
            <li class="sidebar-item selected"> <a class="sidebar-link sidebar-link" href="#" aria-expanded="false"><i data-feather="user" class="feather-icon"></i><span class="hide-menu">Transaksi</span></a>
            </li>
          </ul>
        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
      <!-- ============================================================== -->
      <!-- Bread crumb and right sidebar toggle -->
      <!-- ============================================================== -->
      {{-- <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    @yield('admin_breadcrumb')
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div> --}}
      <!-- ============================================================== -->
      <!-- End Bread crumb and right sidebar toggle -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Container fluid  -->
      <!-- ============================================================== -->
      <div class="container-fluid">
        <div class="row">
          <!-- Tabel Transaksi Aktif -->
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title secondary-font">Transaksi Aktif <span class="secondary-font" style="font-style: italic; font-weight: normal"> (Success, Pending, Failed)</span></h4>
                <div class="table-responsive">
                  <div id="zero_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                    <div class="row">
                      <div class="col-sm-12 table-responsive">
                        <table id="zero_config" class="table table-striped table-bordered no-wrap dataTable" role="grid" aria-describedby="zero_config_info">
                          <thead>
                            <tr role="row">
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 0px;">Konfirmasi</th>
                              <th class="sorting_asc" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 0px;">NRP</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 0px;">Nama</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 0px;">Jurusan</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 0px;">No Telpon</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 0px;">ID Line</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 0px;">Ukuran</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 0px;">Status</th>
                              <th class="sorting" tabindex="0" aria-controls="zero_config" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 0px;">Bukti Pembayaran</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach ($users as $user)
                              <tr role='row' class="text-center">
                                 <td>
                                  @if ($user->status == 'success')
                                    @if ($user->konfirmasi == 0)
                                      <button class="btn btn-primary fw-semibold w-100" onclick="konfirmasiPengambilan('{{ $user->id }}')">Konfirmasi</button>
                                    @elseif($user->konfirmasi == 1)
                                      <button class="btn btn-warning fw-semibold w-100" disabled>Confirmed Admin</button>
                                    @elseif($user->konfirmasi == 2)
                                      <button class="btn btn-success fw-semibold w-100 " disabled>Confirmed Maharu</button>
                                    @endif
                                  @else
                                    <button class="btn btn-danger fw-semibold w-100" disabled>Belum Sukses</button>
                                  @endif
                                </td>
                                <td>{{ $user->nrp }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->jurusan }}</td>
                                <td>{{ $user->nomor_telpon }}</td>
                                <td>{{ $user->id_line }}</td>
                                <td>{{ $user->ukuran ?? '-' }}</td>
                                <td>
                                  @if ($user->status == 'failed')
                                    <button class="btn btn-danger fw-semibold w-100" disabled>Failed</button>
                                  @elseif($user->status == 'pending')
                                    <button class="btn btn-warning fw-semibold w-100" onclick="perbaharuiStatus('{{ $user->id }}')">Pending</button>
                                  @elseif($user->status == 'success')
                                    <button class="btn btn-success fw-semibold w-100" disabled>Success</button>
                                  @endif
                                </td>
                                <td>
                                  <button class="btn btn-primary w-100" onclick="showBukti('{{ $user->bukti_pembayaran }}')">Tampilkan</button>
                                </td>
                              </tr>
                            @endforeach
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Tabel Unpaid -->
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title secondary-font">Ini List Yang Belum Bayar >:(</h4>
                <div class="table-responsive">
                  <div id="one_config_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                    <div class="row">
                      <div class="col-sm-12 table-responsive">
                        <table id="default_order" class="table table-striped table-bordered no-wrap">
                          <thead>
                            <tr>
                              <th>NRP</th>
                              <th>Nama</th>
                              <th>Jurusan</th>
                              <th>No. Telepon</th>
                              <th>ID Line</th>
                            </tr>
                          </thead>
                          <tbody>
                            @foreach ($unpaids as $unpaid)
                              <tr role='row' class="text-center">
                                <td>{{ $unpaid->nrp }}</td>
                                <td>{{ $unpaid->name }}</td>
                                <td>{{ $unpaid->jurusan }}</td>
                                <td>{{ $unpaid->nomor_telpon }}</td>
                                <td>{{ $unpaid->id_line }}</td>
                              </tr>
                            @endforeach
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- <script>
          $(document).ready(function() {
            $('#one_config').DataTable();
          });
        </script> -->
      </div>
      <!-- ============================================================== -->
      <!-- End Container fluid  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- footer -->
      <!-- ============================================================== -->
      
      <footer class="footer text-center text-muted">
        <p class="">Developed by Information Technology Department MOB FT 2023</p>
        <p class="">© 2023 MOB FT 2023. All Rights Reserved.</p>
      </footer>
      <!-- ============================================================== -->
      <!-- End footer -->
      <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
  </div>
  <!-- ============================================================== -->
  <!-- End Wrapper -->
  <!-- ============================================================== -->
  <!-- End Wrapper -->
  <!-- ============================================================== -->
  <!-- All Jquery -->
  <!-- ============================================================== -->

  <!-- Modal Bukti Pembayaran -->
  <div class="modal fade" id="modal-bukti-pembayaran" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Bukti Pembayaran</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <img src="" alt="Bukti_Pembayaran" id="bukti-pembayaran" class="w-100">
        </div>
      </div>
    </div>
  </div>

  <!-- Modal Perbaharui Status -->
  <div class="modal fade" id="modal-perbaharui-status" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Perbaharui Status Transaksi</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="{{ route('update-status') }}" method="post" onsubmit="return confirm('Yakin nih mau update status transaksi?');">
            @csrf
            <input type="hidden" name="id" value="0" id="id-maharu" />
            <div class="row m-0">
              <div class="col m-0"><input type="submit" name="status" value="failed" style="height: 75px; font-size: 28px" class="fw-bold btn btn-danger w-100 rounded" /></div>
              <div class="col m-0"><input type="submit" name="status" value="success" style="height: 75px; font-size: 28px" class="fw-bold btn btn-success w-100 rounded" /></div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal Konfirmasi Pengambilan -->
  <div class="modal fade" id="modal-konfirmasi-pengambilan" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Konfirmasi Pengambilan</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="{{ route('konfirmasi-pengambilan') }}" method="post" onsubmit="return confirm('Yakin nih mau konfirmasi pengambilan?');">
            @csrf
            <input type="hidden" name="id" value="0" id="id-maharu-konfirmasi" />
            <div class="row m-0">
              <div class="col m-0"><input type="submit" name="status" value="Konfirmasi" style="height: 75px; font-size: 28px" class="fw-bold btn btn-success w-100 rounded" /></div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>


  <script>
    const showBukti = (image) => {
      $(`#bukti-pembayaran`).attr(`src`, `{{ asset('img/pembayaran/${image}') }}`)
      $(`#modal-bukti-pembayaran`).modal(`show`)
    }

    const perbaharuiStatus = (id) => {
      $(`#id-maharu`).val(id)
      $(`#modal-perbaharui-status`).modal(`show`)
    }

    const konfirmasiPengambilan = (id) => {
      $(`#id-maharu-konfirmasi`).val(id)
      $(`#modal-konfirmasi-pengambilan`).modal(`show`)
    }

    // $('#zero_config').DataTable();
    // $('#one_config').DataTable();
  </script>

  <script src="{{ asset('admin/assets/libs/jquery/dist/jquery.min.js') }}"></script>
  <script src="{{ asset('admin/assets/libs/popper.js/dist/umd/popper.min.js') }}"></script>
  <script src="{{ asset('admin/assets/libs/bootstrap/dist/js/bootstrap.min.js') }}"></script>
  <!-- apps -->
  <!-- apps -->
  <script src="{{ asset('admin/dist/js/app-style-switcher.js') }}"></script>
  <script src="{{ asset('admin/dist/js/feather.min.js') }}"></script>
  <script src="{{ asset('admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js') }}"></script>
  <script src="{{ asset('admin/dist/js/sidebarmenu.js') }}"></script>
  <!--Custom JavaScript -->
  <script src="{{ asset('admin/dist/js/custom.min.js') }}"></script>
  <!--This page JavaScript -->
  <script src="{{ asset('admin/assets/extra-libs/c3/d3.min.js') }}"></script>
  <script src="{{ asset('admin/assets/extra-libs/c3/c3.min.js') }}"></script>
  <script src="{{ asset('admin/assets/libs/chartist/dist/chartist.min.js') }}"></script>
  <script src="{{ asset('admin/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js') }}"></script>
  <script src="{{ asset('admin/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js') }}"></script>
  <script src="{{ asset('admin/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js') }}"></script>
  <script src="{{ asset('admin/dist/js/pages/dashboards/dashboard1.min.js') }}"></script>
  <script src="{{ asset('admin/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
  <script src="{{ asset('admin/dist/js/pages/datatable/datatable-basic.init.js') }}"></script>
  <script src="{{ asset('admin/dist/js/jquery.editable.min.js') }}"></script>
</body>

</html>