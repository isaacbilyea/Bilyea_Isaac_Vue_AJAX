<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Joke;


class JokeController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function getAll() {
         $jokes = Joke::join('categories', 'jokes.category_id', '=', 'categories.id')->select('jokes.id', 'jokes.joke', 'categories.category', 'categories.image_url')->orderBy('jokes.created_at', 'desc')->get();
         return response()->json($jokes);
     }


     public function getOne($id) {
        $joke = Joke::join('categories', 'jokes.category_id', '=', 'categories.id')->select('jokes.id', 'jokes.joke', 'categories.category', 'categories.image_url')->where('jokes.id', '=', $id)->get();
         return response()->json($joke);
     }


     public function save(Request $request) {
        $this->validate($request, [
            'joke' => 'required|string',
            'category_id' => 'required|exists:categories,id'
        ]);

        $joke = Joke::create([
            'joke' => $request->joke,
            'category_id' => $request->category_id
        ]);

        return response()->json($joke, 201);
    }
    

    // public function update(Request $request, $id) {
    //     $book = Book::findOrFail($id);
    
    //     $this->validate($request, [
    //         'title' => 'required',
    //         'author_id' => 'required',
    //         'published_date' => 'required|date',
    //         'book_image' => 'required'
    //     ]);
    //     $book->update($request->all());
    //     return response()->json($book);
    // }
    
    
    // public function delete($id) {
    //     $book = Book::findOrFail($id);
    //     $book->delete();
    //     return response()->json(null, 204);
    // }
    
}
