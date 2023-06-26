<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        Role::upsert([
            ['role_name' => 'profesor'],
            ['role_name' => 'alumno'],
            ['role_name' => 'administrador'],
        ], ['id']);

        $admin = new User();
        $admin->nombre = 'admin';
        $admin->apellido_paterno = '';
        $admin->apellido_materno = '';
        $admin->email = 'admin@admin.com';
        $admin->password = Hash::make('password');
        $admin->save();

        $admin->roles()->attach(3, ['is_active' => true]);
    }
}
