@extends('layouts.user')

@section('user_content')
    {{-- Navbar --}}
    <header class="navbar navbar-expand-lg sticky-top nav-mob bg-transparent">
        <nav class="container flex-wrap flex-lg-nowrap">
            <a class="navbar-brand fw-semibold fs-3 text-mob">MOB FT 2023</a>
        </nav>
    </header>
    {{-- End Navbar --}}
    <div class="container cotainer-size">
        <div class="card p-4">
            <div class="row g-0 justify-content-center">
                <div class="col-md-4 logo">
                    <img src="{{ asset('img/logo.png') }}" class="img-fluid">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <form method="POST" action="{{ route('login') }}" class="form-floating">
                            @csrf
                            <h2 class="text-mob">Masuk</h2>
                            <div class="form-floating mb-3">
                                <input id="email" type="email"
                                    class="form-control @error('email') is-invalid @enderror form-control-epass"
                                    name="email" value="{{ old('email') }}" required autocomplete="off" autofocus
                                    placeholder="email">
                                <label for="email">{{ __('Email') }}</label>
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="form-floating">
                                <input id="password" type="password"
                                    class="form-control @error('password') is-invalid @enderror form-control-epass"
                                    name="password" required autocomplete="off" placeholder="kata sandi">
                                <label for="password">{{ __('Kata Sandi') }}</label>
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="text-end">
                                <label>
                                    <a class="nav-link active" aria-current="page" href="https://forms.gle/2XpRv5rLVAd9cvte6" target="_blank"
                                    style="color: #242a68"><b>Lupa password?</b></a>
                                </label>
                            </div>

                            <div class="form-group row mb-3 mt-3">
                                <div class="col-md-12">
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                        <button type="submit" class="btn btn-primary btn-beli">
                                            {{ __('Masuk') }}
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="register">
                                <label for="">Tidak Punya Akun?</label>
                                <label>
                                    <a class="nav-link active" aria-current="page" href="{{ route('register') }}"
                                    style="color: #242a68"><b>Daftar</b></a>
                                </label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
