<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use DB;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'phone' => ['required', 'string', 'min:10'],
            'dateofbirth' => ['required', 'string'],
            'countries' => ['required']
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
		
        $x = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'user_type' => $data['user_type'],
            'phone' => $data['phone'],
            'dateofbirth' => $data['dateofbirth'],
            'countries' => $data['countries'],
            
            'password' => Hash::make($data['password']),
        ]);
        
        User::where('id',$x->id)->update([
            'user_type' => ($data['user_type']!='')?$data['user_type']:'user',
            'phone' => $data['phone'],
            'dateofbirth' => $data['dateofbirth'],
            'countries' => $data['countries'],
        ]);
        
        return $x;
        /*
         * //DB::table('users')->insertGetId
         return DB::table('users')
              ->insert([
            'name' => $data['name'],
            'email' => $data['email'],
            'user_type' => $data['user_type'],
            'phone' => $data['phone'],
            'dateofbirth' => $data['dateofbirth'],
            'countries' => $data['countries'],
            
            'password' => Hash::make($data['password']),
        ]);
    }
         */ 
    }
}
