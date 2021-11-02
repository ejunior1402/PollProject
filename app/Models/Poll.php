<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Option;
class Poll extends Model
{
    use HasFactory;
    protected $primaryKey = 'poll_id';
    protected $fillable = [
        'poll_description',
        'views'
    ];
    //Relation map
    public function options(){
        return $this->hasMany(Option::class, 'poll_id', 'poll_id');
    }
    // this is a recommended way to declare event handlers
    public static function boot() {
        parent::boot();

        static::deleting(function($poll) { // before delete() method call this
            $poll->options()->delete();
            // do the rest of the cleanup...
        });
    }
}
