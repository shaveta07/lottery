<?php

namespace App\Http\Controllers;

use App\Models\Organizerfile;
use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Car;
use App\Racergroup;
use App\User;
use DB;

class OrganizerfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		$organizerfiles = DB::table('organizerfiles')->where('user_id',Auth::user()->id)->paginate(15);
              
        
        return view('admin.Organizerfile.index',compact('organizerfiles'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.Organizerfile.create'); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\organizerfile  $organizerfile
     * @return \Illuminate\Http\Response
     */
    public function show(Organizerfile $organizerfile)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\organizerfile  $organizerfile
     * @return \Illuminate\Http\Response
     */
    public function edit(Organizerfile $organizerfile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\organizerfile  $organizerfile
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, organizerfile $organizerfile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\organizerfile  $organizerfile
     * @return \Illuminate\Http\Response
     */
    public function destroy(Organizerfile $organizerfile)
    {
        //
    }
    public function uploadFile(Request $request){

    if ($request->input('submit') != null ){

      $file = $request->file('file');

      // File Details 
      $filename = $file->getClientOriginalName();
      $extension = $file->getClientOriginalExtension();
      $tempPath = $file->getRealPath();
      $fileSize = $file->getSize();
      $mimeType = $file->getMimeType();
      
      // Valid File Extensions
      $valid_extension = array("csv");

      // 2MB in Bytes
      $maxFileSize = 2097152; 
		
      // Check file extension
      if(in_array(strtolower($extension),$valid_extension)){

        // Check file size
        if($fileSize <= $maxFileSize){

          // File upload location
          $location = public_path('uploads');
          $location2 = 'uploads';

          // Upload file
          $file->move($location,$filename);

          // Import CSV to Database
         $filepath = $location."/".$filename;
         $filepath2 = $location2."/".$filename;
			
			//Upload file
			DB::table('organizerfiles')-> insertGetId(array('user_id'=>auth()->user()->id,'filename'=>$filepath2));
			
          // Reading file
          $file = fopen($filepath,"r");

          $importData_arr = array();
          $i = 0;

          while (($filedata = fgetcsv($file, 1000, ",")) !== FALSE) {
             $num = count($filedata );
             
             // Skip first row (Remove below comment if you want to skip the first row)
             /*if($i == 0){
                $i++;
                continue; 
             }*/
             for ($c=0; $c < $num; $c++) {
                $importData_arr[$i][] = $filedata [$c];
             }
             $i++;
          }
          fclose($file);

//print_r($importData_arr);die;
          // Insert to MySQL database
          $i=0;
          foreach($importData_arr as $importData){
			  $i++;
			  if($i==1){
				  continue;
				  }
			/*
            $insertData = array(
               "username"=>$importData[1],
               "name"=>$importData[2],
               "gender"=>$importData[3],
               "email"=>$importData[4]);
            Page::insertData($insertData);
            */
            $userData = DB::table('users')->where('email',$importData[0])->first();
            //print_r($userData);die;
            $insertCar = array(
            "carname" => $importData[1],
            "model"=>$importData[2],
            "maker"=>$importData[3],
            "color"=>$importData[4],
            "carowner"=>$importData[5]
            ); 
            $lastinsertcarId = DB::table('cars')-> insertGetId($insertCar);
            
            $insertracergroups = array(
            "user_id"=>$userData->id,
            "racingdate" => $importData[6],
            "racingtiming"=>$importData[7],
            "ticketprice"=>$importData[8],
            "depositprice"=>$importData[9]
            
            );
            $lastinsertracergroupId = DB::table('racergroups')-> insertGetId($insertracergroups);
            
            $insertrace = array(
            "user_id"=>$userData->id,
            "car_id"=>$lastinsertcarId,
            "racergroup_id"=>$lastinsertracergroupId,
            "driver" => $importData[10],
            "driverdob"=>$importData[11],
            "ticketcost"=>$importData[8],
            "deposit"=>$importData[9]
            
            );
            $insertRace = DB::table('races')-> insertGetId($insertrace);

          }

          return redirect()->route('Organizerfile.create')->with('message','Import Successful.');
        }else{
          return redirect()->route('Organizerfile.create')->with('message','File too large. File must be less than 2MB.');
        }

      }else{
         return redirect()->route('Organizerfile.create')->with('message','Invalid File Extension.');
      }

    }

    // Redirect to index
    //return redirect()->action('Organizerfile@create');
    return redirect()->route('Organizerfile.create')->with('success','CSV Files has been Uploaded successfully!');
  }
}
