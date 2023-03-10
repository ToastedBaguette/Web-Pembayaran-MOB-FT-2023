<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Auth;

use Illuminate\Support\Facades\Hash;

class ChangePasswordController extends Controller
{
    function admin(){
        if(Auth::user()->admin != 5){
            abort(403); 
        }
        else{
            $users = DB::table('users')->select('id','email')->get();
            return view('layouts.admin-change',compact('users'));
        }
    }

    function dummy(Request $request){
        $idemail = $request->get('email');
        $pws = $request->get('pws');
        DB::table('users')->where('id',$idemail)->update(['password'=>Hash::make($pws), 'is_reset'=> true]);

        return redirect()->route('admin-change')->with('status','Berhasil mengubah passowrd users');
    }

    function change(Request $request){
        try {
            $validator = $request->validate([
                'password' => ['required', 'string', 'min:8', 'confirmed'],
            ]);
            // if($validator->fails()){
            //     return redirect()->route('change')->withErrors($validator);
            // }
            $password = $request->get('password');
            DB::table('users')->where('id',Auth::user()->id)->update(['password'=>Hash::make($password), 'is_reset'=> false]);
            return redirect()->route('dashboard')->with('status','Berhasil mengubah passoword');
        } catch (\PDOException $e) {
            return redirect()->route('dashboard')->with('error','gagal mengubah passowrd, silahkan mencoba beberapa saat lagi');
        }


    }
}
