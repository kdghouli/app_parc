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
        Schema::create('kilometrages', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('kilometrage');
            $table->date('date');
            $table->text('observation');
            $table->foreignId('vhl_id')->nullable()
            ->constrained()->cascadeOnDelete()->cascadeOnUpdate();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kilometrages');
    }
};
