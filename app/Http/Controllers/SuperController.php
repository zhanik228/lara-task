<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class SuperController extends Controller
{
    public function createUser(Request $request) {
        $user = $request->validate([
            'username' => 'required|unique:users',
            'password' => 'required',
            'email' => 'required',
        ]);

        $user = User::create([
            'username' => $request->username,
            'password' => $request->password,
            'email' => $request->email,
            'is_super' => false,
        ]);

        $token = $user->createToken('api')->plainTextToken;

        return response()->json([
            'status' => 'success',
            'message' => 'User successfully created',
            'token' => $token,
        ], 201);
    }
}
