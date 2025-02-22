<?php

namespace App\Providers;

use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot(UrlGenerator $url)
    {
        // if(env('APP_ENV') !== 'local')
        // {
        //     $url->forceSchema('https');
        // }

        $appEnv = env('APP_ENV');
        $host = request()->getHost();

        // Force HTTPS on production environment
        if ($appEnv === 'production' || str_contains($host, 'ngrok-free.app')) {
            $url->forceSchema('https');
        }
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
