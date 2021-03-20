<?php

namespace App\Http\Controllers;

use App\Models\Racergroup;
use Illuminate\Http\Request;
use Session;
use Auth;
use Hash;
use App\Admin;
use App\User;
use DB;

class RacergroupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $racergroups = DB::table('racergroups')->paginate(15);
              
         return view('admin.racergroups.index',compact('racergroups')); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.racergroups.create'); 
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
            'user_id ' => ['required', 'string', 'max:255'],
            'racingdate' => ['required', 'string', 'max:20'],
            'racingtiming' => ['required', 'string',  'max:255'],
            'ticketprice' => ['required', 'string', 'min:8'],
            'depositprice' => ['required', 'string', 'min:10','max:12'],

           
           
        ]);

        if ($validator->fails()) {
			
            return redirect()->route('racergroups.create')
                        ->withErrors($validator)
                        ->withInput();
        }
        
        //DB::table('cars')->insert($request->all());
        //$carModel = new Car();
        //$carModel->create($request->all());
        Racergroup::create($request->all());
        return redirect()->route('racergroups.index')->with('success','Racergroup has been created successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Racergroup  $racergroup
     * @return \Illuminate\Http\Response
     */
    public function show(Racergroup $racergroup)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Racergroup  $racergroup
     * @return \Illuminate\Http\Response
     */
    public function edit(Racergroup $racergroup)
    {
        
		$racergroups = DB::table('racergroups')->find($request->id);

        return view('admin.racergroups.edit',compact('racergroups'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Racergroup  $racergroup
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Racergroup $racergroup)
    {
       $validator = Validator::make($request->all(), [
            'user_id ' => ['required', 'string', 'max:255'],
            'racingdate' => ['required', 'string', 'max:20'],
            'racingtiming' => ['required', 'string',  'max:255'],
            'ticketprice' => ['required', 'string', 'min:8'],
            'depositprice' => ['required', 'string', 'min:10','max:12'],

           
           
        ]);

        if ($validator->fails()) {
			
            return redirect()->route('racergroups.create')
                        ->withErrors($validator)
                        ->withInput();
        }
		
        $racergroup->update($request->all());
        return redirect()->route('racergroups.edit',$racergroup->id)->with('success','Racer Group has been updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Racergroup  $racergroup
     * @return \Illuminate\Http\Response
     */
    public function destroy(Racergroup $racergroup)
    {
        $racergroup->delete();
        return redirect()->route('racergroup.index')->with('success','Racer group has been deleted successfully!');
    }
}
