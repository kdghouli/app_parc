<?php

namespace App\Http\Controllers;

use App\Models\vhl;
use Illuminate\Http\Request;
use App\Http\Resources\VhlResource;

class VhlController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // return response()->json(["status","oui"]);
        $vhls = vhl::all();

        return $vhls->toArray();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {




        $params = $request->all();
            $vhl = vhl::create([
                'matricule' => $params['matricule'],
                'marque' => $params['marque'],
                'date_mc' =>$params['date_mc'],
                'agence_id' => $params['agence_id'],
                'categorie_id' => $params['categorie_id'],
                'intitule_id' => $params['intitule_id'],
                'utilisateur_id' => $params['utilisateur_id']
            ]);

            return new VhlResource($vhl);


    }

    /**
     * Display the specified resource.
     */
    public function show(vhl $vhl)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, vhl $vhl)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(vhl $vhl)
    {
        //
    }
}
