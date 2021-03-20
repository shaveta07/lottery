<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Admin;
use App\User;
use DB;

use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('admin.index');
    }
    public function myaccount()
    {
        return view('admin.myaccount');
    }
    
    public function updateaccount(Request $request)
    {
		
         $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'user_type' => ['required', 'string', 'max:20'],
            'email' => ['required', 'string', 'email', 'max:255'], //, 'unique:users,email'
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
            return redirect()->route('myaccount')
                        ->withErrors($validator)
                        ->withInput();
        }
        
        if($request->password == ''){
        DB::table('users')
              ->where('id', $request->id)
              ->update([
              'email' => $request->email,
              'name'=>$request->name,
              //'user_type'=>$request->user_type,
              'phone'=>$request->phone,
              'city'=>$request->city,
              'state'=>$request->state,
              'zipcode'=>$request->zipcode,
              'address1'=>$request->address1,
              'address2'=>$request->address2
              ]);
		}else{
			
			if($request->password != null && ($request->password == $request->confirm_password)){
				
				
			 DB::table('users')
              ->where('id', $request->id)
              ->update([
              'email' => $request->email,
              'name'=>$request->name,
              'password'=>Hash::make($request->password),
              //'user_type'=>$request->user_type,
              'phone'=>$request->phone,
              'city'=>$request->city,
              'state'=>$request->state,
              'zipcode'=>$request->zipcode,
              'address1'=>$request->address1,
              'address2'=>$request->address2
              ]);
			}else{
				
            return back()->with('error','Password and Confirm Password does not matched!');
				}
		}
		return redirect()->route('myaccount')->with('success','Your account has been updated successfully!');
    }
    
    public function userlist(Request $request){
		$users = DB::table('users')
              ->where('user_type', 'user')->get();
              
         return view('admin.users',compact('users'));  
		}
		
	public function orgnizerlist(Request $request){
		$orgnizers = DB::table('users')
              ->where('user_type', 'orgnizer')->paginate(15);
              
         return view('admin.orgnizers',compact('orgnizers'));  
		}
		
		
	public function addOrgnizer(Request $request){
		return view('admin.addOrgnizer');  
		}

		
    public function addUser(Request $request){
		
		return view('admin.addUser');
		}

		
	public function saveOrgnizer(Request $request){
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
            return redirect()->route('addOrgnizer')
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
			
		
		return redirect()->route('orgnizers')->with('success','Orgnizer has been saved successfully!');
		 
		}
		
    public function saveUser(Request $request){
		
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
			
		
		return redirect()->route('frontend.index')->with('success','User has been registered successfully!');
		
	}
	
		
		
	public function updateOrgnizer(Request $request, $id){
		$orgnizer = DB::table('users')->find($id);
		 return view('admin.updateOrgnizer',compact('orgnizer')); 
		}
		
   
		
	public function updateUser(Request $request, $id){
		
		$user = DB::table('users')->find($id);
		return view('admin.updateUser',compact('user'));
		}
		
		
	public function editOrgnizer(Request $request, $id){
		//$orgnizer = DB::table('users')->find($id);
		
		$validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            
            'email' => ['required', 'string', 'email', 'max:255'], //, 'unique:users,email'
            
            'phone' => ['required', 'string', 'min:10','max:12'],
            'city' => ['required', 'string', 'min:2'],
            'state' => ['required', 'string', 'min:2'],
            'zipcode' => ['required', 'string', 'min:5','max:10'],
            'address1' => ['required', 'string', 'min:10','max:100'],
           
        ]);

        if ($validator->fails()) {
			//Session::flash('error','Error!','Password and Confirm Password does not matched!');
            return redirect()->route('updateOrgnizer',$request->id)
                        ->withErrors($validator)
                        ->withInput();
        }
        
        if($request->password == ''){
        DB::table('users')
              ->where('id', $request->id)
              ->update([
              'email' => $request->email,
              'name'=>$request->name,
              'user_type'=>'orgnizer',
              'phone'=>$request->phone,
              'city'=>$request->city,
              'state'=>$request->state,
              'zipcode'=>$request->zipcode,
              'address1'=>$request->address1,
              'address2'=>$request->address2
              ]);
		}else{
			
			if($request->password != null && ($request->password == $request->confirm_password)){
				
				
			 DB::table('users')
              ->where('id', $request->id)
              ->update([
              'email' => $request->email,
              'name'=>$request->name,
              'password'=>Hash::make($request->password),
              'user_type'=>'orgnizer',
              'phone'=>$request->phone,
              'city'=>$request->city,
              'state'=>$request->state,
              'zipcode'=>$request->zipcode,
              'address1'=>$request->address1,
              'address2'=>$request->address2
              ]);
			}else{
				
            return back()->with('error','Password and Confirm Password does not matched!');
				}
		}
		
		 return redirect()->route('updateOrgnizer',$request->id)->with('success','Orgnizer has been saved successfully!');
		}
		
   
		
	public function editUser(Request $request, $id){
		
		$validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            
            'email' => ['required', 'string', 'email', 'max:255'], //, 'unique:users,email'
            
            'phone' => ['required', 'string', 'min:10','max:12'],
            'city' => ['required', 'string', 'min:2'],
            'state' => ['required', 'string', 'min:2'],
            'zipcode' => ['required', 'string', 'min:5','max:10'],
            'address1' => ['required', 'string', 'min:10','max:100'],
           
        ]);

        if ($validator->fails()) {
			//Session::flash('error','Error!','Password and Confirm Password does not matched!');
            return redirect()->route('updateUser',$request->id)
                        ->withErrors($validator)
                        ->withInput();
        }
        
        if($request->password == ''){
        DB::table('users')
              ->where('id', $request->id)
              ->update([
              'email' => $request->email,
              'name'=>$request->name,
              'user_type'=>'user',
              'phone'=>$request->phone,
              'city'=>$request->city,
              'state'=>$request->state,
              'zipcode'=>$request->zipcode,
              'address1'=>$request->address1,
              'address2'=>$request->address2
              ]);
		}else{
			
			if($request->password != null && ($request->password == $request->confirm_password)){
				
				
			 DB::table('users')
              ->where('id', $request->id)
              ->update([
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
			}else{
				
            return back()->with('error','Password and Confirm Password does not matched!');
				}
		}
		return redirect()->route('updateUser',$request->id)->with('success','Users has been saved successfully!');
		}
}
