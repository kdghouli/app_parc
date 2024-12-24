<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Statu extends Model
{
    use HasFactory;

    public function vhl()
    {
        return $this->belongsToMany(Vhl::class)->withTimestamps();
    }
}
