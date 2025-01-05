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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            // pasien Id
            // $table->foreign('patient_id')->constrained('users')->onDelete('cascade');
            // $table->foreign('doctor_id')->constrained('users')->onDelete('cascade');
            $table->unsignedBigInteger('patient_id');
            $table->foreign('patient_id')->references('id')->on('users')->onDelete('cascade');

            $table->unsignedBigInteger('doctor_id');
            $table->foreign('doctor_id')->references('id')->on('users')->onDelete('cascade');

            $table->unsignedBigInteger('clinic_id');
            $table->foreign('clinic_id')->references('id')->on('clinics')->onDelete('cascade');

            $table->string('service');
            $table->string('price');
            $table->string('payment_url')->nullable();
            $table->string('status')->default('waiting');
            $table->string('duration');
            // $table->foreign('clinic_id')->constrained('clinics')->onDelete('cascade');
            $table->dateTime('schedule');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
