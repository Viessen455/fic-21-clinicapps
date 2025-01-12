<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Google_Client;
use Carbon\Carbon;

class UserController extends Controller
{
    //index
    public function index($email)
    {
        $user = User::where('email', $email)->first();
        return response()->json([
            'status' => 'success',
            'data' => $user
        ]);
    }

    //update googleid

    public function updateGoogleId(Request $request, $id)
    {
        $request->validate([
            'google_id' => 'required'
        ]);

        $user = User::find($id);

        if ($user) {
            $user->google_id = $request->google_id;
            $user->save();

            return response()->json([
                'status' => 'success',
                'data' => $user
            ]);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'User not found'
            ], 404);
        }
    }

    //update user
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required',
            'birth_date' => 'required',
            'gender' => 'required',
            'phone_number' => 'required',
        ]);

        $data = $request->all();

        $tanggal = Carbon::createFromFormat('d-m-Y', $data['birth_date'])->format('Y-m-d');
        $data['birth_date'] = $tanggal;

        $user = User::find($id);
        $user->update($data);

        return response()->json([
            'status' => 'success',
            'data' => $user
        ]);
    }

    //check email
    public function checkEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);

        $email = $request->email;
        $user = User::where('email', $email)->first();

        if ($user) {
            return response()->json([
                'status' => 'success',
                'message' => 'Email already registered',
                'valid' => false
            ]);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Email not registered',
                'valid' => true
            ], 404);
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $email = $request->email;
        $password = $request->password;

        $user = User::where('email', $email)->first();

        if (!$user || !Hash::check($password, $user->password)) {
            return response()->json([
                'status' => 'error',
                'message' => 'Invalid credentials',
            ], 401);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'status' => 'success',
            'data' => [
                'user' => $user,
                'token' => $token
            ]
        ], 200);
    }

    //logout
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Token deleted'
        ]);
    }

    //store
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'role' => 'required',
        ]);

        $data = $request->all();
        $name = $request->name;
        $email = $request->email;
        $password = Hash::make($request->password);
        $role = $request->role;

        $user = User::create([
            'name' => $name,
            'email' => $email,
            'password' => $password,
            'role' => $role,
        ]);

        return response()->json([
            'status' => 'success',
            'data' => $user
        ], 201);
    }

    public function loginGoogle(Request $request)
    {
        $idToken = $request->id_token;

        //verify google id token
        $client = new Google_Client(['client_id' => '134890297909-ti1c95bcmvps9jblmeclnbt7e174cmc0.apps.googleusercontent.com']);

        $payload = $client->verifyIdToken($idToken);

        if ($payload) {
            $googleId = $payload['sub'];
            $email = $payload['email'];
            $name = $payload['name'];
            $photo = $payload['picture'];

            $user = User::where('email', $email)->first();

            if ($user) {
                //update google id
                $user->google_id = $googleId;
                $user->save();
                $token = $user->createToken('auth_token')->plainTextToken;

                return response()->json([
                    'status' => 'success',
                    'data' => [
                        'user' => $user,
                        'is_new' => false,
                        'token' => $token
                    ]
                ], 200);
            } else {
                $user = User::create([
                    'name' => $name,
                    'email' => $email,
                    'google_id' => $googleId,
                    'password' => Hash::make($googleId),
                    'image' => $photo,
                    'role' => 'patient'
                ]);

                $token = $user->createToken('auth_token')->plainTextToken;

                return response()->json([
                    'status' => 'success',
                    'data' => [
                        'user' => $user,
                        'is_new' => true,
                        'token' => $token
                    ]
                ], 201);
            }
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Invalid google id token'
            ], 401);
        }
    }

    public function updateToken(Request $request, $id)
    {
        $request->validate([
            'one_signal_token' => 'required'
        ]);

        $token = $request->one_signal_token;

        $user = User::find($id);

        $user->update([
            'one_signal_token' => $token
        ]);

        return response()->json([
            'status' => 'success',
            'data' => $user
        ], 200);
    }
}

