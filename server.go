package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

type server struct{}
type Question struct {
	Question_Text string `json:"question_text"`
	Answer        string `json:"answer"`
	Year          int    `json:"question_year"`
	Points        int    `json:"point_value"`
	Category      string `json:"category_name"`
}

type Minigame struct {
	Description string `json: description`
	Order       int    `json: mini_game_order`
}

type jsonResult struct {
	questions Question
}

func (s *server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Open up our database connection.
	db, err := sql.Open("mysql", "root:papa002!@tcp(127.0.0.1:3306)/jeopardy")

	// if there is an error opening the connection, handle it
	if err != nil {
		log.Print(err.Error())
	}
	defer db.Close()

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// Execute the Question query
	results, err := db.Query(`select q.question_text, q.answer, q.question_year, q.point_value, c.category_name from questions as q
    inner join category as c on c.id = q.category_id
	where q.question_year = 2019`)

	var question_list []Question // an empty list

	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}

	for results.Next() {
		var q Question
		// for each row, scan the result into our tag composite object
		err = results.Scan(&q.Question_Text, &q.Answer, &q.Year, &q.Points, &q.Category)

		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
		// and then print out the tag's Name attribute
		question_list = append(question_list, q)
		log.Printf(q.Answer)
	}
	json_q, err := json.Marshal(question_list)
	fmt.Println(string(json_q))

	//////////////////////////////////////////////////////////////////////////////////////////////////////
	// Execute the MINIGAME QUERY
	results_mini_games, err := db.Query(`select description, mini_game_order from Minigame where mini_game_year = 2019`)

	var mini_game_list []Minigame // an empty list

	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}

	for results_mini_games.Next() {
		var m Minigame
		// for each row, scan the result into our tag composite object
		err = results_mini_games.Scan(&m.Description, &m.Order)

		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}

		mini_game_list = append(mini_game_list, m)
	}
	json_m, err := json.Marshal(mini_game_list)
	fmt.Println(string(json_m))

	//Make the final json object
	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")
	w.Write([]byte(`{"minigames":` + string(json_m) + `"questions":` + string(json_q) + `}`))
}

func main() {
	s := &server{}
	http.Handle("/", s)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
