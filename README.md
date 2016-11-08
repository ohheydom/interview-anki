
### Database Initialization

Run the following two commands to setup the databases:

```
rake db:create
rake db:migrate
```

### Running

You'll first need an API key from HackerRank, which you can retrieve here: [https://www.hackerrank.com/api/docs](https://www.hackerrank.com/api/docs).

Set the environment variable HACKERRANK\_KEY equal to your API key.

Then run the webserver:

```
rails server
```

### Creating a Challenge

When creating a challenge, you'll notice Boilerplate Code and Starter Code. The Boilerplate section is code that cannot be modified by a user attempting the challenge. It'll be used to read from the standard input and implement a function that'll be defined in the starter code. The starter code will be the code that a user modifies to get the test cases working.

For instance, if you want to create a function that simply prints a given value, your boilerplate code reads from the standard input and the starter code will define a function for the user to implement.

##### BoilerPlate Code

```python
import sys
n = int(sys.stdin.readline())
print_val(n)
```

##### Starter Code

```python
def print_val(v):
  pass # For the user to implement
```

### Using the application

Once you signup, the main profile page lists options to create a challenge, view challenges, or view challenges you've created. You'll also see an area for Today's Challenges. Initially, this will be blank. You'll need to add challenges to your deck in order to attempt them. Once you add a challenge to your deck and attempt it, you'll be given options as to when you want to see the challenge again. When you first add a challenge to your deck, the intervals will be short. As you complete the challenge more and more, intervals will expand to where you'll be given options to not see a challenge for months.

### Todo

- [ ] Change challenge url to contain slug, not id
- [ ] Create all model associations
  * UserChallenge has many Attempts
  * Attempt belongs to UserChallenges, contains code field, user\_challenge\_id
- [ ] Fix model dependencies
  * Deleting a Challenge deletes appropriate Attempts and UserChallenges
  * Deleting a UserChallenge deletes Attempts
- [ ] Challenge Index
  * Display all challenges, dimming ones that are already added to your challenge list
  * Enable adding Challenge to User's Deck
- [ ] Challenge Show
  * Links to past attempts
- [ ] Implement larger test cases
  * Allow uploading files for tests
