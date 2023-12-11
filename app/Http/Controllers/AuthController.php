<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'email' => 'required',
            'password' => 'required'
        ]);

        $username = $request->only('username');
        $userInDB = User::where('username', $username)->first();

        if (!$userInDB) {
            return response()->json([
                'status' => 'failed',
                'message' => 'The user with this username does not exist'
            ], 404);
        }

        if ($userInDB->email !== $request->email) {
            return response()->json([
                'status' => 'failed',
                'message' => 'Email is not correct'
            ], 401);
        }

        if (!Hash::check($request->password, $userInDB->password)) {
            return response()->json([
                'status' => 'failed',
                'message' => 'password is not correct'
            ], 401);
        }

        $token = $userInDB->createToken('api')->plainTextToken;

        return response()->json([
            'status' => 'success',
            'message' => 'Successfully logged in',
            'token' => $token,
        ], 201);
    }

    public function index() {
        return response('Unauthorized', 401);
    }
}
