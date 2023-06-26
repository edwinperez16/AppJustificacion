<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Grupo;
use Illuminate\Http\Request;
use Laravel\Sanctum\PersonalAccessToken;

class GrupoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function indexWithUsers(Request $request)
    {
        $request->validate([
            'param' => ['nullable', 'string']
        ]);

        $token = $request->bearerToken();
		$authUser = PersonalAccessToken::findToken($token)->tokenable;
        $sql = Grupo::query();
        $param = $request->query('param');

        if($param) {
            $sql->where('nombre', $param)->orWhere('id', $param);
        }


        if (
            $authUser->roles()->where('role_name', 'profesor')->exists()
        ) {
            $sql->with([
                'users' => function($query) {
                    $query->whereHas('roles', function ($query) {
                        $query->where('role_name', 'alumno');
                    });
                }
            ]);
            return $sql->get();
        }

        if (
            $authUser->roles()->where('role_name', 'alumno')->exists()
        ) {
            $sql->with([
                'users' => function($query) {
                    $query->whereHas('roles', function ($query) {
                        $query->where('role_name', 'profesor');
                    });
                }
            ]);
            return $sql->get();
        }

        return $sql->with(['users.roles'])->get();
    }

    public function indexWithoutAuth() {
        return Grupo::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => ['required', 'string'],
            'semestre' => ['required', 'string'],
            'carrera' => ['required', 'string'],
            'aula' => ['required', 'string']
        ]);

        $grupo = new Grupo();
        $grupo->fill($request->only([
            'nombre',
            'semestre',
            'carrera',
            'aula'
        ]));

        if($grupo->save()) {
            return response()->json([
                'success' => true,
                'message' => '!Grupo Creado!'
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => '!Error al crear!'
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        return Grupo::find($id);
    }

    /**
     * Update the specified resource in storage.
     */
        public function update(Request $request, int $id)
    {
        $request->validate([
            'nombre' => ['required', 'string'],
            'semestre' => ['required', 'string'],
            'carrera' => ['required', 'string'],
            'aula' => ['required', 'string']
        ]);

        $grupo = Grupo::find($id);

        if(!$grupo) {
            abort(404);
        }

        $grupo->fill($request->only([
            'nombre',
            'semestre',
            'carrera',
            'aula'
        ]));

        if($grupo->save()) {
            return response()->json([
                'success' => true,
                'message' => '!Grupo Actualizado!'
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => '!Error al actualizar!'
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $grupo = Grupo::find($id);

        if(!$grupo) {
            abort(404);
        }

        if($grupo->delete()) {
            return response()->json([
                'success' => true,
                'message' => '!Grupo Eliminado!'
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => '!Error al eliminar!'
        ]);
    }
}
