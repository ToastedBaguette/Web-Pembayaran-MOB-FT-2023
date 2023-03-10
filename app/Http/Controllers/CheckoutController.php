<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rekening;
use Auth;
use DB;

class CheckoutController extends Controller
{
    function index(Request $request) {
        $user = Auth::user();
        $size = ['S','M','L','XL','XXL','3XL','4XL'];
        $ukuran = $request->get("size-picker");

        if (!in_array($ukuran, $size) || $user->status =='success' || $user->status == 'pending') {
            return redirect()->route('dashboard');
        }

        $name = $user->name;
        $rekening = Rekening::all();
        
        return view('layouts.checkout', compact('name','ukuran','rekening'));
    }

    function checkout(Request $request) {
        $user = Auth::user();

        $image = $request->file('bukti_pembayaran');
        $img_folder='img/pembayaran';
        $img_file = time()."_".$user->nrp."_".$image->getClientOriginalName();
        $image->move($img_folder, $img_file);

        $user->bukti_pembayaran = $img_file;
        $user->ukuran = $request->get('ukuran');
        $user->rekenings_id = $request->get('payment_method');
        $user->status = "pending";
        $user->save();

        return redirect()->route('dashboard');
    }
}
