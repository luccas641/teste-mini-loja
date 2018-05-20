<?php

namespace App\Http\Controllers\Api;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;

class AuthController extends Controller
{
      /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {
        $credentials = request(['email', 'password']);
        $token = auth('api')->attempt($credentials);
        if (!$token) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return response([
            'status' => "success"
        ])
        ->header('Authorization', $token);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        $user = User::find(Auth::user()->id);

        return response([
                'status' => 'success',
                'data' => $user
            ]);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        $token = auth('api')->refresh();

        return response([
            'status' => "success"
        ])
        ->header('Authorization', $token);;
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }

    /**
     * Register user
     *
     * @param  Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     */

    public function register(Request $request)
    {
        $user = $this->validate($request, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'code' => 'required|string',
            'address' => 'required|string',
            'suburb' => 'required|string',
            'city' => 'required|string',
            'state' => 'required|string',
            'phone' => 'required|string',
        ]);
        
        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => bcrypt($request->input('password')),
            'code' => $request->input('code'),
            'address' => $request->input('address'),
            'suburb' => $request->input('suburb'),
            'city' => $request->input('city'),
            'state' => $request->input('state'),
            'phone' => $request->input('phone')
        ]);
        
        $user->save();
        return response([
            'status' => 'success',
            'data' => $user
        ], 200);
    }

}
