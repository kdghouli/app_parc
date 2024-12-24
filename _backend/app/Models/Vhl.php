<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vhl extends Model
{
    use HasFactory;

    protected $with = ['agence','categorie','statu'];
    protected $fillable=['matricule','marque','date_mc','agence_id','intitule_id','categorie_id','utilisateur_id'];
   



    public function agence(){

        return $this->belongsTo(Agence::class);


     }

     public function categorie(){

        return $this->belongsTo(Categorie::class);


     }

     public function statu()
     {
         return $this->belongsToMany(Statu::class)->withTimestamps();
     }




}
