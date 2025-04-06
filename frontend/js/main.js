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
            showGame: false
        }
    },
    methods: {
        startGame() {
            this.showGame = true;
                
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
            
            this.currentJoke = "";
            this.currentJokeType = randomJoke.category === 'Dad' ? 'Dad' : 'AI';
            this.showResult = false;
            
            gsap.to("#joke-text", {
                duration: 1.5,
                text: randomJoke.joke,
                ease: "none",
                delay: 0.3
            });
        },
        makeGuess(guessType) {
            if (guessType.toLowerCase() === this.currentJokeType.toLowerCase()) {
                this.guessResult = 'Correct!';
            } else {
                this.guessResult = 'Wrong!';
            }
            
            this.showResult = true;
        },
        nextJoke() {
            this.getRandomJoke();
        }
    }

}).mount('#app');

