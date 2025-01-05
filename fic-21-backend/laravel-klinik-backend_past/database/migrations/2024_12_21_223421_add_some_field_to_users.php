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
        Schema::table('users', function (Blueprint $table) {
            // role admin, doctor, patient
            $table->string('role')->default('patient');
            $table->string('google_id')->nullable();
            $table->string('ktp_number')->nullable();
            $table->string('birth_date')->nullable();
            $table->string('gender')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('address')->nullable();
            $table->string('certification')->nullable();
            $table->string('telemedice_fee')->nullable();
            $table->string('chat_fee')->nullable();
            $table->string('start_time')->nullable();
            $table->string('end_time')->nullable();
            $table->foreignId('clinic_id')->nullable()->constrained('clinics')->onDelete('set null');
            $table->string('image')->nullable();
            $table->foreignId('specialist_id')->nullable()->constrained('specialists')->onDelete('set null');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
};
