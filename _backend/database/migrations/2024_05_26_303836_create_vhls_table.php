<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('vhls', function (Blueprint $table) {
            $table->id();
            $table->string("matricule",20)->nullable();
            $table->string("marque",40)->nullable();
            $table->string("type",60)->nullable();
            $table->string("ww",40)->nullable();
            $table->string("chassis",40)->nullable();
            $table->string("puissance",10)->nullable();
            $table->string('date_mc')->nullable();
            $table->string("equipement",20)->nullable();
            $table->string("observation")->nullable()->nullable();
            $table->softDeletes();
            // $table->foreignId('agence_id')
            // ->constrained()->cascadeOnDelete()->cascadeOnUpdate();

            // $table->foreignId('categorie_id')->nullable()
            // ->constrained()->cascadeOnDelete()->cascadeOnUpdate();

            // $table->foreignId('intitule_id')->nullable()
            // ->constrained()->cascadeOnDelete()->cascadeOnUpdate();

            // $table->foreignId('service_id')->nullable()
            // ->constrained()->cascadeOnDelete()->cascadeOnUpdate();

            // $table->foreignId('utilisateur_id')->nullable()
            // ->constrained()->cascadeOnDelete()->cascadeOnUpdate();


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vhls');
    }
};
