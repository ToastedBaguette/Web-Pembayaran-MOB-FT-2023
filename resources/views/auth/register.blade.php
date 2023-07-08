@extends('layouts.user')

@section('user_content')
{{-- Navbar --}}
<header class="navbar navbar-expand-lg sticky-top nav-mob bg-transparent">
    <nav class="container flex-wrap flex-lg-nowrap">
        <a class="navbar-brand fw-semibold fs-3 text-mob">MOB FT 2023</a>
    </nav>
</header>
{{-- End Navbar --}}
<div class="container">
    <div class="row justify-content-center py-5">
        <div class="col-md-8">
            <div class="card">

                <div class="d-flex justify-content-center">
                    <img src="{{ asset('img/logo.png') }}" class="card-img-center p-3" alt="..." style="height: 200px; width: 200px;">
                </div>

                <div class="card-body px-4 mx-1 text-mob">
                    
                    <form method="POST" action="{{ route('register') }}" class="form-floating">
                        @csrf
                        <h2 class="text-mob">Daftar</h2>
                        
                        <div class="form-floating mb-3">
                            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror form-control-epass" name="name" value="{{ old('name') }}" required autocomplete="off" autofocus placeholder="nama">
                            <label for="name">{{ __('Nama') }}</label>
                            @error('name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="form-floating mb-3">
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror form-control-epass" name="email" value="{{ old('email') }}" required autocomplete="off" placeholder="email">
                            <label for="email">{{ __('Email') }}</label>
                            @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="form-floating mb-3">
                            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror form-control-epass" name="password" required autocomplete="off" placeholder="kata sandi">
                            <label for="password">{{ __('Kata Sandi') }}</label>
                            @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>

                        <div class="form-floating mb-3">
                            <input id="password-confirm" type="password" class="form-control form-control-epass" name="password_confirmation" required autocomplete="off" placeholder="konfirmasi sandi">
                            <label for="password-confirm">{{ __('Konfirmasi Sandi') }}</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" name="nrp" id="nrp" class="form-control form-control-epass" required placeholder="nrp" autocomplete="off">
                            <label for="nrp">NRP</label>
                        </div>

                        <div class="form-floating mb-3">
                            <select name="jurusan" id="jurusan" class="form-select form-control-epass" required placeholder="off">
                                <option value="">Pilih Jurusan</option>
                                <option value="Elektro">Teknik Elektro</option>
                                <option value="Kimia">Teknik Kimia</option>
                                <option value="Industri">Teknik Industri</option>
                                <optgroup label="Teknik Informatika">
                                    <option value="Informatika">Informatika</option>
                                    <option value="Informatika">Sistem Informasi Bisnis</option>
                                    <option value="Informatika">Multimedia</option>
                                    <option value="Informatika">Information Technology Dual Degree</option>
                                </optgroup>
                                <option value="Manufaktur">Teknik Mesin dan Manufaktur</option>
                            </select>
                            <label for="jurusan">Jurusan</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" name="nomor_telpon" id="nomer" class="form-control form-control-epass" autocomplete="off" required placeholder="no telepon">
                            <label for="nomer">No. Telepon</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" name="id_line" id="id_line" class="form-control form-control-epass" autocomplete="off" required placeholder="id line">
                            <label for="id_line">ID Line</label>
                        </div>

                        <div class="form-group row mb-3 mt-3">
                            <div class="col-md-12">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="submit" class="btn btn-primary btn-beli">
                                        {{ __('Daftar') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="register">
                            <label for="">Sudah Punya Akun?</label>
                            <label>
                                <a class="nav-link active" aria-current="page" href="{{ route('login') }}"
                                style="color: #242a68"><b>Masuk</b></a>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection