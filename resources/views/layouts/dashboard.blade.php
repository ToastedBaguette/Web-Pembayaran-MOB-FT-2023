@extends('layouts.user')

@section('user_content')
{{-- Button FAB --}}
<div class="btn-fab-container">
    <a href="https://forms.gle/2XpRv5rLVAd9cvte6" target="_blank"
        class="btn btn-fab shadow text-white rounded-circle d-flex justify-content-center align-items-center">
        <div class="align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-tools"
                viewBox="0 0 16 16">
                <path
                    d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z" />
            </svg>
        </div>
    </a>
</div>
{{-- End Button FAB --}}

{{-- Navbar --}}
<header class="navbar navbar-expand-lg sticky-top nav-mob bg-transparent">
    <nav class="container flex-wrap flex-lg-nowrap">
        <a class="navbar-brand fw-semibold fs-3 text-mob">MOB FT 2022</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-mob" href="#" id="navbarDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        {{ Auth::user()->name }}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <form action="{{ route('logout') }}" method="POST">
                            @csrf
                            <li><button class="dropdown-item text-danger" type="submit">Keluar</button></li>
                        </form>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
{{-- End Navbar --}}

<!-- notif ubah password -->
@if (session('status'))
<div class="alert alert-success" id="status">
    {{ session('status') }}
</div>
@elseif (session('error'))
<div class="alert alert-danger" id="status">
    {{ session('error') }}
</div>
@endif
<!-- end notif ubah password -->

{{-- Selamat Datang --}}
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-6 d-flex flex-column justify-content-center">
                <h1 class="text-mob fw-bold">Selamat Datang di<br>MOB FT 2022</h1>
                <p class="fs-5 text-mob mt-3">Status pembayaranmu:
                    @if($user->status == 'unpaid')
                    <span class="badge text-bg-secondary fw-semibold">Belum Memesan</span>
                    @elseif($user->status == 'failed')
                    <span class="badge text-bg-danger fw-semibold">Failed</span>
                    <br><br>
                    <span class="small">Pembayaran sebelumnya <span class="fw-bold">TIDAK VALID.</span> Silahkan lakukan
                        pemesanan ulang dengan mengunggah bukti pembayaran yang valid</span>
                    @elseif($user->status == 'pending')
                    <span class="badge text-bg-warning fw-semibold">Pending</span>
                    <br>
                    <span>Ukuran yang dipesan: <span class="fw-bold">{{ $user->ukuran }}</span></span>
                    <br><br>
                    <span class="small">Validasi pembayaran membutuhkan waktu maksimal <span class="fw-bold">3
                            hari</span></span><br>
                    <span class="small">Apabila terdapat kendala terkait validasi pembayaran, silahkan chat <span
                            class="fw-bold">Reynard (085607616739)</span> atau <span class="fw-bold">Dhita
                            (081332530021)</span> via <span class="fw-bold">WhatsApp</span></span>
                    @elseif($user->status == 'success')
                    <span class="badge text-bg-success fw-semibold">Success</span>
                    <br>
                    <span>Ukuran yang dipesan: <span class="fw-bold">{{ $user->ukuran }}</span></span>
                    <br><br>
                    <span>Pengambilan baju dilakukan pada <span class="fw-bold">Selasa, 16 Agustus 2022</span></span>
                    @if($user->batchs_id != 0)
                    <br>
                    <span>Batch Pengambilan: <span class="fw-bold">{{ $batch }}</span></span><br>
                <div class="fst-italic" style="font-size: 1rem"> Pengambilan baju dilakukan di depan TU Fakultas Teknik.
                </div>
                <div class="fst-italic" style="font-size: 1rem"> Harap melakukan pengambilan sesuai dengan waktu yang
                    sudah dipilih.</div>
                @else
                <br><br><span>Silahkan pilih batch pengambilan: </span><br>
                @foreach($listBatch as $temp)
                <span class="small"><?php echo html_entity_decode($temp); ?></span><br>
                @endforeach
                <form action="/pilih-batch" method="post" id="form-batch">
                    @csrf
                    <select class="form-select" name="batch" id="batch" required>
                        <option value="" selected hidden>Pilih Batch</option>
                        @foreach($listBatchPilihan as $temp)
                        <option value='{{ $temp }}'>Batch {{ $temp }}</option>
                        @endforeach
                    </select><br>
                    <button id="btn-submit" class="btn btn-beli btn-lg" type="submit">Pilih</button>
                </form>
                @endif
                @endif
                </p>

            </div>
            <div class="col-md-6">
                <img src="{{ asset('img/logo(2).png') }}" class="img-fluid">
            </div>
        </div>
    </div>
    <svg width="170" height="170" viewBox="0 0 257 257" fill="none" xmlns="http://www.w3.org/2000/svg"
        class="decoration1">
        <circle cx="13.5" cy="151.5" r="13.5" fill="#C6DCF3" />
        <circle cx="13.5" cy="197.5" r="13.5" fill="#C6DCF3" />
        <circle cx="13.5" cy="243.5" r="13.5" fill="#C6DCF3" />
        <circle cx="105.5" cy="151.5" r="13.5" fill="#C6DCF3" />
        <circle cx="105.5" cy="197.5" r="13.5" fill="#C6DCF3" />
        <circle cx="105.5" cy="243.5" r="13.5" fill="#C6DCF3" />
        <circle cx="59.5" cy="151.5" r="13.5" fill="#C6DCF3" />
        <circle cx="59.5" cy="197.5" r="13.5" fill="#C6DCF3" />
        <circle cx="59.5" cy="243.5" r="13.5" fill="#C6DCF3" />
        <circle cx="151.5" cy="151.5" r="13.5" fill="#C6DCF3" />
        <circle cx="151.5" cy="197.5" r="13.5" fill="#C6DCF3" />
        <circle cx="151.5" cy="243.5" r="13.5" fill="#C6DCF3" />
        <circle cx="197.5" cy="151.5" r="13.5" fill="#C6DCF3" />
        <circle cx="197.5" cy="197.5" r="13.5" fill="#C6DCF3" />
        <circle cx="197.5" cy="243.5" r="13.5" fill="#C6DCF3" />
        <circle cx="243.5" cy="151.5" r="13.5" fill="#C6DCF3" />
        <circle cx="243.5" cy="197.5" r="13.5" fill="#C6DCF3" />
        <circle cx="243.5" cy="243.5" r="13.5" fill="#C6DCF3" />
        <circle cx="13.5" cy="59.5" r="13.5" fill="#C6DCF3" />
        <circle cx="13.5" cy="105.5" r="13.5" fill="#C6DCF3" />
        <circle cx="105.5" cy="59.5" r="13.5" fill="#C6DCF3" />
        <circle cx="105.5" cy="105.5" r="13.5" fill="#C6DCF3" />
        <circle cx="59.5" cy="59.5" r="13.5" fill="#C6DCF3" />
        <circle cx="59.5" cy="105.5" r="13.5" fill="#C6DCF3" />
        <circle cx="151.5" cy="59.5" r="13.5" fill="#C6DCF3" />
        <circle cx="151.5" cy="105.5" r="13.5" fill="#C6DCF3" />
        <circle cx="197.5" cy="59.5" r="13.5" fill="#C6DCF3" />
        <circle cx="197.5" cy="105.5" r="13.5" fill="#C6DCF3" />
        <circle cx="13.5" cy="13.5" r="13.5" fill="#C6DCF3" />
        <circle cx="105.5" cy="13.5" r="13.5" fill="#C6DCF3" />
        <circle cx="59.5" cy="13.5" r="13.5" fill="#C6DCF3" />
        <circle cx="151.5" cy="13.5" r="13.5" fill="#C6DCF3" />
        <circle cx="197.5" cy="13.5" r="13.5" fill="#C6DCF3" />
        <circle cx="243.5" cy="59.5" r="13.5" fill="#C6DCF3" />
        <circle cx="243.5" cy="105.5" r="13.5" fill="#C6DCF3" />
        <circle cx="243.5" cy="13.5" r="13.5" fill="#C6DCF3" />
    </svg>
</section>
{{-- End Selamat Datang --}}

{{-- Kostum MOBFT 2022 --}}
{{-- Body --}}
<section class="py-5">
    <div class="container">
        <h1 class="text-mob fw-bold">Baju MOB FT 2022</h1>
        <div class="row mt-5">
            <div class="col-lg-4 d-flex justify-content-center mb-3">
                <div class="owl-carousel">
                    <div>
                        <img src="{{ asset('img/baju1(2).png')}}" alt="">
                    </div>
                    <div>
                        <img src="{{ asset('img/baju2(2).png')}}" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <p class="fs-5 text-mob fw-bold">
                    Keterangan:
                </p>
                <p class="fs-5 text-mob">
                    Size: Panjang Bahu x Panjang Badan (cm) <br>
                    Panjang Lengan: 23-24 cm <br>
                    Toleransi kurang lebih 1 cm
                </p>
                <p class="fs-5 text-mob fw-bold">
                    Harga:
                </p>
                <p class="fs-5 text-mob">
                    Rp 80,000.00
                </p>
                <form action="" method="get">
                    <label class="fs-5 text-mob mb-2 fw-bold" id="sizedesc">Ukuran: </label>

                    <ul style="padding-left: 0">
                        <label for="sizeS">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('S')" for="sizeS">S
                                <input type="radio" value="S" name="size-picker" class="form-check-input" id="sizeS">
                            </li>
                        </label>
                        <label for="sizeM">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('M')" for="sizeM">M
                                <input type="radio" value="M" name="size-picker" class="form-check-input" id="sizeM">
                            </li>
                        </label>
                        <label for="sizeL">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('L')" for="sizeL">L
                                <input type="radio" value="L" name="size-picker" class="form-check-input" id="sizeL">
                            </li>
                        </label>
                        <label for="sizeXL">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('XL')" for="sizeXL">XL
                                <input type="radio" value="XL" name="size-picker" class="form-check-input" id="sizeXL">
                            </li>
                        </label>
                        <label for="sizeXXL">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('XXL')" for="sizeXXL">XXL
                                <input type="radio" value="XXL" name="size-picker" class="form-check-input"
                                    id="sizeXXL">
                            </li>
                        </label>
                        <label for="size3XL">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('3XL')" for="size3XL">3XL
                                <input type="radio" value="3XL" name="size-picker" class="form-check-input"
                                    id="size3XL">
                            </li>
                        </label>
                        <label for="size4XL">
                            <li class="btn btn-mob-size mt-2" onclick="sizedesc('4XL')" for="size4XL">4XL
                                <input type="radio" value="4XL" name="size-picker" class="form-check-input"
                                    id="size4XL">
                            </li>
                        </label>
                    </ul>
                    <div class="d-flex justify-content-end">
                        <input type="hidden" id='status' value="{{$user->status}}">
                        <button id="btn-submit" class="btn btn-beli btn-lg" type="submit" disabled>Beli</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
{{-- End Kostum MOBFT 2022 --}}

{{-- Footer --}}
<footer>
    <div class="text-center">
        <p>Developed by Information Technology Department MOB FT 2022</p>
        <p>© 2022 MOB FT 2022. All Rights Reserved.</p>
    </div>
</footer>
{{-- End Footer --}}
@endsection

@section('user_script')
<script>
$('#form-batch').submit(function(e) {
    e.preventDefault()

    Swal.fire({
        title: 'Konfirmasi Pemilihan Batch',
        text: "Waktu pengambilan Batch tidak dapat diganti, apakah kamu sudah yakin?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Submit'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: 'POST',
                url: '{{ route("pilih-batch") }}',
                data: {
                    '_token': '<?php echo csrf_token() ?>',
                    'batch': $(`#batch`).val()
                },
                success: function(data) {
                    if (data.status == "success") {
                        window.location.href = "{{ route('dashboard') }}"
                    }
                },
                error: function(error) {
                    alert("Terjadi error: Silahkan lakukan pemilihan batch ulang")
                }
            })
        }
    })
})

const sizedesc = (size) => {
    let description = ""

    if (size == "S") {
        description = "Ukuran: 48 x 66 cm"
    } else if (size == "M") {
        description = "Ukuran: 50 x 68 cm"
    } else if (size == "L") {
        description = "Ukuran: 52 x 70 cm"
    } else if (size == "XL") {
        description = "Ukuran: 54 x 72 cm"
    } else if (size == "XXL") {
        description = "Ukuran: 56 x 75 cm"
    } else if (size == "3XL") {
        description = "Ukuran: 58 x 78 cm"
    } else if (size == "4XL") {
        description = "Ukuran: 60 x 81 cm"
    }

    $('#sizedesc').html(description)
}

const changeSize = (pilihan) => {
    let ukuran = ['S', 'M', 'L', 'XL', 'XXL', '3XL', '4XL']
    ukuran.splice($.inArray(pilihan, ukuran), 1)

    $('#size' + pilihan).parent().css('border', '3px solid #242a68')
    $('#size' + pilihan).parent().css('background-color', '#e3e6ff')

    $.each(ukuran, function(key, value) {
        $('#size' + value).parent().css('border', '')
        $('#size' + value).parent().css('background-color', '#fff')
    })
}

var owl = $('.owl-carousel')
owl.owlCarousel({
    items: 1,
    loop: true,
    margin: 10,
    autoplay: true,
    autoplayTimeout: 2000,
    autoplayHoverPause: true
})

$(document).ready(function() {
    $(".owl-carousel").owlCarousel()
    owl.trigger('play.owl.autoplay', [2000])
})

$('input[type=radio]').change(function() {
    let pilihan = $(this).val()
    changeSize(pilihan)
})
</script>
@endsection