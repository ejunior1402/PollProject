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

    /**
     * Display Stats of  poll
     * @param  int  $id
     */
    public function stats($id){

        $poll = Poll::findOrFail($id);
        $options = $poll->options;

        $response = [
            'poll_id'=>$poll->poll_id,
            'poll_description'=> $poll->poll_description,
            'views'=> $poll->views,
            'votes'=>$options
        ];
        return json_encode($response);
    }

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
        $response = ['poll_id' => $poll->poll_id];
        return json_encode($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $poll = Poll::findOrFail($id);
        $poll->views = $poll->views+1;
        $options = $poll->options;
        $poll->save();

        $response = [
          'poll_id'=>$poll->poll_id,
            'poll_description'=>$poll->poll_description,
            'options'=> $options,
        ];

        return json_encode($response);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {
        $response = [];
        if (Poll::destroy($id)){
            $response = [
              'message' => 'Pool removed',
            ];
        }

        return json_encode($response);

    }

}
