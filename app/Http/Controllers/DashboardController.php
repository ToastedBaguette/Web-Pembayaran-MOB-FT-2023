<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use Illuminate\Support\Facades\Auth as FacadesAuth;

class DashboardController extends Controller
{
    function index() {
        $user = Auth::user();
        $batch = '';
        $listBatch = array();
        $listBatchPilihan = array();
        if($user->batchs_id != 0){
            $jam = DB::table('batchs')
            ->where('id', $user->batchs_id)
            ->get()[0]
            ->jam;
            $batch = "Batch $user->batchs_id ($jam)";
        }
        else{
            $temp = DB::table('batchs')->get();
            foreach($temp as $temp2){
                if($temp2->id == 0){
                    continue;
                }
                $count = DB::table('users')->where('batchs_id', $temp2->id)->count();
                $kuota = 50 - $count;
                $batch = "Batch $temp2->id: $temp2->jam, <span class='fw-bold'>Sisa kuota: $kuota</span>";
                array_push($listBatch, $batch);
                if($kuota > 0){
                    array_push($listBatchPilihan, $temp2->id);
                }
            }
        }
        return view('layouts.dashboard', compact('user', 'batch', 'listBatch', 'listBatchPilihan'));
    }

    function pilihBatch(Request $request){
        $batch = $request->batch;
        $count = DB::table('users')->where('batchs_id', $batch)->count();
        if($count < 50){
            $user = Auth::user()->id;
            DB::table('users')
            ->where('id', $user)
            ->update(['batchs_id' => $batch]);
        }
        return response()->json(array(
            'status' => 'success',
        ), 200);
    }

    function konfirmPengambilan(){
        $user = Auth::user();
        $user->konfirmasi = 2;
        $user->save();
        return response()->json(array(
            'status' => 'success',
        ), 200);
    }
}
