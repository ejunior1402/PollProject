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

    public function options(){
        return $this->hasMany(Option::class, 'option_id', 'poll_id');
    }
}
