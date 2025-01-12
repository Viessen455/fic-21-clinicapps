<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class DoctorController extends Controller
{
    //index
    public function index()
    {
        $doctors = User::where('role', 'doctor')->with('clinic', 'specialist')->get();
        return response()->json([
            'status' => 'success',
            'data' => $doctors
        ]);
    }

    //store
    public function store(Request $request)
    {
        try {
            $request->validate([
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'role' => 'required',
                'clinic_id' => 'required',
                'specialist_id' => 'required',
            ]);

            $data = $request->all();
            $data['password'] = Hash::make($request->specialist_id);
            $doctor  = User::create($data);
            //upload image
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $image_name = time() . '.' . $image->getClientOriginalExtension();
                $filePath = $image->storeAs('doctor', $image_name, 'public');
                $doctor->image = '/storage/' . $filePath;
                $doctor->save();
            }

            return response()->json([
                'status' => 'success',
                'data' => $doctor
            ], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => 'error',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    //update
    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'name' => 'required',
                'email' => 'required',
                'role' => 'required',
                'clinic_id' => 'required',
                'specialist_id' => 'required',
            ]);

            $data = $request->all();
            $doctor = User::find($id);
            $doctor->update($data);
            //upload image
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $image_name = time() . '.' . $image->getClientOriginalExtension();
                $filePath = $image->storeAs('doctor', $image_name, 'public');
                $doctor->image = '/storage/' . $filePath;
                $doctor->save();
            }

            return response()->json([
                'status' => 'success',
                'data' => $doctor
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => 'error',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    //destroy
    public function destroy($id)
    {
        $doctor = User::find($id);
        $doctor->delete();
        return response()->json([
            'status' => 'success',
            'message' => 'Doctor deleted'
        ]);
    }

    //getDoctorActive
    public function getDoctorActive()
    {
        $doctors = User::where('role', 'doctor')->where('status', 'active')->with('clinic', 'specialist')->get();
        return response()->json([
            'status' => 'success',
            'data' => $doctors
        ]);
    }

    //get search doctor by name and category specialist
    public function searchDoctor(Request $request)
    {
        $doctors = User::where('role', 'doctor')
            ->where('name', 'like', '%' . $request->name . '%')
            ->where('specialist_id', $request->specialist_id)
            ->with('clinic', 'specialization')
            ->get();
        return response()->json([
            'status' => 'success',
            'data' => $doctors
        ]);
    }

    //get doctor by id
    public function getDoctorById($id)
    {
        $doctor = User::find($id);
        return response()->json([
            'status' => 'success',
            'data' => $doctor
        ]);
    }

    //get doctor by clinic
    public function getDoctorByClinic($clinic_id)
    {
        $doctors = User::where('role', 'doctor')->where('clinic_id', $clinic_id)->with('clinic', 'specialization')->get();
        return response()->json([
            'status' => 'success',
            'data' => $doctors
        ]);
    }

    //get doctor by specialist
    public function getDoctorBySpecialist($specialist_id)
    {
        $doctors = User::where('role', 'doctor')->where('specialist_id', $specialist_id)->with('clinic', 'specialization')->get();
        return response()->json([
            'status' => 'success',
            'data' => $doctors
        ]);
    }

    //get clinic detail by id
    public function getClinicById($id)
    {
        $clinic = \App\Models\Clinic::find($id);
        $clinicName = $clinic->name;
        $clinicImage = $clinic->image;
        $totalDoctor = User::where('clinic_id', $id)->count();
        $totalPatient = \App\Models\Order::where('clinic_id', $id)->count();
        $totalIncome = \App\Models\Order::where('clinic_id', $id)->where('status', 'Success')->sum('price');
        return response()->json([
            'status' => 'success',
            'data' => [
                'clinic_name' => $clinicName,
                'total_doctor' => $totalDoctor,
                'total_patient' => $totalPatient,
                'clinic_image' => $clinicImage,
                'total_income' => $totalIncome
            ]
        ]);
    }
}
