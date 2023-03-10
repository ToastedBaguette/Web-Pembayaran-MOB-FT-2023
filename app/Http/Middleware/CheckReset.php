<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class CheckReset
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // dd(Auth::user());
        if(Auth::user() == null){
            return redirect('login');
        }
        if(Auth::user()->is_reset == true){
            return redirect('change-password');
        }
        
        return $next($request);
    }
}
