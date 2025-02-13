access(all) contract HelloWorld {

    access(all) var greeting: String
    
    access(all) fun changeGreeting(newGreeting: String) { //this is a new function that takes into account the NewGreeting parameter, and it holds its value as a string, and 
  self.greeting = newGreeting //here we set our greeting variable to be NewGreeting. 
}

    init() {
        self.greeting = "Hello, World!"
    }
}

