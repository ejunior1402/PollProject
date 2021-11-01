<?php

namespace App\Http\Controllers;

use App\Models\Option;
use App\Models\Poll;
use Illuminate\Http\Request;

class PollController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        return Poll::all()->toJson();
    }

    /*
      {
        "views": 125, "votes": [
            {"option_id": 1, "qty": 10}, {"option_id": 2, "qty": 35}, {"option_id": 3, "qty": 1},
        ] }
     */
    public function stats($id){

        $pool = Poll::findOrFail($id);
        $options = Option::where('poll_id', $id)->get(['option_description', 'qty']);

        $retorno = [
            'poll_id'=>$pool->poll_id,
            'poll_description'=> $pool->poll_description,
            'views'=> $pool->views,
            'votes'=>$options
        ];
        return json_encode($retorno);
        /*
        return Poll::query()->with(array('options' => function($query) {
            $query->select('option_id','qty');
        }))->get(['poll_id','views'])->find($id)->toJson();
        */
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $poll = new Poll();
        $poll->poll_description = $request->poll_description;
        $poll->save();
        $optionsRequest = $request->options;

        for ($i = 0;$i<count($optionsRequest); $i++) {
            if (!isset($optionsRequest[$i]['value'])) {
                if ($optionsRequest[$i] != null && $optionsRequest[$i] != '') {
                    $option = new Option();
                    $option->option_description = $optionsRequest[$i];
                    $option->poll_id = $poll->poll_id;
                    $option->save();
                }
                } else {
                    if ($optionsRequest[$i]['value'] != null && $optionsRequest[$i]['value'] != '') {
                        $option = new Option();
                        $option->option_description = $optionsRequest[$i]['value'];
                        $option->poll_id = $poll->poll_id;
                        $option->save();
                    }
                }

        }


        //return json_encode($optionsRequest);


        $retorno = ['poll_id' => $poll->poll_id];
        return json_encode($retorno);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $pool = Poll::findOrFail($id);
        $pool->views = $pool->views+1;
        $pool->save();

        //return Poll::with(['options'])->get(['poll_id','poll_description'])->find($id)->toJson();
        $options = Option::where('poll_id', $id)->get(['option_id','option_description']);

        $retorno = [
          'poll_id'=>$pool->poll_id,
            'poll_description'=>$pool->poll_description,
            'options'=> $options,
        ];

        return json_encode($retorno);

        /*
        return Poll::query()->with(array('options' => function($query) {
            $query->select('option_id','option_description');
        }))->get(['poll_id','poll_description'])->find($id)->toJson();
        */
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    /*
    public function update(Request $request, $id)
    {

    }
    */

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {
        $retorno = [];
        if (Poll::destroy($id)){
            $retorno = [
              'message' => 'Pool removed',
            ];
        }

        return json_encode($retorno);

    }

}
