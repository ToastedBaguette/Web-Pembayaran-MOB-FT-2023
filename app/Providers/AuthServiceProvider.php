<?php

namespace App\Providers;

use Illuminate\Auth\Access\Response;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('isUser', function($user) {
            if ($user->admin == null) {
                return Response::allow();
            } else {
                return Response::deny();
            }
        });

        Gate::define('isAdmin', function($user) {
            if ($user->admin != null) {
                return Response::allow();
            } else {
                return Response::deny();
            }
        });
    }
}