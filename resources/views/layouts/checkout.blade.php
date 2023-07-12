@extends('layouts.user')

<style>
	th:not(:nth-child(1)), td:not(:nth-child(1)) {
		min-width: 200px;
		text-align: center
	}

	th:nth-child(1), td:nth-child(1) {
		min-width: 250px;
	}

	::-webkit-scrollbar {
		height: 7px;
	}

	::-webkit-scrollbar-track {
		background: #f1f1f1; 
	}

	* {
		line-height: 1.6rem;
	}

	@media only screen and (min-width: 1200px) {
		.container-fluid {
			display: flex;
			align-items: center;
			height: 100vh;
		}
	}
</style>

@section('user_content')
<div class="container-fluid px-3 px-md-5 my-4 my-xl-0">
	<div class="card border-0" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);">
		<div class="card-body p-4 p-md-5">
			<p class="h4 mt-2 mt-md-0 fw-bold">Checkout Produk.</p>

			<div class="row mt-5">
				<div class="col-xl-8 px-1 ps-md-4 pe-md-5">
					<div class="table-responsive">
						<table class="table" style="vertical-align: middle">
							<thead>
								<tr>
									<th scope="col">Produk</th>
									<th scope="col">Ukuran</th>
									<th scope="col">Kuantitas</th>
									<th scope="col">Total Harga</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="py-4">
										<img src="{{ asset('img/baju1.png')}}" alt="" class="w-25">
										<span class="ms-3">Baju Kaos MOB FT</span>
									</td>
									<td>{{ $ukuran }}</td>
									<td>1</td>
									<td>Rp 90,000.00</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3" class="text-end">Subtotal</td>
									<td class="fw-bold">Rp 90,000.00</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>

				<div class="col-xl-4 px-1 mt-4 mt-xl-0">
					<form action="{{ route('checkout-product') }}" method="post" enctype="multipart/form-data">
						@csrf
						<div class="card border-0" style="background: #F7F7F7">
							<div class="card-body p-4">
								<p class="h4 fw-bold mt-1 mb-5">Info Pembayaran.</p>

								<div class="mb-4 mb-md-5">
									<div>Pembayaran atas nama</div>
									<div class="fw-bold mt-1">{{$name}}</div>
								</div>

								<div class="mb-4 mb-md-5">
									<div>Metode pembayaran</div>
									@foreach($rekening as $r)
										<div class="form-check mt-3">
											<input class="form-check-input" type="radio" name="payment_method" value="{{ $r->id }}" id="method-{{ $r->id }}" required checked>
											<label class="form-check-label" for="method-{{ $r->id }}">
												{{ $r->jenis }} <span class="fw-bold">{{ $r->nomor }}</span> a/n <span class="fw-bold">{{ $r->nama }}</span>
											</label>
										</div>
									@endforeach
								</div>

								<div class="mb-4">
									<label for="formFile" class="form-label">Upload Bukti Pembayaran</label>
									<input class="form-control" type="file" id="formFile" name="bukti_pembayaran" accept="image/*" required>
								</div>
								<div class="alert alert-info fw-bold fst-italic text-center" role="alert">
									Harap mengisi NRP pada berita transfer
								</div>

								<input type="hidden" name="ukuran" value="{{ $ukuran }}">
								<input type="submit" class="btn btn-lg btn-beli w-100 mt-3" name="submit" value="Submit"/>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="mt-3 mt-md-4">
				<a href="{{ route('dashboard') }}" class="h6 text-dark" style="text-decoration: none">< Kembali ke beranda</a>
			</div>
		</div>
	</div>
</div>
@endsection

@section('user_script')
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
@endsection