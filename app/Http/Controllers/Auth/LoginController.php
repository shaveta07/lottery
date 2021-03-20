<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    
    public function authenticated(Request $request, $user)
    {

        // return json_encode($request->all());

        if(auth()->user()->user_type == 'admin' || auth()->user()->user_type == 'staff'  || auth()->user()->user_type == 'orgnizer')
        {
            //CoreComponentRepository::instantiateShopRepository();
            return redirect()->route('dashboard');
        }elseif(auth()->user()->user_type == 'user'){
            
            if($request->url != null)
            {
                return redirect($request->url);
            }

			return redirect()->route('frontend.index');
			}
        elseif(session('link') != null){
            return redirect(session('link'));
        }
        else{
            return redirect()->route('dashboard');
        }
    }
    /*
     {
        if(auth()->user() != null && (auth()->user()->user_type == 'admin' || auth()->user()->user_type == 'staff')){
            $redirect_route = 'login';
        }
        else{
            $redirect_route = 'home';
        }

        $this->guard()->logout();

        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect()->route($redirect_route);
    }
    */
}
