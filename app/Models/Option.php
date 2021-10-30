<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Poll;
class Option extends Model
{
    use HasFactory;
    protected $primaryKey = 'option_id';
    protected $fillable = [
      'option_descripton',
    ];

    public function poll(){
        return $this->belongsTo(Poll::class, 'poll_id', 'option_id');
    }
}
