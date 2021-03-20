<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Home;
use App\Car;
use App\Race;
use App\Racergroup;
use App\User;
use App\Models\Order;
use DB;
use Mail;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
     
    public function detail(Request $request)
    {
		//die(($request->id));
		$car = DB::table('cars')->where('id',$request->id)->first();
		$race = DB::table('races')->where('id',$car->race_id)->first();
        return view('frontend.detail',compact('car','race'));
    }
     public function checkout_process(Request $request)
    {
		session(['car_id' => $request->carid,'race_id'=>$request->raceid,'quantity'=>$request->quantity,'price'=>$request->ticketcost]);
		return redirect()->route('checkout')->with('success','product has been added in checkout');
        
    }

    public function checkout_submit(Request $request)
    {
      if (Auth::check()) {
        $userid = Auth::id();
    }
    else
    {
      $userid = '';
    }
		session(['user_id' => $userid, 'car_id' => $request->car_id,'race_id'=>$request->race_id,'quantity'=>$request->quantity, 'deposit'=>$request->deposit, 'price'=>$request->ticketcost]);
		return redirect()->route('checkout')->with('success','product has been added in checkout');
        
    }
     public function checkout(Request $request)
    {
		//die(($request->id));
		$car_id = session('car_id');
		$race_id = session('race_id');
		$car = DB::table('cars')->where('id',$car_id)->first();
		$race = DB::table('races')->where('id',$race_id)->first();
        return view('frontend.checkout',compact('car','race'));
    }
    //checkoutProcess
    public function tickets(){
		$cars = DB::table('cars')->orderBy('id', 'desc')->get();
		return view('frontend.tickets',compact('cars'));
		}
    
    public function userregistration(Request $request){
		
		$validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'user_type' => ['required', 'string', 'max:20'],
            'email' => ['required', 'string', 'email', 'max:255','unique:users,email'], //, 'unique:users,email'
            'password' => ['required', 'string', 'min:8'],
            'confirm_password' => ['required', 'string', 'min:8'],
            'phone' => ['required', 'string', 'min:10','max:12'],
            'city' => ['required', 'string', 'min:2'],
            'state' => ['required', 'string', 'min:2'],
            'zipcode' => ['required', 'string', 'min:5','max:10'],
            'address1' => ['required', 'string', 'min:10','max:100'],
           
        ]);

        if ($validator->fails()) {
			//Session::flash('error','Error!','Password and Confirm Password does not matched!');
            return redirect()->route('addUser')
                        ->withErrors($validator)
                        ->withInput();
        }
        

			 DB::table('users')
              ->insert([
              'email' => $request->email,
              'name'=>$request->name,
              'password'=>Hash::make($request->password),
              'user_type'=>'user',
              'phone'=>$request->phone,
              'city'=>$request->city,
              'state'=>$request->state,
              'zipcode'=>$request->zipcode,
              'address1'=>$request->address1,
              'address2'=>$request->address2
              ]);
			
		
		return redirect()->route('users')->with('success','User has been saved successfully!');
		
	}
	
    public function index()
    {
        return view('demo.index');
		    $cars = DB::table('cars')->orderBy('id', 'desc')->take(6)->get();
        return view('frontend.index',compact('cars'));
    }

    public function races()
    {
        return view('demo.races');
    }

    public function frontraces()
    {
		  $races = DB::table('races')->orderBy('id', 'desc')->get();
        return view('frontend.frontraces',compact('races'));
    }
    
    public function myaccount()
    {
        return view('admin.myaccount');
    }
    public function thankyou(Request $request)
    {
		if(!Auth::user()){
			return redirect()->route('users')->with('success','please login first. ');
			}
      $name = $request->name;
      $email = $request->email;
      $phone = $request->phone;
    
      if($request->user_type == '' || $request->user_type== null)
      {
        $user_type= 'user';
      }
      else
      {
        $user_type = $request->user_type;
      }
      
      /*
      if($request->id == '' || $request->id== null)
      {
         $user = User::insertGetId([
           'name' => $name,
           'email' => $email,
           'phone' => $phone,
           'user_type' => $user_type,
           'password'=>Hash::make($request->phone)
         ]);
      }
      else
      {
        $user = User::where('id', $request->id)->update([
          'name' => $name,
          'email' => $email,
          'phone' => $phone,
          'user_type' => $user_type
        ]);
      }
      */
      if($request->id == '' || $request->id== null)
      {
        $userid = $user;
      }
      else{
        $userid = $request->id;
      }
      if($request->deposit == '0.00' || $request->deposit== null)
      {
        $deposit ='no';
        $depositamt = '0.00';
      }
      else{
        $deposit ='yes';
        $depositamt = $request->deposit;
      }

      $order = Order::insert([
        'race_id' => $request->race_id,
        'user_id' => $userid,
        'amount' => $request->total,
        'quantity' => $request->quantity,
        'orderdate' => NOW(),
        'deposit' => $deposit,
        'depositamount' => $depositamt
         ]);
         
$data = array('name'=>"Folkraces");
      Mail::send('frontend.email.order', $data, function($message) {
         $message->to(auth()->user()->email, 'Folkraces Orders')->subject
            ('You have ordered successfully on folkraces.');
         $message->from('folkraceapp@spiderwebbie.com','folkraces');
      });
      
  session([ 'car_id' => null,'race_id'=>null,'quantity'=>0,'price'=>0, 'deposit' => '0.00']);
  Auth::loginUsingId($userid, true);
  $request->session()->forget('car_id');
  $request->session()->forget('race_id');
  $request->session()->forget('quantity');
  $request->session()->forget('deposit');
  $request->session()->forget('price');
  
  return view('frontend.thank');

    }
 
    
 public function basic_email() {
      $data = array('name'=>"Virat Gandhi");
   
      Mail::send(['text'=>'mail'], $data, function($message) {
         $message->to('abc@gmail.com', 'Tutorials Point')->subject
            ('Laravel Basic Testing Mail');
         $message->from('xyz@gmail.com','Virat Gandhi');
      });
      echo "Basic Email Sent. Check your inbox.";
   }
   public function html_email() {
      $data = array('name'=>"Virat Gandhi");
      Mail::send('mail', $data, function($message) {
         $message->to('abc@gmail.com', 'Tutorials Point')->subject
            ('Laravel HTML Testing Mail');
         $message->from('xyz@gmail.com','Virat Gandhi');
      });
      echo "HTML Email Sent. Check your inbox.";
   }
   public function attachment_email() {
      $data = array('name'=>"Virat Gandhi");
      Mail::send('mail', $data, function($message) {
         $message->to('abc@gmail.com', 'Tutorials Point')->subject
            ('Laravel Testing Mail with Attachment');
         $message->attach('C:\laravel-master\laravel\public\uploads\image.png');
         $message->attach('C:\laravel-master\laravel\public\uploads\test.txt');
         $message->from('xyz@gmail.com','Virat Gandhi');
      });
      echo "Email Sent with attachment. Check your inbox.";
   }
}
