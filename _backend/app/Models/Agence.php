<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agence extends Model
{
    use HasFactory;





    public function vhls(){
        return $this->hasMany(Vhl::class);
           }
           
}
