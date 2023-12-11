<?php

namespace App\Http\Controllers;

use App\Models\Link;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Str;

class LinkController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return ['your_links' => $request->user()->links];
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'original_link' => 'required',
            'is_private' => 0,
        ]);

        Link::create([
            'original_link' => $request->original_link,
            'token' => $request->token || Str::random(10),
            'is_private' => $request->is_private,
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'successfully created'
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Link::find($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function redirect(User $user, $token) {
        $link = $user->links()->where('token', $token)->first();

        if (!$link) {
            $link = $user->links()->where('private_token', $token)->first();
        }

        if ($link->is_private == 1 && $link->private_token !== $token) {
            return response()->json([
                'status' => 'forbidden',
                'message' => 'This is a private link'
            ], 403);
        }

        return Redirect::to($link->original_link);
    }
}
