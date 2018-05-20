<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Spec;
use App\Http\Resources\SpecResource;

class SpecController extends Controller
{
       /**
     * Return a paginated list of specs.
     *
     * @return SpecResource
     */
    public function index()
    {
        $specs = Spec::latest()
            ->paginate(20);

        return SpecResource::collection($specs); 
    }

    /**
     * Fetch and return the spec.
     *
     * @param Spec $spec
     * @return SpecResource
     */
    public function show(Spec $spec)
    {
        $spec->products = $spec->products()->latest()->paginate(20);
        return new SpecResource($spec);
    }

    /**
     * Validate and save a new spec to the database.
     *
     * @param Request $request
     * @return SpecResource
     */
    public function store(Request $request)
    {
        $spec = $this->validate($request, [
            'name' => 'required|max:50',
        ]);

        $spec = Spec::create($spec);

        return new SpecResource($spec);
    }
}
