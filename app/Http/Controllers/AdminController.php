<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rekening;
use App\User;
use Auth;

class AdminController extends Controller
{
    public function index() {
        $users = User::where('admin', '=', null)->where('rekenings_id', Auth::user()->admin)->get();
        if(Auth::user()->admin = 5){
            $users = User::where('admin', '=', null)->where('status', '!=', 'unpaid')->get();
        }
        $unpaids = User::where('admin', '=', null)->where('status', 'unpaid')->get();

        return view('layouts.admin', compact('users', 'unpaids'));
    }

    public function updateStatus(Request $request) {
        $status = $request->get('status');
        $valid_status = array("failed", "success");

        if (in_array($status, $valid_status)) {
            $user = User::find($request->get('id'));
            $user->status = $status;
            $user->save();
        }
        
        return redirect()->route('admin-dashboard');
    }

    public function konfirmasiPengambilan(Request $request) {
        $status = $request->get('status');

        if ($status == "Konfirmasi") {
            $user = User::find($request->get('id'));
            $user->konfirmasi = 1;
            $user->save();
        }
        
        return redirect()->route('admin-dashboard');
    }
}
