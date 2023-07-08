@extends('layouts.user')

@section('user_content')
{{-- Navbar --}}
<header class="navbar navbar-expand-lg sticky-top nav-mob bg-transparent">
    <nav class="container flex-wrap flex-lg-nowrap">
        <a class="navbar-brand fw-semibold fs-3 text-mob">MOB FT 2022</a>
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
                    
                    <form method="POST" action="{{ route('user-change') }}" class="form-floating">
                        @csrf
                        <h2 class="text-mob">Ubah Sandi</h2>
                        
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

                        <div class="form-group row mb-3 mt-3">
                            <div class="col-md-12">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="submit" class="btn btn-primary btn-beli">
                                        {{ __('Ganti') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="register">
                            <label for="">Kembali ke</label>
                            <label>
                                <a class="nav-link active" aria-current="page" href="{{ route('login') }}"
                                style="color: #242a68"><b>Login</b></a>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection