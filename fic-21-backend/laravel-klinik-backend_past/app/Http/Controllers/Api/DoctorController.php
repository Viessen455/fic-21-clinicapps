<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;


class DoctorController extends Controller
{
    public function index(){
        $doctors = User::where('role', 'doctor')->with('clinic','specialization')->get();

        return response()->json([
            'status' => 'success',
            'data' => $doctors
        ]);

    }

    public function store(Request $request){

        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'role' => 'required',
            'clinic_id' => 'required',
            'specialis_id' => 'required',
        ]);

            $data = $request->all();
            $data['password'] = Hash::make($request->password);
            $doctor = User::create($data);

            // upload image
            if($request->hasFile('image')){
                $image = $request->file('image');
                $image_name = time().'.'.$image->getClientOriginalExtension();
                $filePath = $image->storeAs('doctor',  $image_name,  'public');
                $doctor->image = '/storage/'.$filePath;
                $doctor->save();
            }

            return response()->json([
                'status'  => 'success',
                'data' => $doctor
            ], 201);
    }


    public function update(Request $request, $id){

        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'role' => 'required',
            'clinic_id' => 'required',
            'specialis_id' => 'required',
        ]);

            $data = $request->all();
            $doctor = User::find($id);
            $doctor->update($data);

            // upload image
            if($request->hasFile('image')){
                $image = $request->file('image');
                $image_name = time().'.'.$image->getClientOriginalExtension();
                $filePath = $image->storeAs('doctor',  $image_name,  'public');
                $doctor->image = '/storage/'.$filePath;
                $doctor->save();
            }

            return response()->json([
                'status'  => 'success',
                'data' => $doctor
            ], 201);
    }

    // destroy
    public function destroy($id){
        $doctor = User::find($id);
        $doctor->delete();

        return response()->json([
            'status'  => 'success',
            'message' => 'Doctor Deleted'
        ]);
    }

    // getDoctorActive
    public function getDoctorActive(){

        $doctors = User::where('role', 'doctor')->where('status',  'active')->with('clinic', 'status');
        return response()->json([
            'status'  => 'success',
            'data' => $doctors
        ]);
    }

    // get search doctor by name and category specialist
    public function searchDoctor(Request $request){
        $doctors = User::where('role', 'doctor')
        ->where('name', 'like', '%'.$request->name,'%')
        ->where('specialist_id', $request->specialist_id)
        ->with('clinic', 'specialization')
        ->get();

        return response()->json([
            'status'  => 'success',
            'data' => $doctors
        ]);

    }

    public function getDoctorById($id){
        $doctor= User::find($id);

        return response()->json([
            'status'  => 'success',
            'data' => $doctor
        ]);
    }

    public function getDoctorByClinic($clinic_id){

        $doctors = User::where('role', 'doctor')->where('clinic_id',  $clinic_id)->with('clinic', 'specialization')->get();
        return response()->json([
            'status'  => 'success',
            'data' => $doctors
        ]);

    }

    // get doctor by specialist
    public function getDoctorBySpecialist($specialist_id){

        $doctors = User::where('role', 'doctor')->where('specialist_id',  $specialist_id)->with('clinic', 'specialization')->get();
        return response()->json([
            'status'  => 'success',
            'data' => $doctors
        ]);

    }
}
