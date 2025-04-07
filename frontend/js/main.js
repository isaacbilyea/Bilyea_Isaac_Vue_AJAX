const app = Vue.createApp({ 

    created() {
        fetch('http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes')
        .then(response => response.json())
        .then(data => {
            //console.log(data);
            this.jokesData = data;
            this.loadingJokes = false;
        })
        .catch(error => console.error(error));
    },
    data() {
        return {
            jokesData: [],
            currentJoke: '',
            currentJokeType: '',
            loadingJokes: true,
            loading: false,
            guessResult: '',
            showResult: false,
            showGame: false,
            showAllJokes: false,
            allJokes: [],
            loadingAllJokes: false,
            showAddForm: true,
            newJoke: {
                joke: '',
                category_id: '1'
            }
        }
    },
    methods: {
        startGame() {
            this.showGame = true;
            document.body.classList.add('game-active');
                
            const randomIndex = Math.floor(Math.random() * this.jokesData.length);
            const randomJoke = this.jokesData[randomIndex];
            
            this.currentJokeType = randomJoke.category === 'Dad' ? 'Dad' : 'AI';
            
            setTimeout(() => {
                gsap.to("#joke-text", {
                    duration: 1.5,
                    text: randomJoke.joke,
                    ease: "none"
                });
            }, 300);
        },
        
        getJoke(id) {
            this.loading = true;
            fetch(`http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes/${id}`)
            .then(response => response.json())
            .then(data => {
                this.loading = false;
                if(data.length > 0) {
                    const jokeData = data[0];
                    this.joke = jokeData.joke ? jokeData.joke : 'Not Available';
                } else {
                    this.error = 'No joke found';
                }
            })
            .then(document.documentElement.scrollIntoView({ behavior: 'smooth', block: 'end'}))
            .catch(error => console.error(error));
        },
        getRandomJoke() {
            const randomIndex = Math.floor(Math.random() * this.jokesData.length);
            const randomJoke = this.jokesData[randomIndex];
            
            this.currentJokeType = randomJoke.category === 'Dad' ? 'Dad' : 'AI';
            this.showResult = false;
            
            const tl = gsap.timeline();
            tl.to("#joke-text", {
                duration: 0.5,
                text: "",
                ease: "none"
            }).to("#joke-text", {
                duration: 1.5,
                text: randomJoke.joke,
                ease: "none"
            });
        },
        makeGuess(guessType) {
            if (guessType.toLowerCase() === this.currentJokeType.toLowerCase()) {
                this.guessResult = 'Correct!';
            } else {
                this.guessResult = 'Wrong!';
            }
            
            document.body.classList.remove('dad-reveal', 'ai-reveal');
            document.body.classList.add(`${this.currentJokeType.toLowerCase()}-reveal`);
            this.showResult = true;
        },
        nextJoke() {
            document.body.classList.remove('dad-reveal', 'ai-reveal');
            this.getRandomJoke();
        },
        showJokes() {
            this.loadingAllJokes = true;
            this.showAllJokes = true;
            this.showGame = false;
            
            fetch('http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes')
            .then(response => response.json())
            .then(data => {
                this.allJokes = data;
                this.loadingAllJokes = false;
            })
            .catch(error => console.error(error));
        },
        saveJoke() {
            fetch('http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(this.newJoke)
            })
            .then(response => response.json())
            .then(data => {
                // After saving, fetch the complete joke data with category
                return fetch(`http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes/${data.id}`);
            })
            .then(response => response.json())
            .then(data => {
                this.allJokes.unshift(data[0]); 
                this.showAddForm = false;
                this.newJoke.joke = '';
                this.newJoke.category_id = '1';
            })
            .catch(error => console.error(error));
        }
    }

}).mount('#app');

