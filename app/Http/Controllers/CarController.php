<?php

namespace App\Http\Controllers;

use App\Models\Car;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Session;
use Auth;
use Hash;
use App\Admin;
use App\User;
use DB;

class CarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cars = DB::table('cars')->paginate(15);
              
         return view('admin.cars.index',compact('cars')); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.cars.create'); 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
		$validator = Validator::make($request->all(), [
            'carname' => ['required', 'string', 'max:255'],
            'model' => ['required', 'string', 'max:20'],
            'maker' => ['required', 'string',  'max:255'],
            'color' => ['required', 'string', 'min:8'],
            //  'description' => ['required', 'string', 'min:10' ],
            'carowner' => ['required', 'string', 'min:2'],
           
           
        ]);

        if ($validator->fails()) {
			
            return redirect()->route('cars.create')
                        ->withErrors($validator)
                        ->withInput();
        }
        
        $file = $request->file('photo');
        if($file)
        {
                // File Details 
                $filename = $file->getClientOriginalName();
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
                    $location = public_path('cars');
                    $location2 = 'cars';

                    // Upload file
                    $file->move($location,$filename);
                    $path = "public/cars/".$filename;
                }
            }
        }
        
        //DB::table('cars')->insert($request->all());
        //$carModel = new Car();
        //$carModel->create($request->all());
        Car::insert([
            'race_id' => $request->car_id,
            'carname' => $request->carname,
            'model' => $request->model,
            'maker' => $request->maker,
            'color' => $request->color,
            'carowner' => $request->carowner,
            'photo' => $path,
            'status' => $request->status,
            'description' => $request->description
        ]);
        return redirect()->route('cars.index')->with('success','Car has been inserted successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function show(Car $car)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
		$car = DB::table('cars')->find($request->id);
		
		 
        //return view('admin.cars.edit',compact('car'));
        return view('admin.cars.edit',compact('car'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Car $car)
    {
		$validator = Validator::make($request->all(), [
            'carname' => ['required', 'string', 'max:255'],
            'model' => ['required', 'string', 'max:20'],
            'maker' => ['required', 'string',  'max:255'], //, 'unique:users,email'
            'color' => ['required', 'string', 'min:8'],
            // 'phone' => ['required', 'string', 'min:10','max:12'],
            'carowner' => ['required', 'string', 'min:2'],
           
           
        ]);

        if ($validator->fails()) {
			//Session::flash('error','Error!','Password and Confirm Password does not matched!');
            return redirect()->route('cars.edit',$car->id)
                        ->withErrors($validator)
                        ->withInput();
        }
       
      $file = $request->file('photo');
      
        if($file)
        {
           
                // File Details 
               $filename = $file->getClientOriginalName();
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
                    $location = public_path('cars');
                    $location2 = 'cars';

                    // Upload file
                    $file->move($location,$filename);
                    $path = "public/cars/".$filename;
                }
            }
        }
        else
        {
            $path='';
        }
  
        Car::where('id',$request->id)->update([
            'race_id' => $request->car_id,
            'carname' => $request->carname,
            'model' => $request->model,
            'maker' => $request->maker,
            'color' => $request->color,
            'carowner' => $request->carowner,
            'photo' => $path,
            'status' => $request->status,
            'description' => $request->description
        ]);
        return redirect()->route('cars.edit',$car->id)->with('success','car has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function destroy(Car $car)
    {
        $car->delete();
        return redirect()->route('cars.index')->with('success','car has been deleted successfully!');
    }
}
