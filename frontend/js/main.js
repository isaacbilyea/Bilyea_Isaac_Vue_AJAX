const app = Vue.createApp({ 
    created() {
        fetch('http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes')
        .then(response => response.json())
        .then(data => {
            if(data.length > 0) {
                this.jokesData = data;
                this.loadingJokes = false;
            } else {
                this.errors = "No jokes found";
                this.loadingJokes = false;
            }
        })
        .catch(error => {
            console.error(error);
            this.errors = "Failed to load jokes";
            this.loadingJokes = false;
        });
    },

    data() {
        return {
            //Game Properties
            jokesData: [],
            showGame: false,
            showResult: false,
            currentJoke: '',
            currentJokeType: '',
            guessResult: '',
            score: 0,
            totalGuesses: 0,
            //All Jokes Properties
            allJokes: [],
            showAllJokes: false,
            showAddForm: true,
            newJoke: {
                joke: '',
                category_id: '1'
            },
            selectedJoke: '',
            //Loading & Error States
            errors: '',
            loading: false,
            loadingJokes: true,
            loadingAllJokes: false
        }
    },

    methods: {
        resetToLanding() {
            this.showGame = false;
            this.showAllJokes = false;
            this.getRandomJoke();
            document.body.classList.remove('game-active', 'dad-reveal', 'ai-reveal');
        },

        //Game Methods
        startGame() {
            this.score = 0;
            this.totalGuesses = 0;
            this.showGame = true;
            document.body.classList.add('game-active');
            this.getRandomJoke();
        },
        
        getRandomJoke() {
            const randomIndex = Math.floor(Math.random() * this.jokesData.length);
            const randomJoke = this.jokesData[randomIndex];
            
            const jokeCategory = randomJoke.category === 'Dad' ? 'Dad' : 'AI';
            this.currentJokeType = jokeCategory;
            this.showResult = false;
        
            setTimeout(() => {
                const charsPerSecond = 40;
                const duration = randomJoke.joke.length / charsPerSecond;
                
                gsap.to("#joke-text", {
                    duration: duration,
                    text: `"${randomJoke.joke}"`,
                    ease: "none"
                });
            }, 300);
        },

        makeGuess(guessType) {
            this.totalGuesses++;
            if (guessType === this.currentJokeType.toLowerCase()) {
                this.guessResult = 'Correct!';
                this.score++;
            } else {
                this.guessResult = 'Wrong!';
            }
            
            document.body.classList.remove('dad-reveal', 'ai-reveal');
            document.body.classList.add(`${this.currentJokeType.toLowerCase()}-reveal`);
            this.showResult = true;
        },

        nextJoke() {
            document.body.classList.remove('dad-reveal', 'ai-reveal');
            const jokeText = document.querySelector("#joke-text");

            gsap.to(jokeText, {
                opacity: 0,
                duration: 0.1,
                onComplete: () => {
                    jokeText.textContent = "";
                    gsap.set(jokeText, { opacity: 1 });
                    this.getRandomJoke();
                }
            });
        },

        //All Jokes Methods
        showJokes() {
            this.loadingAllJokes = true;
            this.showAllJokes = true;
            
            fetch('http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes')
            .then(response => response.json())
            .then(data => {
                if (data.length > 0) {
                    this.allJokes = data;
                } else {
                    this.errors = "No jokes found";
                }
                this.loadingAllJokes = false;
            })
            .catch(error => {
                console.error(error);
                this.errors = "Failed to load jokes";
                this.loadingAllJokes = false;
            });
        },
        
        addJoke() {
            if (this.newJoke.joke.trim() === "") {
                this.errors = "Please enter a joke";
                return;
            }

            this.loading = true;
            this.errors = '';
            
            fetch('http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(this.newJoke)
            })
            .then(response => response.json())
            .then(data => {
                if(data) {
                    const category = this.newJoke.category_id === '1' ? 'Dad' : 'AI';
                    const imageUrl = category.toLowerCase() + '.png';
                
                    this.allJokes.unshift({
                        id: data.id,
                        joke: data.joke,
                        category: category,
                        image_url: imageUrl
                    });

                    this.newJoke.joke = '';
                    this.newJoke.category_id = '1';
                } else {
                    this.errors = "Failed to add joke";
                }
                this.loading = false;
            })
            .catch(error => {
                console.error(error);
                this.errors = "Failed to add joke";
                this.loading = false;
            });
        },

        showJokeDetail(joke) {
            this.loading = true;
            this.errors = '';
            
            fetch(`http://localhost:8888/Bilyea_Isaac_Vue_AJAX/backend/public/jokes/${joke.id}`)
            .then(response => response.json())
            .then(data => {
                if(data.length > 0) {
                    this.selectedJoke = data[0];
                } else {
                    this.errors = "No joke found";
                }
                this.loading = false;
                
                gsap.from("#modal-content", {
                    scale: 0,
                    opacity: 0,
                    duration: 0.2,
                    ease: "back.out(1.7)"
                });
            })
            .catch(error => {
                console.error(error);
                this.errors = "Failed to load joke details";
                this.loading = false;
            });
        },

        closeModal() {
            gsap.to("#modal-content", {
                scale: 0,
                opacity: 0,
                duration: 0.2,
                ease: "power2.in",
                onComplete: () => {
                    this.selectedJoke = '';
                }
            });
        }
    }
}).mount('#app');