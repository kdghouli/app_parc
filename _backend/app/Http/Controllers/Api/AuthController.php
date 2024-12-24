<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'name'      => 'required|string|max:255',
            'email'     => 'required|string|max:255|unique:users',
            'password'  => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $user = User::create([
            'name'      => $request->name,
            'email'     => $request->email,
            'password'  => Hash::make($request->password)
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;
        return response()->json([
            'data'          => $user,
            'access_token'  => $token,
            'token_type'    => 'Bearer'
        ]);
    }

public function login(Request $request,User $user){

    $validator = Validator::make($request->all(), [
        'email'     => 'required|string|max:255',
        'password'  => 'required|string'
      ]);
if ($validator->fails()) {
return response()->json($validator->errors());
}

$credentials = $request->only('email', 'password');

if (! Auth::attempt($credentials)) {
    return response()->json([
        'message' => 'User not found'
    ], 401);
}


$user   = User::where('email', $request->email)->firstOrFail();
$token  = $user->createToken('auth_token')->plainTextToken;

return response()->json([
    'message'       => 'Login success',
    'access_token'  => $token,
    'token_type'    => 'Bearer',
    'user' => $user
]);





}








public function logout(){

    $user = Auth::guard('sanctum')->user();

    if (!$user) {
        return response()->json(['error' => 'Unauthenticated'], 401);
    }

    try {
        // Revoke all tokens for the authenticated user
        $user->currentAccessToken()->delete();
    } catch (\Exception $e) {
        // Log the exception for investigation
        \Illuminate\Support\Facades\Log::error('Token revocation failed: ' . $e->getMessage());

        return response()->json(['error' => 'Unable to revoke tokens'], 500);
    }

    return response()->json(['message' => 'Tokens revoked successfully']);
}
}


// <?php

// namespace App\Http\Controllers\API;

// use Illuminate\Http\Request;
// use App\Http\Controllers\API\BaseController as BaseController;
// use App\Models\User;
// use Illuminate\Support\Facades\Auth;
// use Validator;
// use Illuminate\Http\JsonResponse;

// class RegisterController extends BaseController
// {
//     /**
//      * Register api
//      *
//      * @return \Illuminate\Http\Response
//      */
//     public function register(Request $request): JsonResponse
//     {
//         $validator = Validator::make($request->all(), [
//             'name' => 'required',
//             'email' => 'required|email',
//             'password' => 'required',
//             'c_password' => 'required|same:password',
//         ]);

//         if($validator->fails()){
//             return $this->sendError('Validation Error.', $validator->errors());
//         }

//         $input = $request->all();
//         $input['password'] = bcrypt($input['password']);
//         $user = User::create($input);
//         $success['token'] =  $user->createToken('MyApp')->plainTextToken;
//         $success['name'] =  $user->name;

//         return $this->sendResponse($success, 'User register successfully.');
//     }

//     /**
//      * Login api
//      *
//      * @return \Illuminate\Http\Response
//      */
//     public function login(Request $request): JsonResponse
//     {
//         if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
//             $user = Auth::user();
//             $success['token'] =  $user->createToken('MyApp')->plainTextToken;
//             $success['name'] =  $user->name;

//             return $this->sendResponse($success, 'User login successfully.');
//         }
//         else{
//             return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
//         }
//     }
// }














