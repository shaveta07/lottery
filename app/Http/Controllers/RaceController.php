<?php

namespace App\Http\Controllers;

use App\Models\Race;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Session;
use Auth;
use Hash;
use App\Models\Car;
use App\Models\Racergroup;
use App\Models\User;
use DB;

class RaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $races = DB::table('races')->paginate(15);
              
         return view('admin.races.index',compact('races')); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
		$cars = DB::table('cars')->get();
		$racergroups = DB::table('racergroups')->get();
        return view('admin.races.create',compact('cars','racergroups')); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //print_r($request->all()); die();
        $validator = Validator::make($request->all(), [
            'user_id' => ['required', 'string', 'max:255'],
            'car_id' => ['required', 'string', 'max:20'],
            'racergroup_id' => ['required', 'string', 'max:255'],
            'driver' => ['required', 'string', 'min:8'],
            'driverdob' => ['required', 'string', 'min:10','max:12'],
            'ticketcost' => ['required', 'string', 'min:2'],
            'deposit' => ['required', 'string', 'min:2'],
           
           
        ]);

        if ($validator->fails()) {
			
            return redirect()->route('races.create')
                        ->withErrors($validator)
                        ->withInput();
        }
                
        $file = $request->file('photo');
        if($file)
        {
                    // File Details 
                    $photo=$filename = $file->getClientOriginalName();
                    $extension = $file->getClientOriginalExtension();
                    $tempPath = $file->getRealPath();
                    $fileSize = $file->getSize();
                    $mimeType = $file->getMimeType();
                    
                    // Valid File Extensions
                    $valid_extension = array("jpg","JPEG","PNG","png","JPG","jpeg");

                    // 2MB in Bytes
                    $maxFileSize = 2097152; 
                        
                    // Check file extension
                    if(in_array(strtolower($extension),$valid_extension)){

                        // Check file size
                        if($fileSize <= $maxFileSize){

                        // File upload location
                        $location = public_path('races');
                        $location2 = 'races';

                        // Upload file
                        $file->move($location,$filename);
                        $path = "public/races/".$filename;
                        
                    }
                }
        }
        
        //DB::table('cars')->insert($request->all());
        //$carModel = new Car();
        //$carModel->create($request->all());
        $user = User::where('id',$request->user_id)->first();
        Race::insert([
            'name' => $user->name,
            'user_id' => $request->user_id,
            'racergroup_id' =>$request->racergroup_id,
            'driver' => $request->driver,
            'driverdob' => $request->driverdob,
            'ticketcost' => $request->ticketcost,
            'deposit' => $request->deposit,
            'car_id' => $request->car_id,
            'images' => $path,
            'race_date' => date('Y-m-d')


        ]);
        //Race::create($request->all());
        return redirect()->route('races.index')->with('success','Race has been inserted successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Race  $race
     * @return \Illuminate\Http\Response
     */
    public function show(Race $race)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Race  $race
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $race = DB::table('races')->find($request->id);
		$cars = DB::table('cars')->get();
		$racergroups = DB::table('racergroups')->get();
		 
        //return view('admin.cars.edit',compact('car'));
        return view('admin.races.edit',compact('race','cars','racergroups'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Race  $race
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Race $race)
    {
        //print_r($request->all()); die();
        $validator = Validator::make($request->all(), [
            'user_id' => ['required', 'string', 'max:255'],
            'car_id' => ['required', 'string', 'max:20'],
            'racergroup_id' => ['required', 'string', 'max:255'],
            'driver' => ['required', 'string', 'min:8'],
            'driverdob' => ['required', 'string', 'min:10','max:12'],
            'ticketcost' => ['required', 'string', 'min:2'],
            'deposit' => ['required', 'string', 'min:2'],
           
           
        ]);

        if ($validator->fails()) {
			
            return redirect()->route('races.edit',$race->id)
                        ->withErrors($validator)
                        ->withInput();
        }
        // unset($request['_token']);
      
        $file = $request->file('photo');
        if($file)
        {
                // File Details 
                $photo = $filename = $file->getClientOriginalName();
                $extension = $file->getClientOriginalExtension();
                $tempPath = $file->getRealPath();
                $fileSize = $file->getSize();
                $mimeType = $file->getMimeType();
                
                // Valid File Extensions
                $valid_extension = array("jpg","JPEG","PNG","png","JPG","jpeg");
        
                // 2MB in Bytes
                $maxFileSize = 2097152; 
                
                // Check file extension
                if(in_array(strtolower($extension),$valid_extension)){
        
                // Check file size
                if($fileSize <= $maxFileSize){
        
                    // File upload location
                    $location = public_path('races');
                    $location2 = 'races';
        
                    // Upload file
                    $file->move($location,$filename);
                    $path = "public/races/".$filename;
                }
            }
        }

        $user = User::where('id',$request->user_id)->first();
		
        Race::where('id', $request->id)->update([
            'name' => $user->name,
            'user_id' => $request->user_id,
            'racergroup_id' =>$request->racergroup_id,
            'driver' => $request->driver,
            'driverdob' => $request->driverdob,
            'ticketcost' => $request->ticketcost,
            'deposit' => $request->deposit,
            'car_id' => $request->car_id,
            'images' => $path


        ]);
        return redirect()->route('races.edit',$race->id)->with('success','Race has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Race  $race
     * @return \Illuminate\Http\Response
     */
    public function destroy(Race $race)
    {
        $race->delete();
        return redirect()->route('races.index')->with('success','Race has been deleted successfully!');
    }
    
    public function getracescar(Request $request)
    {
		
        $carrace = DB::table('races')->find($request->raceid);
        $cars = Car::where('race_id', $request->raceid)->get();
        return view('frontend.racecars',compact('cars','carrace'));
    }
}
