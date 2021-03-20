<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Admin;
use App\User;
use DB;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Contracts\JWTSubject;

use Illuminate\Http\Request as LaravelRequest;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Foundation\Auth\ResetsPasswords;

class ApiController extends Controller
{
    use ResetsPasswords;
    use SendsPasswordResetEmails,ResetsPasswords {
            SendsPasswordResetEmails::credentials insteadof ResetsPasswords;
            SendsPasswordResetEmails::broker insteadof ResetsPasswords;
    }

    // use ResetsPasswords;

    public $loginAfterSignUp = true;
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','register','forgotpassword', 'reset']]);
    }



    // api: http://staging.folkraceapp.se/api/auth/login
    // parameters : email,password
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors()->first(),
            ]);
        }
        $credentials = request(['email', 'password']);
        $token = null;
        if (! $token = auth::guard('api')->attempt($credentials)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid Email or Password',
            ], Response::HTTP_UNAUTHORIZED);
        }
        return response()->json([
            'success' => true,
            'token' => $token,
        ]);
        // return $this->respondWithToken($token);
    }



    // api: http://staging.folkraceapp.se/api/auth/register
    // paramets - name,email,password,password_confirmation,phone,dateofbirth,countries
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'phone' => ['required', 'string', 'min:10'],
            'dateofbirth' => ['required', 'string'],
            'countries' => ['required']
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors()->first(),
            ]);
        }
       // return "bgbgh";
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->user_type = 'user';
        $user->password = Hash::make($request->password);
        $user->phone = $request->phone;
        $user->dateofbirth = date('Y-m-d',strtotime($request->dateofbirth));
        $user->countries = $request->countries;

        $user->save();
        // $token = auth()->login($user);

    
        if ($this->loginAfterSignUp) {
            return $this->login($request);
        }
        return response()->json([
            'success' => true,
            'data' => $user
        ], Response::HTTP_OK);
    }



    // api: http://staging.folkraceapp.se/api/auth/forgotpassword
    // paramets - email
    public function forgotpassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors()->first(),
            ]);
        }
        // $user = User::find($id);
        $user = User::where('email', $request->email)->first();

        if ($user === null) {
          // ajax response if user not found
          return response()->json([ 'result' => 'error', 'message' => 'User not found.' ]);
        }
  
        try {
          // create new Illuminate\Http\Request
          $laravel_request = new LaravelRequest();
          // merge in the user's email address
          $laravel_request->merge([ 'email' => $user->email ]);
  
          // trigger password reset email
          $this->sendResetLinkEmail($request);
  
          // return json response
          return response()->json([ 'result' => 'success', 'message' => 'We have emailed your password reset link! to your email' . $user->email ]);
        } catch (\Exception $e) {
          // error
          return response()->json([ 'result' => 'error', 'message' => $e->getMessage() ]);
        }

        /*
        $user = User::where('email', $request->email)->first();
        if(is_null($user)) {
            return response()->json([
                'status' => false,
                'message' => "User with this email doesn't exist to database",
            ]);
        }else{
            //$otp = rand(1000,9000);
            $email = $request->email;
            \Mail::send([], [], function ($message) use ($user,$email) {
                $message->from('do-not-reply@testingbirds.com', 'Testing Birds');
                $message->to($email, 'John Doe');
                $message->subject('Reset your password.');
            });

            // $user = DB::table('users')
            //     ->where('email', $request->email)
            //     ->update(['otp' => $otp]);

            return response()->json([
                'status' => true,
                'message' => 'We have emailed your password reset link!',
            ]);
        }
        */

    }


    // api: http://staging.folkraceapp.se/api/auth/reset
    // parametes: email,password,confirm password,token
    public function reset(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'token' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors()->first(),
            ]);
        }
        // $user = User::where('email', $request->email)->first();

        // if ($user === null) {
        //   // ajax response if user not found
        //   return response()->json([ 'result' => 'error', 'message' => 'User not found.' ]);
        // }
  
        try {
            // create new Illuminate\Http\Request
            // $laravel_request = new LaravelRequest();
            // merge in the user's email address
            // $laravel_request->merge(['email' => $request->email]);
            // $laravel_request->merge(['password' => $request->email]);
            // $laravel_request->merge(['password_confirmation' => $request->email]);
            // $laravel_request->merge(['token' => $request->email]);

            // return $laravel_request;
  
            // trigger password reset
            // $response = $this->showResetForm($laravel_request);
            
            // TODO
            
            $chktkn = DB::table('password_resets')->where('token',$request->token)->first();
            if($chktkn)
            {
                // new password
                // $user->password = Hash::make($password);

                DB::table('users')->where('email', $request->email)->update([
                    'password'  => Hash::make($request->password) 
                ]);

                // return $response;
    
            // return json response
            return response()->json([ 'result' => 'success', 'message' => 'Password Reset ' . $request->email ]);
            }
            else{
                return response()->json([ 'result' => 'success', 'message' => 'Token Invaild ' . $request->email ]); 
            }
        }
        catch (\Exception $e)
        {
            return $e;
          // error
          return response()->json([ 'result' => 'error', 'message' => $e->getMessage() ]);
        }
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth()->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();
        return response()->json([
            'success' => true,
            'message' => 'User logged out successfully'
        ]);
        //return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}

