<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;
    public $timestamps = false;

    protected $fillable = [
        'name', 'email', 'password','nrp','jurusan','nomor_telpon','id_line',
    ];

    protected $hidden = [
        'password'
    ];

    public function rekening() {
        return $this->belongsTo('App\Rekening', 'rekenings_id');
    }
}
