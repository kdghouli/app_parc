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
        Schema::create('statu_vhl', function (Blueprint $table) {
            $table->id();

            

            $table->foreignId('statu_id')
            ->nullable()
      ->constrained()
      ->onUpdate('cascade')
      ->onDelete('cascade');

            $table->foreignId('vhl_id')
            ->nullable()
      ->constrained()
      ->onUpdate('cascade')
      ->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('statu_vhls');
    }
};
